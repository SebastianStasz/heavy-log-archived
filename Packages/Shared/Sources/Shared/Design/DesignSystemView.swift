//
//  DesignSystemView.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

struct DesignSystemView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Typography", destination: TypographyPreview())
                NavigationLink("Colors", destination: ColorsPreview())
            }
            .navigationTitle("Design system")
        }
    }
}


// MARK: - Preview

struct DesignSystemView_Previews: PreviewProvider {
    static var previews: some View {
        DesignSystemView()
    }
}
