//
//  NSManagedObject+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import CoreData
import Foundation

extension NSManagedObject {
    func delete() {
        guard let context = self.managedObjectContext else {
            assertionFailure("Context coulnd not be find.")
            return
        }
        context.delete(self)
    }
}
