//
//  WorkoutTemplateListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct WorkoutTemplateListView: View {

    @Environment(\.managedObjectContext) private var context
    @FetchRequest private var templates: FetchedResults<WorkoutTemplateEntity>
    private let onTap: ((WorkoutTemplateEntity) -> Void)?

    init(onTap: ((WorkoutTemplateEntity) -> Void)? = nil) {
        self.onTap = onTap
        self._templates = WorkoutTemplateEntity.all(sorting: [.recentlyUsed(.reverse)])
    }

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(templates) { template in
                Button(action: { tapHandler(template) }) {
                    Text(template.name)
                }
            }
        }
        .allowsHitTesting(onTap != nil)
        .padding(top: .spacingMedium, horizontal: .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .toolbar { Toolbar.cancel { dismiss() } }
        .embedInNavigationView(title: .workoutCreator_chooseTemplate, displayMode: .inline)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }

    // MARK: - Interactions

    private func dismiss() {
        AppController.shared.dismissSheet()
    }

    private func tapHandler(_ template: WorkoutTemplateEntity) {
        dismiss()
        onTap?(template)
    }
}


// MARK: - Preview

struct WorkoutTemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTemplateListView()
    }
}
