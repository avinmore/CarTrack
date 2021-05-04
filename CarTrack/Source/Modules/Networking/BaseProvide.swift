//
//  BaseProvide.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import Foundation
import Moya
open class BaseProvider<Target>: MoyaProvider<Target> where Target: TargetType {
    open func request(target: Target,
                      callbackQueue: DispatchQueue? = .none,
                      progress: ProgressBlock? = .none,
                      completion: @escaping Completion) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        super.request(target, callbackQueue: callbackQueue, progress: progress) { result in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            completion(result)
        }
    }
    public static func customManager(_ timeout: Double? = 10) -> Manager {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = timeout ?? 10
        let manager = Manager(configuration: configuration)
        manager.startRequestsImmediately = false
        return manager
    }
}
class Provider {
    public static let dashboardService = BaseProvider<DashboardService>(
        //        stubClosure: MoyaProvider.immediatelyStub,
        manager: BaseProvider<DashboardService>.customManager()
        //        ,plugins: [NetworkLoggerPlugin(verbose: true)]
    )
}
