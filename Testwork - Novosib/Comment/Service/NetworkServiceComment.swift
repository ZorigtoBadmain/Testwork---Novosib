//
//  NetworkServiceComment.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 02.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import Foundation

class NetworkServiceComment {

func getComment(userId: Int, completion: @escaping ([ModelComment]) -> Void) {
    let urlString = "https://jsonplaceholder.typicode.com/posts/\(userId)/comments"
    guard let url = URL(string: urlString) else { return }
    
    let session = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
            guard let array = json as? [[String: AnyObject]] else { throw NetworkError.failInternetError }
            
            var posts = [ModelComment]()
            
            for dictionari in array {
                guard let modelPost = ModelComment(dict: dictionari) else { continue }
                
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
