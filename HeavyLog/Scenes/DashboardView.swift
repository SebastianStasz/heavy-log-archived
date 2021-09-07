//
//  DashboardView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Button("Present pop-up") {
                AppController.shared.present(popup: .sampleTextFieldAndPicker)
            }
        }
        .infiniteFrame()
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }
}


// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
