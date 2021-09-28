//
//  DesignGroup.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

public struct DesignGroup: ViewModifier {

    var title: String

    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider().padding(.vertical, .spacingMedium)
            
            VStack(alignment: .leading, spacing: .spacingBig) {
                Text(title).textDesignTitle

                VStack(alignment: .leading, spacing: .spacingMedium) {
                    content
                }
            }
        }
    }
}

public extension View {
    func designGroup(_ title: String) -> some View {
        self.modifier(DesignGroup(title: title))
    }
}

public extension Text {
    var textDesignTitle: some View {
        self.fontWeight(.light)
            .foregroundColor(.blue)
            .opacity(0.3)
    }
}
