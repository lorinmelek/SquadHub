//
//  HomeContentView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

final class HomeContentView: UIView {
    
    private let headerView = HomeHeaderView()
    private let summaryView = SummaryView()
    private let teamsListView = TeamsListView()
    
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
        addSubview(summaryView)
        addSubview(teamsListView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        summaryView.translatesAutoresizingMaskIntoConstraints = false
        teamsListView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            summaryView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            summaryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            summaryView.heightAnchor.constraint(equalToConstant: 40),
            
            teamsListView.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: 10),
            teamsListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            teamsListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            teamsListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        headerView.configure(title: "Home")
    }
    
    func configure(teams: [Team]) {
        let totalMembers = teams.reduce(0) { $0 + $1.memberCount }
        summaryView.configure(teamCount: teams.count, totalMembers: totalMembers)
        teamsListView.configure(with: teams)
    }
}
