//
//  RestVC.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/12/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import UIKit

class RestVC: UIViewController {
    var workout: Workout!
    var startTimes: [Double]!
    var endTimes: [Double]!
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var upNextLabel: UILabel!
    
    // current state
    var timer = Timer()
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id = endTimes.count
        let ex = workout.exercises[id]
        endTimes.append(NSDate().timeIntervalSince1970)
        
        // set labels
        totalTimeLabel.text = Render.fmtSeconds(seconds: endTimes[id] - startTimes[0])
        countdownLabel.text = Render.fmtSeconds(seconds: Double(ex.rest) ?? 0)
        if id + 1 < workout.exercises.count {
            let nex = workout.exercises[id+1]
            let includeSection = nex.section != ex.section
            upNextLabel.text = "Up Next: " +
                Render.showDescription(ex: nex, includeSection: includeSection)
        }

        // set timer
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: (#selector(ExerciseVC.updateTimer)),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func updateTimer() {
        let ex = workout.exercises[id]
        let now = Date().timeIntervalSince1970
        let rest = Double(ex.rest) ?? 0
        totalTimeLabel.text = Render.fmtSeconds(seconds: now - startTimes[0])
        countdownLabel.text = Render.fmtSeconds(seconds: (endTimes[id] + rest) - now)
        if now >= endTimes[id] + rest {
            if endTimes.count < workout.exercises.count {
                performSegue(withIdentifier: "GoToNextExercise", sender: nil)
            } else {
                performSegue(withIdentifier: "StartVC", sender: nil)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exerciseVC = segue.destination as? ExerciseVC else { return }
        exerciseVC.workout = workout
        exerciseVC.startTimes = startTimes
        exerciseVC.endTimes = endTimes
        timer.invalidate()
    }
    
}
