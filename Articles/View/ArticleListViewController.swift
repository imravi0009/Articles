//
//  ArticleListViewController.swift
//  News
//
//  Created by Ravi kumar on 14/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}


extension ArticleListViewController:UITableViewDelegate{
}

extension ArticleListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell ?? ArticleTableViewCell()
        
        return cell

    }
    
    
}
