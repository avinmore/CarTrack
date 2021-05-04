//
//  DashboardViewModel.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import Foundation
class DashboardViewModel {
    var reloadUI: (() -> Void)?
    var users: CTUsers? {
        didSet {
            reloadUI?()
        }
    }
    func fetchUsers() {
        Provider.dashboardService.request(target: .users) { [weak self] result in
            do {
                switch result {
                case let .success(response):
                    let response = try JSONDecoder().decode(CTUsers.self, from: response.data)
                    self?.users = response
                case let .failure(error):
                    debugPrint(error)
                }
            } catch {
                
            }
        }
    }
}
