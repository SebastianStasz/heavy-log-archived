//
//  BaseListRow.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 27/07/2021.
//

import SwiftUI

struct BaseListRow {
    let id = UUID()
    let title: LocalizedStringKey
    let value: LocalizedStringKey
    let image: Image?
    let isClicable: Bool

    init(title: LocalizedStringKey, value: LocalizedStringKey, image: Image? = nil, isClicable: Bool = false) {
        self.title = title
        self.value = value
        self.image = image
        self.isClicable = isClicable
    }
}

extension BaseListRow: Identifiable {}

// MARK: - Initializers

extension BaseListRow {

    init(title: LocalizedStringKey, value: LocalizedStringKey, sfSymbol: String) {
        self.init(title: title, value: value, image: Image(systemName: sfSymbol))
    }
}

// MARK: - Sample Data

extension BaseListRow {
    static let sample1 = BaseListRow(title: "Date", value: "20 July 2021")
    static let sample2 = BaseListRow(title: "Started", value: "17:03")
    static let sample3 = BaseListRow(title: "Duration", value: "01:27")
    static let sampleC1 = BaseListRow(title: "Height", value: "178 cm", isClicable: true)
    static let sampleC2 = BaseListRow(title: "Weight", value: "82 kg", isClicable: true)
    static let sampleC3 = BaseListRow(title: "Waistline", value: "66 cm", isClicable: true)
    static let sampleC4 = BaseListRow(title: "Chest", value: "90 cm", isClicable: true)
}
