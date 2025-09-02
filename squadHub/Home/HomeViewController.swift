import UIKit
import Foundation

final class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statsLabel: UILabel!

    // MARK: - State
    private var teams: [Team] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension

        loadDataAndRefreshUI()
    }

    // MARK: - Helpers
    private func loadDataAndRefreshUI() {
        teams = DataLoader.loadTeams()
        let memberCount = teams.reduce(0) { $0 + $1.members.count }

        statsLabel.text = "\(teams.count) Ekip | \(memberCount) Üye"

        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeCell", for: indexPath)
        let team = teams[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = team.name
        content.secondaryText = "Üye sayısı: \(team.members.count)"
        cell.contentConfiguration = content
        cell.selectionStyle = .default
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedTeam = teams[indexPath.row]

        let sb = UIStoryboard(name: "TeamDetail", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "TeamDetailViewController") as? TeamDetailViewController {
            vc.team = selectedTeam
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
