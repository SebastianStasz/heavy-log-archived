//
//  ExerciseDetailsView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/09/2021.
//

import SwiftUI

struct ExerciseDetailsView: View {

    @ObservedObject var viewModel: ExerciseDetailsVM

    var body: some View {
        Text(viewModel.exerciseEntity.description)
    }
}


// MARK: - Preview

//struct ExerciseDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailsView(viewModel: <#T##ExerciseDetailsVM#>)
//    }
//}
