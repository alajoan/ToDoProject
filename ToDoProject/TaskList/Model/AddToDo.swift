//
//  AddToDo.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import Foundation

enum Priorities: String, CaseIterable {
    case high = "High"
    case normal = "Normal"
    case low = "Low"
    
    init?(id: Int) {
        switch id {
            case 1: self = .high
            case 2: self = .normal
            case 3: self = .low
            default: return nil
        }
    }
    
    var priorityString: String {
        switch self {
            case .high: return "High"
            case .normal: return "Normal"
            case .low: return "Low"
        }
    }
}

