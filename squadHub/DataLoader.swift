//
//  DataLoader.swift
//  SquadHub
//
//  Created by LORIN VURAL on 1.09.2025.
//

import Foundation

struct DataLoader {
    static func loadTeams() -> [Team] {
        guard let url = Bundle.main.url(forResource: "teams", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("⚠️ teams.json bulunamadı")
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let teams = try decoder.decode([Team].self, from: data)
            return teams
        } catch {
            print("⚠️ JSON decode hatası:", error)
            return []
        }
    }
}
