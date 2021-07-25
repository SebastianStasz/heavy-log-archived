//
//  TabBarPopup.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Foundation

extension TabBarModel {
    enum Popup {
        case first
        case second
        case third

        var title: String {
            switch self {
            case .first:
                return "First"
            case .second:
                return "Second"
            case .third:
                return "Third"
            }
        }

        var image: String {
            switch self {
            case .first:
                return "lock"
            case .second:
                return "lock"
            case .third:
                return "lock"
            }
        }
    }
}

// MARK: - Helpers

extension TabBarModel.Popup: CaseIterable {}
