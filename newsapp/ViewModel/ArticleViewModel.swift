//
//  ArticleViewModel.swift
//  newsapp
//
//  Created by chukwuma.udokporo on 02/07/2021.
//

import Foundation


struct ArticleListViewModel {
    let articles: [Article]
}


struct ArticleViewModel {
    
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String { return self.article.description}
    var description: String {return self.article.description}
    
}
