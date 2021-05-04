//
//  CTUser.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import Foundation
// MARK: - CTUser
struct CTUser: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
    func description() -> String {
        "\(street) \(suite) \(city) \(zipcode)"
    }
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
    func description() -> String {
        "\(name) \(catchPhrase) \(bs)"
    }
}

typealias CTUsers = [CTUser]
