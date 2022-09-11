//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by JongHoon on 2022/09/12.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
        tableView.separatorStyle = .singleLine
        tableView.contentInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2bec224456fb479eb04d74c7e95e81b2") else { return }
        
        WebService().getArticles(url: url) { [weak self] articles in
            
            if let articles = articles {
                self?.articleListViewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return articleListViewModel?.numberOfSections ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return articleListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ArticleTableViewCell",
            for: indexPath
        ) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not foung")
        }
        
        let articleViewModel = articleListViewModel?.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel?.title
        cell.descriptionLabel.text = articleViewModel?.description
        
        return cell
    }
    
}
