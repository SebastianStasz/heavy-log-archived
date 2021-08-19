//
//  WorkoutCreatorView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI

struct WorkoutCreatorView: View {

    @StateObject private var viewModel = WorkoutCreatorVM()

    init() {
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        TabView {
            ForEach(viewModel.availableTabs) { tab in
                tab.tabItem { Label(tab.title, systemImage: tab.icon) }
            }
        }
        .embedInNavigationView(title: "Workout Name", displayMode: .inline)
    }
}


// MARK: - Preview

struct WorkoutCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatorView()
    }
}
