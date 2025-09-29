//
//  Team.swift
//  SquadHub
//
//  Created by LORIN VURAL on 24.09.2025.
//

struct Team: Codable {
    let name: String
    let members: [Member]
    
    var memberCount: Int {
        print("📊 memberCount hesaplanıyor: \(members.count)")
        return members.count
    }
}
