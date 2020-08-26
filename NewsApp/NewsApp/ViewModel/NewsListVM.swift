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

    func loadData() {
        NetworkManager.shared.getTopHeadlines { (result) in
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case .success(let newsData):
                let newsVM = newsData.map(NewsViewModel.init)
                self.getImages(for: newsVM)

                DispatchQueue.main.async {
                    self.news = newsVM
                }

            }
        }
    }

    func getImages(for news: [NewsViewModel]) {
        news.forEach {
            if !$0.urlToImage.isEmpty {
                let urlString = $0.urlToImage
                NetworkManager.shared.downloadImage(urlString: urlString) { (result) in
                    switch result {
                    case .failure(let error): print(error.localizedDescription)
                    case .success(let data):
                        DispatchQueue.main.async {
                            self.imageData[urlString] = data
                        }
                    }
                }
            }
        }
    }
}
