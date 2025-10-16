//
//  HomeViewModel.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func homeViewModelDidLoadTeams(_ viewModel: HomeViewModel, teams: [Team])
    func homeViewModelDidFailWithError(_ viewModel: HomeViewModel, error: Error)
}

class HomeViewModel {

    weak var delegate: HomeViewModelDelegate?

    private(set) var teams: [Team] = []

    var totalTeams: Int {
        return teams.count
    }

    var totalMembers: Int {
        return teams.reduce(0) { $0 + $1.memberCount }
    }

    func loadTeams() {
        TeamService.shared.loadTeams { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let teams):
                self.teams = teams
                self.delegate?.homeViewModelDidLoadTeams(self, teams: teams)

            case .failure(let error):
                self.delegate?.homeViewModelDidFailWithError(self, error: error)
            }
        }
    }

    func team(at index: Int) -> Team? {
        guard index < teams.count else { return nil }
        return teams[index]
    }
}
