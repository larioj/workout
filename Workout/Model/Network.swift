//
//  Network.swift
//  Workout
//
//  Created by Jesus Larios Murillo on 2/1/20.
//  Copyright © 2020 larioj. All rights reserved.
//

import Foundation

public struct Network {
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
    
    static func workout(url: URL) -> Workout? {
        if let data = httpGet(url: url) {
            if let csv = String(data: data, encoding: String.Encoding.utf8) {
                return Workout(csv: csv)
            }
        }
        return nil
    }
}
