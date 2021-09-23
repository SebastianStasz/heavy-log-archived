//
//  SettingsView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import SwiftUI

struct SettingsView: View {

    @StateObject private var viewModel = SettingsVM()

    var body: some View {
        VStack {
            Button("Save workouts") { viewModel.exportWorkoutData() }
        }
    }
}


// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
