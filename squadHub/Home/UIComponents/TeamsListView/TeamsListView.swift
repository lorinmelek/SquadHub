//
//  TeamsListView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 24.09.2025.
//

import UIKit

final class TeamsListView: UIView {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var teams: [Team] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "TeamsListView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
        let nib = UINib(nibName: "TeamCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TeamCell")
    }
    
    func configure(with teams: [Team]) {
        self.teams = teams
        tableView.reloadData()
    }
}

extension TeamsListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        let team = teams[indexPath.row]
        cell.configure(with: team)
        return cell
    }
}
