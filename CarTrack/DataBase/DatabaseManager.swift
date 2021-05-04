//
//  DatabaseManager.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
import CoreData
class DatabaseManager {
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    static let loginUserRequest = NSFetchRequest<LoginUser>(entityName: "LoginUser")
    class func checkForUser(_ userId: String, _ pass: String) -> LoginUser? {
        let request = DatabaseManager.loginUserRequest
        request.predicate = NSPredicate(format: "userId = %@", userId)
        do {
            let users = try DatabaseManager.context.fetch(request)
            return users.first(where: { user in return String(data: user.password ?? Data(), encoding: .utf8) == pass })
        } catch {
            return nil
        }
    }
    class func createLoginUser() {
        DatabaseManager.clearAllUsers()
        let user = LoginUser(context: DatabaseManager.context)
        user.userId = "car@test.com"
        user.password = "cartrack".data(using: .utf8)!
        do { try context.save() } catch { debugPrint(error) }
    }
    class func clearAllUsers() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "LoginUser")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch { debugPrint(error) }
    }
}
