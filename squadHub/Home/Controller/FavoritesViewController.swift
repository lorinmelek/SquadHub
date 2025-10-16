//
//  FavoritesViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

class FavoritesViewController: UIViewController, TeamLoadable {

    weak var coordinator: FavoritesCoordinator?
    private let contentView = FavoritesContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTeams()
    }
    
    private func setupUI() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func handleTeamsLoaded(_ teams: [Team]) {
        let favoriteTeams: [Team] = []
        contentView.configure(favoriteTeams: favoriteTeams)
    }
}
