//
//  ModelPost.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 01.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import Foundation

struct ModelPost: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init?(dict: [String: AnyObject]){
        guard let userId = dict["userId"] as? Int,
            let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let body = dict["body"] as? String else { return nil}
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
}
