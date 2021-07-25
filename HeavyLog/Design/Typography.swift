//
//  Typography.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/07/2021.
//

import SwiftUI

extension Text {

    var textBodyMedium: Text {
        self.textBody
            .fontWeight(.medium)
            .foregroundColor(.textMainBold)
    }

    var textBodyNormal: Text {
        self.textBody
            .fontWeight(.regular)
            .foregroundColor(.textMainNormal)
    }

    var textBodyThin: Text {
        self.textBody
            .fontWeight(.regular)
            .foregroundColor(.textMainThin)
    }

    var textHeadlineBig: Text {
        self.font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.textMainLight)
    }

    var textHeadlineSmall: Text {
        self.font(.subheadline.smallCaps())
            .fontWeight(.medium)
            .foregroundColor(.textMainLight)
    }

    var textFootnoteMain: Text {
        self.font(.subheadline.smallCaps())
            .fontWeight(.light)
            .foregroundColor(.textMainNormal)
    }

    var textOutstanding: Text {
        self.font(.custom("Poppins-Black", size: 15))
    }

    private var textBody: Text {
        self.font(.callout)
    }
}

extension Color {

    static var textMainBold: Color {
        AppColor.textMainBold.color
    }

    static var textMainNormal: Color {
        AppColor.textMainNormal.color
    }

    static var textMainLight: Color {
        AppColor.textMainLight.color
    }

    static var textMainThin: Color {
        AppColor.textMainThin.color
    }
}
