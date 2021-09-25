//
//  SetEntityMethods.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension SetEntity {

    @discardableResult static func create(in effort: EffortEntity, setData: SetData) -> SetEntity? {
        guard let context = effort.getContext() else { return nil }
        let set = SetEntity(in: context)
        set.effort = effort
        set.modify(setData: setData)
        return set
    }

    @discardableResult func modify(setData: SetData) -> SetEntity {
        reps = setData.reps
        weight = setData.weight
        return self
    }

    var data: SetData {
        SetData(reps: reps, weight: weight)
    }
}
