//
//  File.swift
//  
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Foundation

public enum SFSymbol {
    case workoutCreatorWorkoutTab
    case workoutCreatorInfoTab

    public var name: String {
        switch self {
        case .workoutCreatorWorkoutTab:
            return "doc.text.magnifyingglass"
        case .workoutCreatorInfoTab:
            return "pencil.circle"
        }
    }
}
