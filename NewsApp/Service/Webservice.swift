//
//  Webservice.swift
//  NewsApp
//
//  Created by Hamza Oban on 15.10.2022.
//

import Foundation
class Webservice {
    func getNews(url : URL, completion : @escaping ([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, URLResponse, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
        }.resume()
    }
}
