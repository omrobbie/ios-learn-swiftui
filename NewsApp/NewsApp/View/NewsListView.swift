//
//  NewsListView.swift
//  NewsApp
//
//  Created by omrobbie on 27/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    let newsCollection: [NewsViewModel]
    let imageData: [String: Data]

    var body: some View {
        List(newsCollection, id: \.url) { news in
            NewsCell(news: news, image: Image(uiImage: (self.imageData[news.urlToImage] == nil ? UIImage(systemName: "doc.append") : UIImage(data: self.imageData[news.urlToImage]!))!))
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(newsCollection: [], imageData: ["photo": Data.init()])
    }
}
