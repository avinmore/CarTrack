//
//  DashboardViewController.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
class DashboardViewController: UIViewController {
    let viewModel = DashboardViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadUI = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.fetchUsers {}
        tableView.reloadData()
        title = "Contacts"
        addLogout()
    }
    func addLogout() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
    }
    @objc func logout() {
        guard let authView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthenticationViewController") as? AuthenticationViewController else {
            return
        }
        AppDelegate.setRootController(UINavigationController(rootViewController: authView))
    }
}
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell",
                                                       for: indexPath) as? UserInfoTableViewCell else {
            return UITableViewCell()
        }
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        if let users = viewModel.users, users.indices.contains(indexPath.row) {
            let user = users[indexPath.row]
            cell.loadData(user)
        }
        return cell
    }
}
