//
//  Workout.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/10/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import Foundation

public class Workout {
    var current: Int! = 0
    var exercises: [Exercise]!
    var seconds: Int! = 0
    
    static func render(workout: Data.Workout) -> Workout {
        let result = Workout()
        var exercises: [Exercise] = []
        for (sectIdx, sect) in workout.sections.enumerated() {
            var progress : [Int: Int] = [:]
            var totals : [String: Int] = [:]
            sect.exercises.keys.sorted().forEach { order in
                let ex = sect.exercises[order]!
                totals[ex.name] = (totals[ex.name] ?? 0) + 1
                progress[order] = totals[ex.name] ?? 0
            }
            sect.exercises.keys.sorted().forEach { order in
                let ex = sect.exercises[order]!
                let sectionProgressStr = String(format: "%d of %d", sectIdx + 1, workout.sections.count)
                let progressStr = String(format: "%d of %d", progress[order] ?? 0, totals[ex.name] ?? 0)
                exercises.append(
                    Exercise(section: sect.name, sectionProgress: sectionProgressStr, name: ex.name, progress: progressStr, reps: ex.length, rest: ex.rest ?? sect.rest))
            }
        }
        result.exercises = exercises
        return result
    }
}
