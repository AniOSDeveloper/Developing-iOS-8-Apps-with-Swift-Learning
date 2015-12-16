//
//  User.swift
//  AutoLayout
//
//  Created by WangDa on 12/16/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login(login: String, password: String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }
    
    static let database: Dictionary<String, User> = {
        var theDatabase = Dictionary<String, User>()
        for user in [
            User(name: "Xing Xing", company: "TPO", login: "xx", password: "1234"),
            User(name: "San San", company: "Qing Hua", login: "ss", password: "1234"),
            User(name: "Da Da", company: "Raven", login: "dd", password: "1234"),
            User(name: "Ha Ha", company: "Tencent", login: "hh", password: "1234")
            ] {
            theDatabase[user.login] = user
        }
        return theDatabase
    }()
}