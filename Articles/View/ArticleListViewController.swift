//
//  ArticleListViewController.swift
//  News
//
//  Created by Ravi kumar on 14/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    @IBOutlet weak var articleTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var isPrefetchingNextPage = false
    private var viewModel:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        viewModel = ArticleListViewModel(self)
        articleTableView.tableFooterView = UIView()
        activityIndicator.startAnimating()
        fetchNewPageOfArticles()
    }
    
    func fetchNewPageOfArticles() {
        if isPrefetchingNextPage && !viewModel.isMoreDataAvailable {
            return
        }
        isPrefetchingNextPage = true
        viewModel.fetchNewArticles()
    }
}

extension ArticleListViewController: ArticleDataDelegate{
    func didRecievNewArticles() {
        self.articleTableView.reloadData()
        isPrefetchingNextPage = false
        activityIndicator.stopAnimating()
    }
    
    func didRecieveError(err: Error) {
        isPrefetchingNextPage = false
        activityIndicator.stopAnimating()
    }
}


extension ArticleListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.articlesCount - 1 && !isPrefetchingNextPage{
            fetchNewPageOfArticles()
        }
    }
}

extension ArticleListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell ?? ArticleTableViewCell()
        let article = viewModel.articleFor(indexPath.row)
        cell.configureCell(article)
        return cell

    }
    
    
}
