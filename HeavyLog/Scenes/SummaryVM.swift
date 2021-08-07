//
//  SummaryVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 29/07/2021.
//

import Foundation

final class SummaryVM: ObservableObject {

    @Published var baseListVM: BaseListVM!
    @Published var listItemVM: BaseListRowViewData?

    init() {
        baseListVM = BaseListVM(parent: self)
        baseListVM.rows = [.sampleC1, .sampleC2, .sampleC3]
    }
}

extension SummaryVM: BaseListSupport {

    func open(_ row: BaseListRowViewData) {
        listItemVM = row
    }
}
