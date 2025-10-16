//
//  TeamService.swift
//  SquadHub
//
//  Created by LORIN VURAL on 3.10.2025.
//

import Foundation

class TeamService {
    static let shared = TeamService()
    private init() {}
    
    func loadTeams(completion: @escaping (Result<[Team], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "teams", withExtension: "json") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "teams.json file not found"])))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let teams = try JSONDecoder().decode([Team].self, from: data)
            completion(.success(teams))
        } catch {
            completion(.failure(error))
        }
    }
}
