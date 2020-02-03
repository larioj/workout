//
//  Index.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 2/2/20.
//  Copyright © 2020 larioj. All rights reserved.
//

import Foundation

public struct Index {
    var contents : [String : (Int, [String: [Int]])] = [:]
    init(exercises: [Exercise]) {
        for id in 0 ..< exercises.count {
            let ex = exercises[id]
            var (idx,section) = contents[ex.section] ?? (contents.count+1, [:])
            var exercise = section[ex.exercise] ?? []
            exercise.append(id);
            section[ex.exercise] = exercise
            contents[ex.section] = (idx, section)
        }
    }
    
    func sectionCount() -> Int {
        return contents.count
    }
    
    func sectionOrder(ex: Exercise) -> Int {
        let (order, _) = contents[ex.section]!
        return order
    }
    
    func exerciseCount(ex: Exercise) -> Int {
        let (_, section) = contents[ex.section]!
        return section.count
    }
    
    func exerciseOrder(ex: Exercise, id: Int) -> Int {
        let (_, section) = contents[ex.section]!
        var order = 0
        for i in section[ex.exercise]! {
            order += 1
            if id == i {
                break
            }
        }
        return order
    }
}
