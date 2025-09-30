//
//  HomeViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 26.09.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let contentView = HomeContentView()
    private let tabBarView = TabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        view.addSubview(contentView)
        view.addSubview(tabBarView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarView.delegate = self
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor),
            

            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83)
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

extension HomeViewController: TabBarViewDelegate {
    func tabBarView(_ tabBarView: TabBarView, didSelectTabAt index: Int) { }
}
