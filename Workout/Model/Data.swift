//
//  Data.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 11/14/19.
//  Copyright © 2019 larioj. All rights reserved.
//

import Foundation

public struct Data {
    
    static let url: URL! = URL(string: "https://raw.githubusercontent.com/larioj/workout/master/workout.json")!
    
    struct CodableWorkout: Codable {
        var sections: [Data.CodableSection]!
    }
    
    struct CodableSection: Codable {
        var name: String!
        var rest: Int!
        var exercises: [String: Data.Exercise]!
    }
    
    public struct Workout {
        var sections: [Data.Section]!
    }
    public struct Section {
        var name: String!
        var rest: Int!
        var exercises: [Int: Data.Exercise]!
    }
    public struct Exercise: Codable {
        var name: String!
        var length: String!
        var rest: Int?
    }
    
    static func httpGet(url: URL) -> Foundation.Data? {
        let semaphore = DispatchSemaphore(value: 0)
        var result: Foundation.Data?
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            result = data
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return result
    }
    
    static func parse(data: Foundation.Data?) -> Data.Workout {
        var result: Data.Workout! = Workout()
        if let data = data {
            if let codableWorkout = try? JSONDecoder().decode(Data.CodableWorkout.self, from: data) {
                codableWorkout.sections.forEach { codsect in
                    var sect: Data.Section! = Data.Section(name: codsect.name, rest: codsect.rest, exercises: [:])
                    for (key, value) in codsect.exercises {
                        if let idx = Int(key) {
                            sect.exercises[idx] = value
                        }
                    }
                    result.sections.append(sect)
                }
            }
        }
        return result
    }
    
    static func loadWorkout(url: URL) -> Data.Workout {
        return parse(data: httpGet(url: url))
    }
    
    static let workout = Workout(sections: [
        Section(name: "Warm Up", rest: 20, exercises: [
            1: Data.Exercise(name: "Jumping Jacks", length: "20", rest: nil),
            2: Data.Exercise(name: "Wrist Circles", length: "15", rest: nil),
            3: Data.Exercise(name: "Jumping Jacks", length: "20", rest: nil),
            4: Data.Exercise(name: "Shoulder Circles", length: "15", rest: nil),
            5: Data.Exercise(name: "B.W. Squats", length: "15", rest: nil),
            ]),
        Section(name: "Shoulders", rest: 90, exercises: [
            1: Data.Exercise(name: "Skin The Cat", length: "5", rest: nil),
            2: Data.Exercise(name: "German Hang", length: "30 sec", rest: nil),
            3: Data.Exercise(name: "Pull Up", length: "7", rest: nil),
            4: Data.Exercise(name: "Dips", length: "6", rest: nil),
            5: Data.Exercise(name: "Pull Up", length: "6", rest: nil),
            6: Data.Exercise(name: "Dips", length: "6", rest: nil),
            7: Data.Exercise(name: "Pull Up", length: "6", rest: nil),
            8: Data.Exercise(name: "Dips", length: "5", rest: nil),
            9: Data.Exercise(name: "Row", length: "13", rest: nil),
            10: Data.Exercise(name: "Ring Push Up", length: "12", rest: nil),
            11: Data.Exercise(name: "Row", length: "12", rest: nil),
            12: Data.Exercise(name: "Ring Push Up", length: "11", rest: nil),
            13: Data.Exercise(name: "Row", length: "12", rest: nil),
            14: Data.Exercise(name: "Ring Push Up", length: "11", rest: nil),
            ]),
        Section(name: "Core", rest: 30, exercises: [
            1: Data.Exercise(name: "Plank", length: "60 sec", rest: nil),
            2: Data.Exercise(name: "Left Plank", length: "60 sec", rest: nil),
            3: Data.Exercise(name: "Right Plank", length: "60 sec", rest: nil),
            4: Data.Exercise(name: "Rev. Plank", length: "60 sec", rest: nil),
            5: Data.Exercise(name: "Arch", length: "60 sec", rest: nil),
            6: Data.Exercise(name: "Hollow", length: "60 sec", rest: nil),
            ]),
        Section(name: "Handstand", rest: 30, exercises: [
            1: Data.Exercise(name: "Wall Hand Stand", length: "1:40 sec", rest: nil),
            2: Data.Exercise(name: "Wall Hand Stand", length: "20 sec", rest: nil),
            3: Data.Exercise(name: "Hand Stand", length: "20 sec", rest: nil),
            4: Data.Exercise(name: "Hand Stand", length: "20 sec", rest: nil),
            ]),
        Section(name: "Mana", rest: 30, exercises: [
            1: Data.Exercise(name: "Bent Leg", length: "20 sec", rest: nil),
            2: Data.Exercise(name: "Bent Leg", length: "20 sec", rest: nil),
            3: Data.Exercise(name: "Left Leg Cheaters", length: "60 sec", rest: nil),
            4: Data.Exercise(name: "Right Leg Cheaters", length: "60 sec", rest: nil),
            5: Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            6: Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: 60),
            7: Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            8: Data.Exercise(name: "2-Leg Cheaters", length: "60 sec", rest: nil),
            ]),
        Section(name: "Legs", rest: 180, exercises: [
            1: Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            2: Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            3: Data.Exercise(name: "Power Clean", length: "15", rest: nil),
            4: Data.Exercise(name: "Squat", length: "11", rest: nil),
            5: Data.Exercise(name: "Squat", length: "11", rest: nil),
            6: Data.Exercise(name: "Squat", length: "11", rest: nil),
            ]),
        Section(name: "Misc", rest: 90, exercises: [
            1: Data.Exercise(name: "Bicep Curl", length: "14", rest: nil),
            2: Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            3: Data.Exercise(name: "Bicep Curl", length: "13", rest: nil),
            4: Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            5: Data.Exercise(name: "Bicep Curl", length: "13", rest: nil),
            6: Data.Exercise(name: "Box Jump", length: "10", rest: nil),
            ]),
        Section(name: "Cool Down", rest: 10, exercises: [
            1: Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            2: Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            3: Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            4: Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            5: Data.Exercise(name: "Leg Split", length: "30 sec", rest: nil),
            6: Data.Exercise(name: "Leg Hug", length: "30 sec", rest: nil),
            ]),
    ])
}
