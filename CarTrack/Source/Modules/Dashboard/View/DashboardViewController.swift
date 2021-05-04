//
//  DashboardViewController.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
}
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
