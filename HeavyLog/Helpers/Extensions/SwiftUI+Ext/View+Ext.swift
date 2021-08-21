//
//  View+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

extension View {

    // MARK: - Frame

    /// Positions this view within an invisible frame with infinite width and specified height.
    func infiniteWidth(maxHeight: CGFloat) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: maxHeight)
    }

    /// Positions this view within an invisible infinite frame.
    var infiniteFrame: some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// Sets a fixed size for a view’s width and height.
    func size(_ size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

    /// Sets a fixed size for a view’s width.
    func maxWidth(_ width: CGFloat = .infinity) -> some View {
        self.frame(maxWidth: width)
    }

    /// Sets a fixed size for a view’s height.
    func maxHeight(_ height: CGFloat = .infinity) -> some View {
        self.frame(maxHeight: height)
    }

    // MARK: - Other

    /// A view that pads this view inside the specified edge insets with a system-calculated amount of padding.
    func padding(top: CGFloat = 0, trailing: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0) -> some View {
        self
            .padding(.top, top)
            .padding(.bottom, bottom)
            .padding(.leading, leading)
            .padding(.trailing, trailing)
    }

    /// A view that pads this view inside the specified edge insets with a system-calculated amount of padding.
    func padding(vertical: CGFloat = 0, horizontal: CGFloat) -> some View {
        self
            .padding(.vertical, horizontal)
            .padding(.horizontal, horizontal)
    }

    /// Layers the given view behind this view ignoring all safe area.
    func backgroundIgnoringSafeArea<T: View>(_ view: T) -> some View {
        self.background(view.edgesIgnoringSafeArea(.all))
    }

    func embedInScrollView(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true) -> some View {
        ScrollView(axes, showsIndicators: showsIndicators) { self }
    }
}
