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
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var timer = Timer()
    var countdown = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let curEx = workout.exercises[workout.current]
        totalTimeLabel.text = timeString(time: workout.seconds)
        countdown = curEx.rest
        countdownLabel.text = timeString(time: countdown)
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
        if (countdown != 0) {
            countdown -= 1
            countdownLabel.text = timeString(time: countdown)
            workout.seconds = workout.seconds + 1
            totalTimeLabel.text = timeString(time: workout.seconds)
        } else {
            performSegue(withIdentifier: "GoToNextExercise", sender: nil)
        }
    }
    
    func timeString(time: Int) -> String {
        let t = TimeInterval(time)
        let hours = Int(t) / 3600
        let minutes = Int(t) / 60 % 60
        let seconds = Int(t) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exerciseVC = segue.destination as? ExerciseVC else { return }
        workout.current = workout.current + 1
        exerciseVC.workout = workout
        timer.invalidate()
    }
    
}
