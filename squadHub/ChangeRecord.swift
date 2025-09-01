//
//  ChangeRecord.swift
//  SquadHub
//
//  Created by LORIN VURAL on 1.09.2025.
//
import Foundation

struct ChangeRecord: Codable {
    let id: String = UUID().uuidString
    let date: Date
    let description: String
}
