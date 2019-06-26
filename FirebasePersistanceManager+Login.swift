//
//  FirebasePersistanceManager+Login.swift
//  PMULibrary
//
//  Created by adeiji on 2019/3/6.
//  Copyright © 2019 Dephyned. All rights reserved.
//

import Foundation
import Firebase

public extension FirebasePersistenceManager {
    
    
    /// Create a user in Firebase
    ///
    /// - Parameters:
    ///   - email: The email of the user
    ///   - password: The password for the user
    class func createUser (withEmail email:String, password:String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            completion(result?.user, error)
        }
    }
    
    
    /// Sign a user into Firebase
    ///
    /// - Parameters:
    ///   - email: Email address of the user
    ///   - password: The password of the user
    ///   - completion: Completion block to be executed when finished logging user in
    class func signIn (withEmail email:String, password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            completion(result?.user, error)
        }
    }    
}
