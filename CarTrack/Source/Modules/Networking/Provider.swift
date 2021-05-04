//
//  Provider.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
class Provider {
    public static let dashboardService = BaseProvider<DashboardService>(
        //        stubClosure: MoyaProvider.immediatelyStub,
        manager: BaseProvider<DashboardService>.customManager()
        //        ,plugins: [NetworkLoggerPlugin(verbose: true)]
    )
}
