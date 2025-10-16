//
//  FavoritesViewModel.swift
//  SquadHub
//
//  Created by LORIN VURAL on 16.10.2025.
//

import Foundation

protocol FavoritesViewModelDelegate: AnyObject {
    func favoritesViewModelDidLoadTeams(_ viewModel: FavoritesViewModel, teams: [Team])
    func favoritesViewModelDidFailWithError(_ viewModel: FavoritesViewModel, error: Error)
}

class FavoritesViewModel {

    weak var delegate: FavoritesViewModelDelegate?

    private(set) var favoriteTeams: [Team] = []

    func loadTeams() {
        TeamService.shared.loadTeams { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let teams):
                // Şimdilik boş array - favori sistemi eklenince filtre edilecek
                self.favoriteTeams = []
                self.delegate?.favoritesViewModelDidLoadTeams(self, teams: self.favoriteTeams)

            case .failure(let error):
                self.delegate?.favoritesViewModelDidFailWithError(self, error: error)
            }
        }
    }
}
