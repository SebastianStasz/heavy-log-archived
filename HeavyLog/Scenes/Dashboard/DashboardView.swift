//
//  DashboardView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct DashboardView: View {

    @StateObject private var viewModel = DashboardVM()

    var body: some View {
        VStack {
            Button("Settings") { viewModel.navigate(to: .settings) }
                .navigation(isActive: $viewModel.areSettingsShown, destination: SettingsView.init)
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
