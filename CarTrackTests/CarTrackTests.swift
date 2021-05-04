//
//  CarTrackTests.swift
//  CarTrackTests
//
//  Created by Avin More on 3/5/21.
//
import XCTest
import Moya
@testable import CarTrack
class CarTrackTests: XCTestCase {
    var viewModel = AuthenticationViewModel()
    let dashboardViewModel = DashboardViewModel()
    let mockDashboardService = BaseProvider<DashboardService>(
        stubClosure: MoyaProvider.immediatelyStub, //This enables mocking to avoid internet call for testing APIs
        manager: BaseProvider<DashboardService>.customManager()
    )
    func testCountryList() {
        XCTAssertFalse(viewModel.countryList.isEmpty, "Country names are unavailable")
    }
    func testValidateInput() {
        viewModel.userName = "test@test.test"
        _ = viewModel.validateInput(textfiledType: .userName)
        viewModel.password = "testtest"
        _ = viewModel.validateInput(textfiledType: .password)
        viewModel.selectedCountry = "Singapore"
        _ = viewModel.validateInput(textfiledType: .selection)
        XCTAssertTrue(viewModel.loginButtonStatus.filter({ !$0.isValid }).first == nil, "Invalid input")
    }
    func testValidUserId() {
        XCTAssertTrue("test@test.test".isValidUserName(), "is valid user function has issue")
        XCTAssertFalse("test@test".isValidUserName(), "is valid user function has issue")
    }
    func testUpdateButtonStatus() {
        viewModel.updateLoginButtonStatus = { result in
            XCTAssertTrue(result.last?.isValid == true, "Login could not be enabled")
        }
        viewModel.userName = "test@test.test"
        _ = viewModel.validateInput(textfiledType: .userName)
        viewModel.password = "testtest"
        _ = viewModel.validateInput(textfiledType: .password)
        viewModel.selectedCountry = "Singapore"
        _ = viewModel.validateInput(textfiledType: .selection)
    }
    func testFetchUsers() {
        let exp = expectation(description: "Fetch mock user data")
        dashboardViewModel.service = mockDashboardService
        dashboardViewModel.users?.removeAll()
        dashboardViewModel.fetchUsers() { [weak self] in
            if self?.dashboardViewModel.users?.count == 10 {
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 2)
    }
}
