//
//  Article.swift
//  GoodNews
//
//  Created by JongHoon on 2022/09/12.
//

import UIKit

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    
}
