//
//  Layout.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

protocol Layout {
    var rawValue: CGFloat { get }
}

extension Layout {
    var value: CGFloat { rawValue }
}
