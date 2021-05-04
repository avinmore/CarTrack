//
//  LoginUser+CoreDataProperties.swift
//  
//
//  Created by Avin More on 4/5/21.
//
//

import Foundation
import CoreData


extension LoginUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginUser> {
        return NSFetchRequest<LoginUser>(entityName: "LoginUser")
    }

    @NSManaged public var userId: String?
    @NSManaged public var password: Data?

}
