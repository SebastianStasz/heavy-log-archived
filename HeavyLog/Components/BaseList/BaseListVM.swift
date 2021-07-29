//
//  BaseListVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 29/07/2021.
//

import Foundation

protocol BaseListSupport: AnyObject {
    func open(_ row: BaseListRow)
}

final class BaseListVM: ObservableObject {

    var rows: [BaseListRow] = []
    private unowned let parent: BaseListSupport

    init(parent: SummaryVM) {
        self.parent = parent
    }

    func open(_ row: BaseListRow) {
        parent.open(row)
    }
}
