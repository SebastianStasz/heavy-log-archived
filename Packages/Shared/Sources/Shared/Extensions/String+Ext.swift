//
//  String+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/08/2021.
//

import SwiftUI

public extension String {
    
    /// Returns a localized string, using the main bundle.
    func localize() -> String {
        NSLocalizedString(self, bundle: .main, comment: self)
    }

    /// A Boolean value indicating whether a string has characters.
    var isNotEmpty: Bool {
        !self.isEmpty
    }

    static var common_ok: String {
        LocalizedString.common_ok.text
    }

    static var common_cancel: String {
        LocalizedString.common_cancel.text
    }

    static var common_empty: String {
        LocalizedString.common_empty.text
    }

    static var common_showAll: String {
        LocalizedString.common_showAll.text
    }

    static var workoutCreator_chooseTemplate: String {
        LocalizedString.workoutCreator_chooseTemplate.text
    }

    static var workoutCreator_exerciseList_title: String {
        LocalizedString.workoutCreator_exerciseList_title.text
    }

    static var workoutCreator_enterWeight: String {
        LocalizedString.workoutCreator_enterWeight.text
    }

    static var workoutCreator_numberOfReps: String {
        LocalizedString.workoutCreator_numberOfReps.text
    }

    static var workoutCreator_deleteWorkout_title: String {
        LocalizedString.workoutCreator_deleteWorkout_title.text
    }

    static var workoutCreator_deleteWorkout_message: String {
        LocalizedString.workoutCreator_deleteWorkout_message.text
    }

    static var workoutCreator_addExercise: String {
        LocalizedString.workoutCreator_addExercise.text
    }

    static var workoutCreator_finishWorkout: String {
        LocalizedString.workoutCreator_finishWorkout.text
    }
}
