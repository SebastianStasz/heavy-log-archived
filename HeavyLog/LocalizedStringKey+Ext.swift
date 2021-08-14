//
//  LocalizedStringKey+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

enum LocalizedString: String {
    case tab_dashboard_title
    case tab_workouts_title
    case tab_summary_title
    case tab_settings_title

    case common_workoutRate_bad
    case common_workoutRate_good
    case common_workoutRate_excelent

    case common_motivation_message_1
    case common_motivation_message_2

    case common_difficulty_easy
    case common_difficulty_moderate
    case common_difficulty_hard

    case common_exerciseType_push
    case common_exerciseType_pull
    case common_exerciseType_static

    case error_enum_unknown

    case common_bodyPart_calves
    case common_bodyPart_quadriceps
    case common_bodyPart_hamstrings
    case common_bodyPart_glutes
    case common_bodyPart_abdominalOblique
    case common_bodyPart_rectusAbdominis
    case common_bodyPart_lowerBack
    case common_bodyPart_upperBack
    case common_bodyPart_traps
    case common_bodyPart_anteriorDeltoid
    case common_bodyPart_medialDeltoid
    case common_bodyPart_rearDeltoid
    case common_bodyPart_chest
    case common_bodyPart_biceps
    case common_bodyPart_triceps
    case common_bodyPart_forearms
    case common_bodyPart_neck

    var key: String {
        self.rawValue
    }
}
