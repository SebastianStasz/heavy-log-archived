//
//  AppColor.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/07/2021.
//

import SwiftUI

enum AppColor {
    private typealias design = ColorDesign

    case backgroundMain
    case backgroundSecondary

    case accentMain
    case accentGrayMain

    case textMainBold
    case textMainNormal
    case textMainLight
    case textMainThin

    case accentGreen
    case accentRed
    case accentOrange
    case accentGreenLight
    case accentRedLight
    case accentOrangeLight

    var color: Color {
        switch self {
        case .backgroundMain:
            return Color(.secondarySystemBackground)
        case .backgroundSecondary:
            return Color(.systemBackground)

        case .accentMain:
            return Color("accentMain")
        case .accentGrayMain:
            return Color("accentGrayMain")

        case .textMainBold:
            return .primary
        case .textMainNormal:
            return design.gray500.color
        case .textMainLight:
            return design.gray400.color
        case .textMainThin:
            return design.gray500_05.color

        case .accentGreen:
            return Color("accentGreen")
        case .accentRed:
            return Color("accentRed")
        case .accentOrange:
            return Color("accentOrange")
        case .accentGreenLight:
            return Color("accentGreenLight")
        case .accentRedLight:
            return Color("accentRedLight")
        case .accentOrangeLight:
            return Color("accentOrangeLight")
        }
    }
}

private enum ColorDesign {
    typealias design = Self

    case gray500
    case gray400
    case gray500_05

    var color: Color {
        switch self {
        case .gray500:
            return Color("gray500")
        case .gray400:
            return Color("gray400")
        case .gray500_05:
            return design.gray500.color.opacity(0.5)
        }
    }
}
