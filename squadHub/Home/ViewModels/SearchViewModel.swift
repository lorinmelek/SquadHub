//
//  SearchViewModel.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func searchViewModelDidLoadTeams(_ viewModel: SearchViewModel, teams: [Team])
    func searchViewModelDidFailWithError(_ viewModel: SearchViewModel, error: Error)
    func searchViewModelDidUpdateFilteredTeams(_ viewModel: SearchViewModel, teams: [Team])
}

class SearchViewModel {

    weak var delegate: SearchViewModelDelegate?

    private(set) var allTeams: [Team] = []
    private(set) var filteredTeams: [Team] = []

    func loadTeams() {
        TeamService.shared.loadTeams { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let teams):
                self.allTeams = teams
                self.filteredTeams = teams
                self.delegate?.searchViewModelDidLoadTeams(self, teams: teams)

            case .failure(let error):
                self.delegate?.searchViewModelDidFailWithError(self, error: error)
            }
        }
    }

    func filterTeams(with searchText: String) {
        if searchText.isEmpty {
            filteredTeams = allTeams
        } else {
            filteredTeams = allTeams.filter { team in
                team.name.lowercased().contains(searchText.lowercased()) ||
                team.members.contains { member in
                    member.name.lowercased().contains(searchText.lowercased())
                }
            }
        }

        delegate?.searchViewModelDidUpdateFilteredTeams(self, teams: filteredTeams)
    }
}
