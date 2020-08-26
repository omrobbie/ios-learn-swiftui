//
//  NewsListVM.swift
//  NewsApp
//
//  Created by omrobbie on 27/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class NewsListVM: ObservableObject {

    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
}
