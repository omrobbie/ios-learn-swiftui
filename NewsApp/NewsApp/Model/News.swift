//
//  News.swift
//  NewsApp
//
//  Created by omrobbie on 26/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

struct News: Decodable {

    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String
}

struct NewsEnvelope: Decodable {

    let status: String
    let totalResult: Int
    let articles: [News]
}
