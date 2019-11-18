//
//  Data.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/14/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import Foundation

public struct Data {
    public struct Workout {
        var sections: [Data.Section]!
    }
    public struct Section {
        var name: String!
        var rest: Int!
        var exercises: [Data.Exercise]!
    }
    public struct Exercise {
        var name: String!
        var length: String!
        var rest: Int?
    }
    
    static let workout = Workout(sections: [
        Section(name: "Warm Up", rest: 20, exercises: [
            Data.Exercise(name: "Jumping Jacks", length: "20", rest: nil),
            Data.Exercise(name: "Wrist Circles", length: "15", rest: nil),
            Data.Exercise(name: "Jumping Jacks", length: "20", rest: nil),
            Data.Exercise(name: "Shoulder Circles", length: "15", rest: nil),
            Data.Exercise(name: "B.W. Squats", length: "15", rest: nil),
            ]),
        Section(name: "Shoulders", rest: 90, exercises: [
            Data.Exercise(name: "Skin The Cat", length: "5", rest: nil),
            Data.Exercise(name: "German Hang", length: "30 sec", rest: nil),
            Data.Exercise(name: "Pull Up", length: "7", rest: nil),
            Data.Exercise(name: "Dips", length: "6", rest: nil),
            Data.Exercise(name: "Pull Up", length: "6", rest: nil),
            Data.Exercise(name: "Dips", length: "6", rest: nil),
            Data.Exercise(name: "Pull Up", length: "6", rest: nil),
            Data.Exercise(name: "Dips", length: "5", rest: nil),
            Data.Exercise(name: "Row", length: "13", rest: nil),
            Data.Exercise(name: "Ring Push Up", length: "11", rest: nil),
            Data.Exercise(name: "Row", length: "12", rest: nil),
            Data.Exercise(name: "Ring Push Up", length: "11", rest: nil),
            Data.Exercise(name: "Row", length: "12", rest: nil),
            Data.Exercise(name: "Ring Push Up", length: "11", rest: nil),
            ]),
        Section(name: "Core", rest: 30, exercises: [
            Data.Exercise(name: "Plank", length: "60 sec", rest: nil),
            Data.Exercise(name: "Left Plank", length: "60 sec", rest: nil),
            Data.Exercise(name: "Right Plank", length: "60 sec", rest: nil),
            Data.Exercise(name: "Rev. Plank", length: "60 sec", rest: nil),
            Data.Exercise(name: "Arch", length: "60 sec", rest: nil),
            Data.Exercise(name: "Hollow", length: "60 sec", rest: nil),
            ]),
        Section(name: "Handstand", rest: 30, exercises: [
            Data.Exercise(name: "Wall Hand Stand", length: "1:40 sec", rest: nil),
            Data.Exercise(name: "Wall Hand Stand", length: "20 sec", rest: nil),
            Data.Exercise(name: "Hand Stand", length: "20 sec", rest: nil),
            Data.Exercise(name: "Hand Stand", length: "20 sec", rest: nil),
            ]),
        Section(name: "Mana", rest: 30, exercises: [
            Data.Exercise(name: "Bent Leg", length: "20 sec", rest: nil),
            Data.Exercise(name: "Bent Leg", length: "20 sec", rest: nil),
            Data.Exercise(name: "Left Leg Cheaters", length: "60 sec", rest: nil),
            Data.Exercise(name: "Right Leg Cheaters", length: "60 sec", rest: nil),
            Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: 60),
            Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            ]),
        Section(name: "Legs", rest: 180, exercises: [
            Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            Data.Exercise(name: "Squat", length: "11", rest: nil),
            Data.Exercise(name: "Squat", length: "11", rest: nil),
            Data.Exercise(name: "Squat", length: "11", rest: nil),
            ]),
        Section(name: "Misc", rest: 90, exercises: [
            Data.Exercise(name: "Bicep Curl", length: "14", rest: nil),
            Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            Data.Exercise(name: "Bicep Curl", length: "13", rest: nil),
            Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            Data.Exercise(name: "Bicep Curl", length: "13", rest: nil),
            Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            ]),
        Section(name: "Cool Down", rest: 10, exercises: [
            Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            ]),
    ])
}
