//
//  ViewController.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/10/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exerciseVC = segue.destination as? ExerciseVC else { return }
        exerciseVC.workout = Workout.render(workout: Data.workout)
    }
}
