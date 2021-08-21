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

    var rows: [BaseListRowViewData] = []
    private unowned let parent: BaseListSupport

    init(parent: BaseListSupport) {
        self.parent = parent
    }

    func open(_ row: BaseListRowViewData) {
        parent.open(row)
    }
}
