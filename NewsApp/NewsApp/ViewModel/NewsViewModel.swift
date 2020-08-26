//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by omrobbie on 27/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

struct NewsViewModel {

    let news: News

    var author: String {
        return news.author ?? "Unknown"
    }

    var description: String {
        return news.description ?? ""
    }

    var title: String {
        return news.title ?? ""
    }

    var url: String {
        return news.url
    }

    var urlToImage: String {
        return news.urlToImage ?? "photo"
    }
}
