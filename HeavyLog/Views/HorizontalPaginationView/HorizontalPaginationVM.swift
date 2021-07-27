//
//  HorizontalPaginationVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Combine
import SwiftUI

final class HorizontalPaginationVM<T: Identifiable>: ObservableObject {

    @Published private var page = 1
    @Published private(set) var items: [T] = []
    @Published private(set) var offset: CGFloat = 0
    @Published private var previousOffset: CGFloat = 0

    let spacing: CGFloat
    private(set) var tileWidth: CGFloat = 0

    private var numOfTiles = 0
    private var penultimateTile = 0
    private var swipeForce: CGFloat = 0
    private var centerSwipe: CGFloat = 0
    private var borderSwipe: CGFloat = 0
    private var cancellable: Cancellable?

    init(items: [T], tileWidth: CGFloat, spacing: CGFloat = .spacingMedium) {
        self.spacing = spacing
        setupSwiping(tileWidth: tileWidth, spacing: spacing)
        self.items = items
    }

    private var isTileOnRight: Bool { page != numOfTiles }
    private var isTileOnLeft: Bool { page != 1 }

    // MARK: - External Access

    func changeItems(to items: [T]) {
        withAnimation(.easeInOut) {
            self.items = items
        }
    }

    func dragOnChanged(shift: CGFloat) {
        if shift <= 0 && isTileOnRight || shift >= 0 && isTileOnLeft {
            offset = previousOffset + shift * 0.8
        } else {
            offset = previousOffset + shift * 0.8 - 0.6 * shift
        }
    }

    func dragOnEnded(shift: CGFloat) {
        if shift <= -swipeForce && isTileOnRight {
            changePage(to: .next)
        } else if shift >= swipeForce && isTileOnLeft {
            changePage(to: .previous)
        } else {
            backToPreviousOffset()
        }
    }

    // MARK: - Swiping Logic

    private func changePage(to swipe: Destination) {
        let isNext = swipe == .next

        offset = swipe.willBeEdgeTile(page: page, penultimateTile: penultimateTile)
            ? previousOffset + (isNext ? -borderSwipe : borderSwipe)
            : previousOffset + (isNext ? -centerSwipe : centerSwipe)

        previousOffset = offset
        page += isNext ? 1 : -1
    }

    private func backToPreviousOffset() {
        offset = previousOffset
    }

    private enum Destination {
        case next
        case previous

        func willBeEdgeTile(page: Int, penultimateTile: Int) -> Bool {
            switch self {
            case .next:
                return page >= 2 && page < penultimateTile
            case .previous:
                return page > 2 && page <= penultimateTile
            }
        }
    }

    // MARK: - Swiping Setup

    private func setupSwiping(tileWidth: CGFloat, spacing: CGFloat) {
        cancellable = $items.sink { [weak self] items in
            guard let self = self else { return }

            let numOfTiles = items.count
            let doubleSpacing = spacing * 2
            let isEven = numOfTiles % 2 == 0
            let width = numOfTiles == 1 ? UIScreen.width - doubleSpacing : tileWidth
            let tilesSpacing = spacing * CGFloat(numOfTiles - 1) / 2
            let swipePaddingOffset = (UIScreen.width - width - doubleSpacing) / 2 - doubleSpacing
            let startPaddingOffset = (UIScreen.width - (isEven ? 0 : width) - doubleSpacing) / 2 - tilesSpacing
            let offset = CGFloat(numOfTiles / 2) * width - startPaddingOffset

            self.page = 1
            self.offset = offset
            self.previousOffset = offset
            self.tileWidth = width
            self.numOfTiles = numOfTiles
            self.penultimateTile = numOfTiles - 1
            self.swipeForce = tileWidth / 2 - spacing
            self.centerSwipe = tileWidth - spacing - swipePaddingOffset + (numOfTiles == 2 ? -doubleSpacing : 0)
            self.borderSwipe = tileWidth + spacing
        }
    }
}
