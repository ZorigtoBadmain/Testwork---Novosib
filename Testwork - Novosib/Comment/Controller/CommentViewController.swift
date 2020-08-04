//
//  CommentViewController.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 01.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    var userId = 0
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var comment = [ModelComment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let network = NetworkServiceComment()
        network.getComment(userId: userId) { (response) in
            self.comment = response
            self.tableView.reloadData()
        }
    }
}

extension CommentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let post = comment[indexPath.row]
        cell.nameLabel.text = post.name
        cell.bodyLabel.text = post.body
        
        return cell
        
    }
}
