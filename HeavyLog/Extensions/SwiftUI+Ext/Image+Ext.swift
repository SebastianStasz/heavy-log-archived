//
//  Image+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

extension Image {

    /// Makes image rezizable with aspect ratio to fit.
    func resizableToFit() -> some View {
        self.resizable().scaledToFit()
    }

    /// Changes the width of the image and adjusts the aspect ratio to fit.
    func scaledToFit(width: CGFloat) -> some View {
        self.resizableToFit().frame(width: width)
    }

    /// Changes the height of the image and adjusts the aspect ratio to fit.
    func scaledToFit(height: CGFloat) -> some View {
        self.resizableToFit().frame(height: height)
    }
}
