//
//  NewsListTableViewController.swift
//  newsapp
//
//  Created by chukwuma.udokporo on 02/07/2021.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        Webservice().getArticles { articles in
           
            guard let articles = articles else {return}
            self.articleListVM = ArticleListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData(); 
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM == nil ? 0 : self.articleListVM.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newListCell", for: indexPath) as! ArticleTableViewCell
        
        cell.titleLable.text = articleListVM.articles[indexPath.row].title
        cell.descriptionLable.text = articleListVM.articles[indexPath.row].description
        
        return cell
    }
}
