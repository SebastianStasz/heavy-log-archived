//
//  DashboardView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct DashboardView: View {

    @State private var result: String?

    var body: some View {
        VStack {
            if let text = result {
                Text(String(text))
            }

            Button("Present pop-up") {
                AppController.shared.present(popup: .textFieldAndPicker(.init(title: "Sample", message: "Sample"), .init(result: $result, validation: ValueValidation(type: .double)), .init(hint: "", viewModel: .repsPicker), output: { print("Weight: \($0), Reps: \($1)") }))
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
