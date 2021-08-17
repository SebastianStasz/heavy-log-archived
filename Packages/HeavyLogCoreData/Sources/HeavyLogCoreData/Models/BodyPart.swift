//
//  BodyPart.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI
import Shared

public enum BodyPart: String {
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

    public var name: String {
        nameLocalized.key.localize()
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .calves:
            return LocalizedString.common_bodyPart_calves
        case .quadriceps:
            return LocalizedString.common_bodyPart_quadriceps
        case .hamstrings:
            return LocalizedString.common_bodyPart_hamstrings
        case .glutes:
            return LocalizedString.common_bodyPart_glutes
        case .abdominalOblique:
            return LocalizedString.common_bodyPart_abdominalOblique
        case .rectusAbdominis:
            return LocalizedString.common_bodyPart_rectusAbdominis
        case .lowerBack:
            return LocalizedString.common_bodyPart_lowerBack
        case .upperBack:
            return LocalizedString.common_bodyPart_upperBack
        case .traps:
            return LocalizedString.common_bodyPart_traps
        case .anteriorDeltoid:
            return LocalizedString.common_bodyPart_anteriorDeltoid
        case .medialDeltoid:
            return LocalizedString.common_bodyPart_medialDeltoid
        case .rearDeltoid:
            return LocalizedString.common_bodyPart_rearDeltoid
        case .chest:
            return LocalizedString.common_bodyPart_chest
        case .biceps:
            return LocalizedString.common_bodyPart_biceps
        case .triceps:
            return LocalizedString.common_bodyPart_triceps
        case .forearms:
            return LocalizedString.common_bodyPart_forearms
        case .neck:
            return LocalizedString.common_bodyPart_neck
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }
}

extension BodyPart: Decodable {}

extension BodyPart: UnknownValueSupport {
    public static var unknownCase: BodyPart { .unknown }
}
