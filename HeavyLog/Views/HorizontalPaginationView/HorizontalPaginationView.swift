//
//  HorizontalPaginationView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

struct HorizontalPaginationView<Content: View, T: Identifiable>: View {

    @ObservedObject private var viewModel: HorizontalPaginationVM<T>
    private var itemView: (T) -> Content

    init(viewModel: HorizontalPaginationVM<T>, @ViewBuilder itemView: @escaping (T) -> Content) {
        self.viewModel = viewModel
        self.itemView = itemView
    }

    // MARK: - View

    var body: some View {
        HStack(spacing: viewModel.spacing) {
            ForEach(viewModel.items, content: itemView)
                .frame(width: viewModel.tileWidth)
                .offset(x: viewModel.offset)
                .gesture(dragGesture)
        }
        .padding(.horizontal, .spacingMedium)
    }

    // MARK: Interactions

    private var dragGesture: _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged { gesture in
                withAnimation(.easeInOut) {
                    viewModel.dragOnChanged(shift: gesture.translation.width)
                }
            }
            .onEnded { gesture in
                withAnimation(.easeInOut) {
                    viewModel.dragOnEnded(shift: gesture.translation.width)
                }
            }
    }
}


// MARK: - Preview

struct HorizontalPaginationView_Previews: PreviewProvider {
    static var previews: some View {

        let vm = HorizontalPaginationVM<RecordTile>(items: [.powerliftingX1, .powerliftingX3, .powerliftingX5, .squat], tileWidth: 290)

        NavigationView {
            VStack {
                HorizontalPaginationView(viewModel: vm, itemView: RecordTileView.init)
                Spacer()
            }
            .padding(.top, 16)
            .navigationTitle("Horizontal Pagination")
            .infiniteFrame()
            .backgroundIgnoringSafeArea(Color(.systemGroupedBackground))
        }
    }
}
