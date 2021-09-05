//
//  WorkoutCreatorView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI
import Shared

struct WorkoutCreatorView: View {
    
    @StateObject private var viewModel = WorkoutCreatorVM()

    init() {
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(viewModel.availableTabs) { $0 }
                .background(Color.backgroundMain)
        }
        .toolbar { toolbarContent }
        .environmentObject(viewModel)
        .embedInNavigationView(title: "Workout Name", displayMode: .inline)
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.cancel(action: dismissCreator)
            Toolbar.delete(action: dismissCreator)
        }
    }

    // MARK: - Interactions

    private func dismissCreator() {
        viewModel.navigate(to: .dismissCreator)
    }
}


// MARK: - Preview

struct WorkoutCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatorView()
    }
}
