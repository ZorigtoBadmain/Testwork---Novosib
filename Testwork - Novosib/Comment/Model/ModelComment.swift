//
//  ModelComment.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 02.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import Foundation

struct ModelComment {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    init?(dict: [String: AnyObject]) {
        guard let postId = dict["postId"] as? Int,
            let id = dict["id"] as? Int,
            let name = dict["name"] as? String,
            let email = dict["email"] as? String,
            let body = dict["body"] as? String else { return nil }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
