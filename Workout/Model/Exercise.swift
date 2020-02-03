//
//  Exercise.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/12/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import Foundation

public struct Exercise {
    var section: String = ""
    var exercise: String = ""
    var repetitions: String = ""
    var duration: String = ""
    var rest: String = ""
    var weight: String = ""
    var order: String = ""
    
    // parsing information
    var linenum: Int
    var unused: [String] = []
    
    init(csv: String, linenum: Int) {
        self.linenum = linenum
        let values = csv.split(separator: ",", omittingEmptySubsequences: false)
        for i in 0 ..< values.count {
            let v = String(values[i])
            switch i {
            case 0: section = v
            case 1: exercise = v
            case 2: repetitions = v
            case 3: duration = v
            case 4: rest = v
            case 5: weight = v
            case 6: order = v
            default: unused.append(v)
            }
        }
    }
}
