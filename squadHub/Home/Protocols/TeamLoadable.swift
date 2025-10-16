//
//  TeamLoadable.swift
//  SquadHub
//
//  Created by LORIN VURAL on 3.10.2025.
//

import UIKit

protocol TeamLoadable: AnyObject {
    func handleTeamsLoaded(_ teams: [Team])
}

extension TeamLoadable where Self: UIViewController {
    func loadTeams() {
        TeamService.shared.loadTeams { [weak self] result in
            switch result {
            case .success(let teams):
                self?.handleTeamsLoaded(teams)
            case .failure(let error):
                self?.handleTeamsError(error)
            }
        }
    }
    
    func handleTeamsError(_ error: Error) {
    }
}
