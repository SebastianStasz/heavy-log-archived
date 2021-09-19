//
//  LocalizedString.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Foundation

public enum LocalizedString: String {
    case common_ok
    case common_cancel
    case common_close
    case common_delete
    case common_empty
    case common_showAll

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

    case common_exerciseSection_upper
    case common_exerciseSection_lower
    case common_exerciseSection_global

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

    case common_bodyParameter_height
    case common_bodyParameter_weight
    case common_bodyParameter_waistline
    case common_bodyParameter_hips
    case common_bodyParameter_thigh
    case common_bodyParameter_calf

    case workoutCreator_chooseTemplate
    case workoutCreator_tab_workout
    case workoutCreator_tab_info
    case workoutCreator_exerciseList_title
    case workoutCreator_enterWeight
    case workoutCreator_numberOfReps
    case workoutCreator_deleteWorkout_title
    case workoutCreator_deleteWorkout_message
    case workoutCreator_addExercise
    case workoutCreator_finishWorkout

    case validation_message_empty
    case validation_message_invalid
    case validation_message_tooShort
    case validation_message_tooLong
    case validation_message_tooSmall
    case validation_message_tooBig
}

public extension LocalizedString {

    var key: String { rawValue }

    var text: String {
        rawValue.localize()
    }
}
