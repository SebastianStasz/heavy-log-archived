//
//  ButtonsDSView.swift
//  ButtonsDSView
//
//  Created by Sebastian Staszczyk on 26/09/2021.
//

import Shared
import SwiftUI

struct ButtonsDSView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Button("Text button Action") {}
                    .buttonStyle(TextButtonStyle(.action))

                Button("Text button Destructive") {}
                    .buttonStyle(TextButtonStyle(.destructive))
            }
            .designGroup("Text buttons")

            Group {
                Button("Base button Action") {}
                .buttonStyle(BaseButtonStyle(.action(.medium)))

                Button("Base button Secondary") {}
                .buttonStyle(BaseButtonStyle(.secondary(.medium)))

                Button("Base button Destructive") {}
                .buttonStyle(BaseButtonStyle(.destructive(.medium)))
            }
            .designGroup("Base buttons medium")

            Group {
                Button("Base button Action") {}
                .buttonStyle(BaseButtonStyle(.action(.big)))

                Button("Base button Secondary") {}
                .buttonStyle(BaseButtonStyle(.secondary(.big)))

                Button("Base button Destructive") {}
                .buttonStyle(BaseButtonStyle(.destructive(.big)))
            }
            .designGroup("Base buttons big")


//            Button("TabBar action button") {}
//                .buttonStyle(TabBarActionButtonStyle(isEnabled: false))
//
//            Button("TabBar button") {}
//                .buttonStyle(TabBarButtonStyle(for: .exercises, isSelected: false))
//
//            Button("TabBar popup button") {}
//                .buttonStyle(TabBarPopupButtonStyle(image: "plus"))


        }
        .padding(.horizontal, .spacingMedium)
    }
}


// MARK: - Preview

struct ButtonsDSView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsDSView()
    }
}
