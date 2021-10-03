//
//  SFSymbol.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Foundation

public enum SFSymbol: String {
    case settings   = "gearshape"
    case tabBarTab1 = "house"
    case tabBarTab2 = "speedometer"
    case tabBarTab3 = "calendar"
    case tabBarTab4 = "menucard"
    case workoutCreatorWorkoutTab = "doc.text.magnifyingglass"
    case workoutCreatorInfoTab    = "pencil.circle"
}

public extension SFSymbol {
    var name: String { rawValue }
}
