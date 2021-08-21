//
//  HeadlineBig.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import SwiftUI

struct HeadlineBig: ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: .spacingBig) {
            Text(title).textHeadlineBig
            content
        }
    }
}

extension View {
    func addHeadlineBig(_ title: String) -> some View {
        self.modifier(HeadlineBig(title: title))
    }
}
