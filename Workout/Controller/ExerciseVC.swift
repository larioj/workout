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
    
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var sectionProgress: UILabel!
    @IBOutlet weak var exercise: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var reps: UILabel!
    
    var timer = Timer()
    var seconds = 0
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let curEx = workout.exercises[workout.current]
        section.text = curEx.section
        sectionProgress.text = curEx.sectionProgress
        exercise.text = curEx.name
        progress.text = curEx.progress
        reps.text = curEx.reps
        timeLabel.text = timeString(time: seconds)
        totalTimeLabel.text = timeString(time: workout.seconds)
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: (#selector(ExerciseVC.updateTimer)),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func updateTimer() {
        seconds += 1
        timeLabel.text = timeString(time: seconds)
        workout.seconds = workout.seconds + 1
        totalTimeLabel.text = timeString(time: workout.seconds)
    }
    
    func timeString(time: Int) -> String {
        let t = TimeInterval(time)
        let hours = Int(t) / 3600
        let minutes = Int(t) / 60 % 60
        let seconds = Int(t) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let restVC = segue.destination as? RestVC else { return }
        restVC.workout = workout
        timer.invalidate()
    }
    
}
