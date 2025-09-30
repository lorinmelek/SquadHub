//
//  TeamCell.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

final class TeamCell: UITableViewCell {
    
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var memberCountLabel: UILabel!

    func configure(with team: Team) {
        teamNameLabel.text = team.name
        memberCountLabel.text = "\(team.memberCount) üye"
    }
}
