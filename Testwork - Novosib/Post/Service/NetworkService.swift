//
//  NetworkService.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 01.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import Foundation


class NetworkServis {
    
    func getJSON(completion: @escaping ([ModelPost]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                
            guard let data = data else { return }
                
                do {
                    let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
                    guard let array = json as? [[String: AnyObject]] else { throw NetworkError.failInternetError }
                    
                    var posts = [ModelPost]()
                    
                    for dictionari in array {
                        guard let modelPost = ModelPost(dict: dictionari) else { continue }
                        
                        posts.append(modelPost)
                    }
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                } catch {
                    print(error)
                }
        }.resume()
    }
}
