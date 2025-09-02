//
//  Team.swift
//  SquadHub
//
//  Created by LORIN VURAL on 1.09.2025.
//
import Foundation

struct Team: Decodable {
    let id: String
    var name: String
    var members: [Member]

    init(id: String = UUID().uuidString,
         name: String,
         members: [Member] = []) {
        self.id = id
        self.name = name
        self.members = members
    }
}

