//
//  PopupModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Foundation

enum PopupModel {
    case info(title: String, message: String)
    case action(title: String, message: String, action: () -> Void)

    var title: String {
        switch self {
        case let .info(title, _),
             let .action(title, _, _):
            return title
        }
    }

    var message: String? {
        switch self {
        case let .info(_, message),
             let .action(_, message, _):
            return message
        }
    }

    var action: (() -> Void)? {
        switch self {
        case let .action(_, _, action):
            return action
        default:
            return nil
        }
    }
}


// MARK: - Sample Data

extension PopupModel {
    static let sampleInfo = PopupModel.info(title: "Title", message: "Lorem ipsum dolor sit amet, consect a dipiscing elit. Ut vel neque lont.")
    static let sampleAction = PopupModel.action(title: "Print something", message: "Are you sure you want to print something in the console?", action: { print("Something was printed.") })
}
