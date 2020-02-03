//
//  ExerciseVC.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/10/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import UIKit

class ExerciseVC: UIViewController {
    var workout: Workout!
    var startTimes: [Double]!
    var endTimes: [Double]!
    
    // Display
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var sectionProgress: UILabel!
    @IBOutlet weak var exercise: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var reps: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    // current state
    var timer = Timer()
    var id: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set start time
        id = startTimes.count
        let grace: Double = 2
        var start = NSTimeIntervalSince1970
        if !endTimes.isEmpty && start + grace > endTimes[id - 1] {
            start = endTimes[id - 1] + grace
        }
        startTimes.append(start)
        
        // display information
        let ex = workout.exercises[id]
        section.text = ex.section
        sectionProgress.text = Render.sectionProgress(workout: workout, id: id)
        exercise.text = ex.exercise
        progress.text = Render.exerciseProgress(workout: workout, id: id)
        reps.text = Render.showRepetitions(ex: ex)
        timeLabel.text = Render.fmtSeconds(seconds: 0)
        totalTimeLabel.text = Render.fmtSeconds(seconds: startTimes[id] - startTimes[0])
        
        // start timer
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: (#selector(ExerciseVC.updateTimer)),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func updateTimer() {
        let now = NSTimeIntervalSince1970
        timeLabel.text = Render.fmtSeconds(seconds: now - startTimes[id])
        totalTimeLabel.text = Render.fmtSeconds(seconds: now - startTimes[0])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let restVC = segue.destination as? RestVC else { return }
        restVC.workout = workout
        restVC.startTimes = startTimes
        restVC.endTimes = endTimes
        timer.invalidate()
    }
}
