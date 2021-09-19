//
//  Typography.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/07/2021.
//

import SwiftUI

public extension Text {

    // MARK: - Headlines

    var textHeadlineBigBold: Text {
        self.font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.basicPrimaryInverted)
    }

    var textHeadlineBig: Text {
        self.font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.grayDarkSecondary)
    }

    var textHeadlineSmall: Text {
        self.font(.subheadline.smallCaps())
            .fontWeight(.medium)
            .foregroundColor(.grayDarkSecondary)
    }

    // MARK: - Body

    var textBodyBold: Text {
        self.textBody
            .fontWeight(.bold)
            .foregroundColor(.basicPrimaryInverted)
    }

    var textBodyMedium: Text {
        self.textBody
            .fontWeight(.medium)
            .foregroundColor(.basicPrimaryInverted)
    }

    var textBodyNormal: Text {
        self.textBody
            .fontWeight(.regular)
            .foregroundColor(.grayDarkPrimary)
    }

    var textBodyThin: Text {
        self.textBody
            .fontWeight(.regular)
            .foregroundColor(.grayDarkPrimary05)
    }

    // MARK: - Other

    var textFootnoteMain: Text {
        self.font(.subheadline.smallCaps())
            .fontWeight(.light)
            .foregroundColor(.grayDarkPrimary)
    }

    var textValidation: Text {
        self.font(.footnote)
            .fontWeight(.light)
            .foregroundColor(.accentRed)
    }

    var textOutstanding: Text {
        self.font(.custom("Poppins-Black", size: 15))
    }

    private var textBody: Text {
        self.font(.callout)
    }
}

public extension ButtonStyleConfiguration.Label {
    var textBodyBold: some View {
        self.font(.callout.weight(.bold))
    }
}
