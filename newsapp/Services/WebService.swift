//
//  WebService.swift
//  newsapp
//
//  Created by chukwuma.udokporo on 02/07/2021.
//

import Foundation

class Webservice {
    
    let baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2021-06-02&sortBy=publishedAt&apiKey=7042336d71644367887156ba42e68deb"
    
    
    func getArticles (completion: @escaping ([Article]?) -> () ) {
        
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            if let data = data {
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                completion(articlesList?.articles)
            }
        }.resume()
    }
    
}

