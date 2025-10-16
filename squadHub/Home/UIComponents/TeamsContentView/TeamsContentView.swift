//
//  TeamsContentView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 30.09.2025.
//

import UIKit

final class TeamsContentView: UIView {

    private let headerView = HomeHeaderView()
    private let teamsListView = TeamsListView()

    weak var delegate: TeamsListViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white

        addSubview(headerView)
        addSubview(teamsListView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        teamsListView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),

            teamsListView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            teamsListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            teamsListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamsListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        headerView.configure(title: "Tüm Ekipler")
    }

    func configure(teams: [Team]) {
        teamsListView.configure(with: teams)
        teamsListView.delegate = delegate
    }
}
