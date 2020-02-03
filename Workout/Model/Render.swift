//
//  Render.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 2/2/20.
//  Copyright © 2020 larioj. All rights reserved.
//

import Foundation

public struct Render {
    static func fmtSeconds(seconds: Double) -> String {
        let fmt = DateComponentsFormatter()
        fmt.allowedUnits = [.hour, .minute, .second]
        fmt.unitsStyle = .positional
        return fmt.string(from: TimeInterval(abs(seconds)))!
    }
    
    static func sectionProgress(workout: Workout, id: Int) -> String {
        let ex = workout.exercises[id]
        let order = workout.index.sectionOrder(ex: ex)
        let count = workout.index.sectionCount()
        return String(format: "%d of %d", order, count)
    }
    
    static func exerciseProgress(workout: Workout, id: Int) -> String {
        let ex = workout.exercises[id]
        let order = workout.index.exerciseOrder(ex: ex, id: id)
        let count = workout.index.exerciseCount(ex: ex)
        return String(format: "%d of %d", order, count)
    }
    
    static func showRepetitions(ex: Exercise) -> String {
        if ex.repetitions.isEmpty {
            return ex.duration + "sec"
        }
        if ex.duration.isEmpty {
            return ex.repetitions
        }
        return ex.repetitions + "x" + ex.duration + "sec"
        
    }
    
    static func showDescription(ex: Exercise, includeSection: Bool) -> String {
        let reps = showRepetitions(ex: ex)
        var sect = ""
        if includeSection {
            sect = ex.section + ": "
        }
        return sect + reps + " " + ex.exercise
        
    }
}
