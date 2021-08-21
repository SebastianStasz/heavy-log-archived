//
//  UIKit+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import UIKit

extension UIScreen {

    /// Returns the width of the screen.
    static var width: CGFloat {
        UIScreen.main.bounds.width
    }

    /// Returns the height of the screen.
    static var height: CGFloat {
        UIScreen.main.bounds.height
    }
}
