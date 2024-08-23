//
//  Objects.swift
//  Bruin Bulk
//
//  Created by Howard on 8/12/24.
//

import Foundation

/*
 calendar with day objects inside of it
 days with meal objects inside of them
 meals with restaurant, date/time of meal, type of meal, array of what was eaten
 lose information about all possible food options and restaurants for past days, only keep meal history
 */

struct DiningHall: Identifiable, Codable {
    var id: UUID = UUID() // Automatically generate a unique ID
    var name: String
    var url: String
}

struct MenuItem: Identifiable, Codable {
    var id: UUID = UUID() // Automatically generate a unique ID
    var name: String
    var nutrition: [Double] // Array to hold nutrition facts (e.g., calories, fat, etc.)
}

struct Day {
    var meals: Meal
}

struct Meal {
    let dining_hall: Int
    let type: Int
    let time: Time
    
    // key: name of food item, value: quantity eaten
    var food_items: Dictionary<String, Int>
}

struct Restaurant: Hashable {
    let name: String
    var menu: Dictionary<String, Nutrition>
    // TODO: add hash function?
}

struct Nutrition: Hashable {
    let calories: Int
    let fat: Double
    let protein: Double
    let carbs: Double
}

struct Time: Hashable, CustomStringConvertible, Comparable {
    static func < (lhs: Time, rhs: Time) -> Bool {
        return (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
    }
    
    var description: String {
        var hS = String(hours)
        if hours < 10 {
            hS = "0"+hS
        }
        var mS = String(minutes)
        if minutes < 10 {
            mS = "0"+mS
        }
        
        return hS+":"+mS
    }

    let hours: Int
    let minutes: Int
    
    
    func toDate(day: Date) -> Date? {
        guard let date = Calendar.current.date(bySettingHour: hours, minute: minutes, second: 0, of: day) else {
            return nil
        }
        return date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hours)
        hasher.combine(minutes)
    }
}

extension Date {
    func time() -> Time {
        let calendar = Calendar.current
        let t = Time(hours: calendar.component(.hour, from: self), minutes: calendar.component(.minute, from: self))
        return t
    }
}
