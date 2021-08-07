//
//  BodyPart.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

enum BodyPart {
    case calves
    case quadriceps
    case hamstrings
    case glutes
    case abdominalOblique
    case rectusAbdominis
    case lowerBack
    case upperBack
    case traps
    case anteriorDeltoid
    case medialDeltoid
    case rearDeltoid
    case chest
    case biceps
    case triceps
    case forearms
    case neck

    var name: LocalizedStringKey {
        switch self {
        case .calves:
            return LocalizedString.common_bodyPart_calves.key
        case .quadriceps:
            return LocalizedString.common_bodyPart_quadriceps.key
        case .hamstrings:
            return LocalizedString.common_bodyPart_hamstrings.key
        case .glutes:
            return LocalizedString.common_bodyPart_glutes.key
        case .abdominalOblique:
            return LocalizedString.common_bodyPart_abdominalOblique.key
        case .rectusAbdominis:
            return LocalizedString.common_bodyPart_rectusAbdominis.key
        case .lowerBack:
            return LocalizedString.common_bodyPart_lowerBack.key
        case .upperBack:
            return LocalizedString.common_bodyPart_upperBack.key
        case .traps:
            return LocalizedString.common_bodyPart_traps.key
        case .anteriorDeltoid:
            return LocalizedString.common_bodyPart_anteriorDeltoid.key
        case .medialDeltoid:
            return LocalizedString.common_bodyPart_medialDeltoid.key
        case .rearDeltoid:
            return LocalizedString.common_bodyPart_rearDeltoid.key
        case .chest:
            return LocalizedString.common_bodyPart_chest.key
        case .biceps:
            return LocalizedString.common_bodyPart_biceps.key
        case .triceps:
            return LocalizedString.common_bodyPart_triceps.key
        case .forearms:
            return LocalizedString.common_bodyPart_forearms.key
        case .neck:
            return LocalizedString.common_bodyPart_neck.key
        }
    }
}
