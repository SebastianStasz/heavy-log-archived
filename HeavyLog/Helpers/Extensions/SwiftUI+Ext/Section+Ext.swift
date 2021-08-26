//
//  Section+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import SwiftUI

extension Section where Parent: View, Content: View, Footer: View {

    /// Removes default section style.
    func plainStyle() -> some View {
        self.listRowBackground(Color.backgroundMain)
            .padding(.horizontal, -20)
    }
}
