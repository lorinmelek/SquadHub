//
//  TeamDetailViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import UIKit

class TeamDetailViewController: UIViewController {


    weak var coordinator: HomeCoordinator?  
    private let contentView = TeamDetailContentView()
    private let team: Team

    init(team: Team) {
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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

        contentView.delegate = self
        contentView.configure(team: team)
    }
}

extension TeamDetailViewController: TeamsListViewDelegate {
    func teamsListView(_ view: TeamsListView, didSelectTeam team: Team) {
    }
}
