//
//  Article.swift
//  newsapp
//
//  Created by chukwuma.udokporo on 02/07/2021.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}
struct Article: Decodable  {
    var title: String
    var description: String
}
