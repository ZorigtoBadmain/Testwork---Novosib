//
//  ViewController.swift
//  Testwork - Novosib
//
//  Created by Зоригто Бадмаин on 01.08.2020.
//  Copyright © 2020 Зоригто Бадмаин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var comment = [ModelPost]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let network = NetworkServis()
        network.getJSON { (response) in
            self.comment = response
            self.tableView.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showComment", let ticket = sender as? ModelPost, let vc = segue.destination as? CommentViewController else { return }
            
        vc.userId = ticket.id
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        
        let post = comment[indexPath.row]
        cell.titleLabel.text = post.title
        cell.bodyTextView.text = post.body

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentId = comment[indexPath.row]
        performSegue(withIdentifier:"showComment", sender: commentId)
    }
}






