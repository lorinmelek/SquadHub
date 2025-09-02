import UIKit

final class TeamDetailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var nameLabel: UILabel!
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Team Detail"

        nameLabel.text = team?.name

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TeamDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        team?.members.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        if let member = team?.members[indexPath.row] {
            var content = cell.defaultContentConfiguration()
            content.text = member.name
            content.secondaryText = member.role
            cell.contentConfiguration = content
        }
        return cell
    }
}
