//
//  HomeViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 26.09.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let contentView = HomeContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
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
    
    private func loadData() {
        let testTeams = [
            Team(name: "Venus", members: [
                Member(name: "Dilan", role: "Developer"),
                Member(name: "Ahmet", role: "Designer")
            ]),
            Team(name: "Mars", members: [
                Member(name: "Merve", role: "Project Manager")
            ]),
            Team(name: "Merkur", members: [
                Member(name: "Selin", role: "iOS Developer"),
                Member(name: "Emre", role: "Backend Developer")
            ])
        ]
        
        contentView.configure(teams: testTeams)
    }
}
