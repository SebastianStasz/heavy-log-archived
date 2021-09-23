//
//  DashboardVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation

final class DashboardVM: ObservableObject {
    
    @Published var areSettingsShown = false
    
    enum Destination {
        case settings
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .settings:
            areSettingsShown = true
        }
    }
}
