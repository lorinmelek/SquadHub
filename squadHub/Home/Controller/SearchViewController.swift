//
//  SearchViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

class SearchViewController: UIViewController {

    weak var coordinator: SearchCoordinator?
    private let contentView = SearchContentView()
    private let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        contentView.delegate = self
        viewModel.loadTeams()
    }

    private func setupViewModel() {
        viewModel.delegate = self
        contentView.searchDelegate = self
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
}

// MARK: - SearchViewModelDelegate

extension SearchViewController: SearchViewModelDelegate {
    func searchViewModelDidLoadTeams(_ viewModel: SearchViewModel, teams: [Team]) {
        contentView.configure(teams: teams)
    }

    func searchViewModelDidUpdateFilteredTeams(_ viewModel: SearchViewModel, teams: [Team]) {
        contentView.updateTeams(teams)
    }

    func searchViewModelDidFailWithError(_ viewModel: SearchViewModel, error: Error) {
        print("Error loading teams: \(error.localizedDescription)")
    }
}

// MARK: - SearchContentViewDelegate

extension SearchViewController: SearchContentViewDelegate {
    func searchContentView(_ view: SearchContentView, didSearchWith text: String) {
        viewModel.filterTeams(with: text)
    }
}

// MARK: - TeamsListViewDelegate
extension SearchViewController: TeamsListViewDelegate {
    func teamsListView(_ view: TeamsListView, didSelectTeam team: Team) {
        coordinator?.showTeamDetail(team: team)
    }
}
