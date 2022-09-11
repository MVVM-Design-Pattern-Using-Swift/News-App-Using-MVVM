//
//  WebService.swift
//  GoodNews
//
//  Created by JongHoon on 2022/09/12.
//

import UIKit
import Alamofire

class WebService {
    
    //    func getArticles(
    //        url: URL,
    //        completion: @escaping([Article]?) -> Void
    //    ) {
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            if let error = error {
    //                print(error.localizedDescription)
    //                completion(nil)
    //            } else if let data = data {
    //
    //                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
    //
    //                if let articleList = articleList {
    //                    completion(articleList.articles)
    //                }
    //
    //                print(articleList?.articles)
    //            }
    //
    //        }.resume()
    //    }
    
    
    func getArticles(
        url: URL,
        completion: @escaping([Article]?) -> Void) {
        AF.request(url, method: .get)
            .responseDecodable(of: ArticleList.self) { response in
                switch response.result {
                case .success(let value): completion(value.articles)
                    print(value.articles)
                case .failure(let error): print(error.localizedDescription)
                }
            }
    }
}
