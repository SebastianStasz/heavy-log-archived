//
//  SummaryVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 29/07/2021.
//

import CoreData
import HeavyLogCoreData
import Foundation

final class SummaryVM: ObservableObject {

    private let context: NSManagedObjectContext
    @Published var baseListVM: BaseListVM!
    @Published var listItemVM: BaseListRowViewData?

    init(context: NSManagedObjectContext = AppController.shared.context) {
        self.context = context
        baseListVM = BaseListVM(parent: self)
        loadData()
    }

    private func loadData() {
        var rows: [BaseListRowViewData] = []
        for parameter in BodyParameter.possibleCases {
            let parameterValue = parameter.getLastValue(in: context)
            let value = parameterValue != nil ? String(parameterValue!) : "--"
            let row = BaseListRowViewData(title: parameter.name, value: value, isClicable: parameter.isClicable)
            rows.append(row)
        }
        baseListVM.rows = rows
    }
}

extension SummaryVM: BaseListSupport {

    func open(_ row: BaseListRowViewData) {
        listItemVM = row
    }
}

extension BodyParameter {
    var isClicable: Bool {
        self == .height ? false : true
    }
}
