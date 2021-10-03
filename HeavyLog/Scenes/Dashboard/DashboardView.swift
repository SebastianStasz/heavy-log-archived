//
//  DashboardView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import HeavyLogCoreData
import SwiftUI
import Shared

struct DashboardView: View {

    @StateObject private var viewModel = DashboardVM()

    var body: some View {
        VStack {
            Text("")
                .navigation(isActive: $viewModel.areSettingsShown, destination: SettingsView.init)
        }
        .infiniteFrame()
        .backgroundIgnoringSafeArea(Color.backgroundMain)
        .toolbar { toolbarContent }
    }

    private var toolbarContent: some ToolbarContent {
        Toolbar.leading(systemImage: SFSymbol.settings.rawValue, action: { viewModel.navigate(to: .settings) })
    }
}


// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
