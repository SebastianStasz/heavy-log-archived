//
//  File.swift
//  
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation
import Shared

public enum BodyParameter: String {
    case height
    case weight
    case waistline
    case chest
    case biceps
    case hips
    case thigh
    case calf
    case unknown

    public var name: String {
        nameLocalized.key.localize()
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .height:
            return LocalizedString.common_bodyParameter_height
        case .weight:
            return LocalizedString.common_bodyParameter_weight
        case .waistline:
            return LocalizedString.common_bodyParameter_waistline
        case .chest:
            return LocalizedString.common_bodyPart_chest
        case .biceps:
            return LocalizedString.common_bodyPart_biceps
        case .hips:
            return LocalizedString.common_bodyParameter_hips
        case .thigh:
            return LocalizedString.common_bodyParameter_thigh
        case .calf:
            return LocalizedString.common_bodyParameter_calf
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }
}

extension BodyParameter: UnknownValueSupport {
    public static var unknownCase: BodyParameter { .unknown }
}
