//
//  AppError.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 08/08/2021.
//

import Foundation

public enum AppError: Error {
    case decodingError(Error)
    case urlError(Error)

    public var description: String {
        switch self {
        case let .decodingError(error), let .urlError(error):
            return error.localizedDescription
        }
    }

    public var error: Error {
        switch self {
        case let .decodingError(error), let .urlError(error):
            return error
        }
    }
}
