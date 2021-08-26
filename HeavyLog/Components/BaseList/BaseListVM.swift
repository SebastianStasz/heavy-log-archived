//
//  BaseListVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 29/07/2021.
//

import Foundation

protocol BaseListSupport: AnyObject {
    func open(_ row: BaseListRowViewData)
}

final class BaseListVM: ObservableObject {

    @Published var rows: [BaseListRowViewData] = []
    private unowned let parent: BaseListSupport?

    init(parent: BaseListSupport? = nil) {
        self.parent = parent
    }

    func open(_ row: BaseListRowViewData) {
        guard let parent = getParent() else { return }
        parent.open(row)
    }

    private func getParent() -> BaseListSupport? {
        guard let parent = parent else {
            assertionFailure("Clickable row used without specifying parent view model.")
            return nil
        }
        return parent
    }
}
