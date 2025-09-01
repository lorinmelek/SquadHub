//
//  Member.swift
//  SquadHub
//
//  Created by LORIN VURAL on 1.09.2025.
//

import UIKit
import Foundation

struct Member: Codable, Equatable {
    let id: String
    var name: String
    var role: String
    var colorHex: String
    
    init(id: String = UUID().uuidString, name: String, role: String, colorHex: String) {
        self.id = id
        self.name = name
        self.role = role
        self.colorHex = colorHex
    }
}
