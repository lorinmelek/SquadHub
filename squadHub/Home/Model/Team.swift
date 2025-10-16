//
//  Team.swift
//  SquadHub
//
//  Created by LORIN VURAL on 24.09.2025.
//

import Foundation

struct Team: Codable {
    let id: String
    let name: String
    let members: [Member]
    
    var memberCount: Int {
        return members.count
    }
}
