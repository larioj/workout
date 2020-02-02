//
//  Workout.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/10/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import Foundation

public struct Workout {
    var exercises: [Exercise] = []
    var index: [String : [String : [Int]]] = [:]
    
    init(csv: String) {
        let lines = csv.components(separatedBy: .newlines)
        var lastSection: String?
        var group: [Exercise] = []
        
        // ignore empty lines at beginning of data
        var start = 0
        while start < lines.count &&
            lines[start].trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            start += 1;
        }
        
        // put exercises in proper order
        for i in start+1 ..< lines.count {
            if lines[i].isEmpty {
                continue
            }
            let ex = Exercise(csv: lines[i], linenum: i)
            let order = Int(ex.order)
            if (lastSection != ex.section || order == nil) {
                group.sort(by: { a, b in
                    return Int(a.order)! < Int(b.order)!
                })
                exercises.append(contentsOf: group)
                group.removeAll(keepingCapacity: true)
            }
            lastSection = ex.section
            if (order == nil) {
                exercises.append(ex)
            } else {
                group.append(ex)
            }
        }
        exercises.append(contentsOf: group)
        
        // build index
        for id in 0 ..< exercises.count {
            let ex = exercises[id]
            var section = index[ex.section] ?? [:]
            var exercise = section[ex.exercise] ?? []
            exercise.append(id);
            section[ex.exercise] = exercise
            index[ex.section] = section
        }
    }
}
