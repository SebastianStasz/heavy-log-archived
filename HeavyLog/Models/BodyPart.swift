//
//  BodyPart.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

enum BodyPart: String {
    case calves
    case quadriceps
    case hamstrings
    case glutes
    case abdominalOblique = "abdominal_oblique"
    case rectusAbdominis = "rectus_abdominis"
    case lowerBack = "lower_back"
    case upperBack = "upper_back"
    case traps
    case anteriorDeltoid = "anterior_deltoid"
    case medialDeltoid = "medial_deltoid"
    case rearDeltoid = "rear_deltoid"
    case chest
    case biceps
    case triceps
    case forearms
    case neck
    case unknown

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
        case .unknown:
            return LocalizedString.error_enum_unknown.key
        }
    }
}

extension BodyPart: Decodable {}

extension BodyPart: UnknownValueSupport {
    static var unknownCase: BodyPart { .unknown }
}
