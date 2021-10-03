//
//  NotificationCenter+Ext.swift
//  NotificationCenter+Ext
//
//  Created by Sebastian Staszczyk on 03/10/2021.
//

import UIKit

extension NotificationCenter {

    /// Posted immediately prior to the display of the keyboard.
    static var keyboardWillShow: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    }

    /// Posted immediately prior to the dismissal of the keyboard.
    static var keyboardWillHide: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    }
}
