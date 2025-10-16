//
//  TeamsViewModel.swift
//  SquadHub
//
//  Created by LORIN VURAL on 16.10.2025.
//

import Foundation

protocol TeamsViewModelDelegate: AnyObject {
    func teamsViewModelDidLoadTeams(_ viewModel: TeamsViewModel, teams: [Team])
    func teamsViewModelDidFailWithError(_ viewModel: TeamsViewModel, error: Error)
}

class TeamsViewModel {

    weak var delegate: TeamsViewModelDelegate?

    private(set) var teams: [Team] = []

    func loadTeams() {
        TeamService.shared.loadTeams { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let teams):
                self.teams = teams
                self.delegate?.teamsViewModelDidLoadTeams(self, teams: teams)

            case .failure(let error):
                self.delegate?.teamsViewModelDidFailWithError(self, error: error)
            }
        }
    }
}
