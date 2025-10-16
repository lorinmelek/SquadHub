//
//  FavoritesContentView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 30.09.2025.
//

import UIKit

final class FavoritesContentView: UIView {
    
    @IBOutlet private weak var emptyStateLabel: UILabel!
    
    private let headerView = HomeHeaderView()
    private let teamsListView = TeamsListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let contentView = loadViewFromNib() else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        setupEmptyState()
        setupHeader()
        setupTeamsList()
    }
    
    private func setupEmptyState() {
        emptyStateLabel.text = "Henüzz favoriye eklenmiş ekip yok"
        emptyStateLabel.isHidden = true
    }
    
    private func setupHeader() {
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        headerView.configure(title: "Favoriler")
    }
    
    private func setupTeamsList() {
        addSubview(teamsListView)
        teamsListView.translatesAutoresizingMaskIntoConstraints = false
        teamsListView.isHidden = true
        
        NSLayoutConstraint.activate([
            teamsListView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            teamsListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            teamsListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamsListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configure(favoriteTeams: [Team]) {
        if favoriteTeams.isEmpty {
            teamsListView.isHidden = true
            emptyStateLabel.isHidden = false
        } else {
            teamsListView.isHidden = false
            emptyStateLabel.isHidden = true
            teamsListView.configure(with: favoriteTeams)
        }
    }
}
