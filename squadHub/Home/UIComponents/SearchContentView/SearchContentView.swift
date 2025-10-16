//
//  SearchContentView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 30.09.2025.
//

import UIKit

protocol SearchContentViewDelegate: AnyObject {
    func searchContentView(_ view: SearchContentView, didSearchWith text: String)
}

final class SearchContentView: UIView {

    @IBOutlet private weak var searchBar: UISearchBar!
    private let teamsListView = TeamsListView()

    weak var delegate: TeamsListViewDelegate?
    weak var searchDelegate: SearchContentViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    private func configureView() {
        guard let view = loadViewFromNib() else {
            assertionFailure("SearchContentView XIB could not be loaded")
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)

        setupSearchBar()
        setupTeamsList()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Ekip veya üye ara..."
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
    }

    private func setupTeamsList() {
        self.addSubview(teamsListView)
        teamsListView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                    teamsListView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
                    teamsListView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    teamsListView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    teamsListView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
    }

    func configure(teams: [Team]) {
        teamsListView.configure(with: teams)
        teamsListView.delegate = delegate
    }

    func updateTeams(_ teams: [Team]) {
        teamsListView.configure(with: teams)
        teamsListView.delegate = delegate
    }
}

extension SearchContentView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchDelegate?.searchContentView(self, didSearchWith: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
