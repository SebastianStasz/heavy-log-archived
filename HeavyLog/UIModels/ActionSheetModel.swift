//
//  ActionSheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import HeavyLogCoreData
import Shared
import SwiftUI

enum ActionSheetModel {
    case chooseWorkoutTemplate(action: (WorkoutTemplateEntity?) -> Void, templates: [WorkoutTemplateEntity])

    var body: ActionSheet {
        switch self {
        case let .chooseWorkoutTemplate(startWorkout, templates):
            return presentChooseWorkoutTemplate(startWorkout: startWorkout, templates: templates)
        }
    }

    private func presentChooseWorkoutTemplate(startWorkout: @escaping (WorkoutTemplateEntity?) -> Void, templates: [WorkoutTemplateEntity]) -> ActionSheet {
        var buttons: [Button] = [
            .default(.common_empty, action: startWorkout(nil)), .cancel()
        ]
        let templateButtons = templates.suffix(2).map { template in
            Button.default(template.name, action: startWorkout(template))
        }
        if templates.count > 2 {
            let action = { controller.present(sheet: .workoutTemplateList(onTap: { template in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { startWorkout(template) }
            }))}
            buttons.append(.default(.common_showAll, action: action()))
        }
        buttons.insert(contentsOf: templateButtons, at: 1)
        return ActionSheet(message: .workoutCreator_chooseTemplate, buttons: buttons)
    }
}

// MARK: - Helpers

extension ActionSheetModel: Identifiable {
    typealias Button = ActionSheet.Button

    private var controller: AppController {
        AppController.shared
    }

    var id: Int {
        switch self {
        case .chooseWorkoutTemplate:
            return 0
        }
    }
}
