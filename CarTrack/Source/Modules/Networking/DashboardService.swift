//
//  DashboardService.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//

import Foundation
import Moya
//define each service
public enum DashboardService {
    case users
}
//config each service
extension DashboardService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    public var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .users:
            return .get
        }
    }
    public var task: Task {
        switch self {
        case .users:
            return .requestPlain
        }
    }
    //
    public var sampleData: Data {
        switch self {
        case .users:
            guard let url = Bundle.main.url(forResource: "users", withExtension: "json"),
                let data = try? Data(contentsOf: url) else { return Data() }
            return data
        }
    }
    public var headers: [String : String]? {
        return nil
    }
}
