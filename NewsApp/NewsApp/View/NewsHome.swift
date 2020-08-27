//
//  NewsHome.swift
//  NewsApp
//
//  Created by omrobbie on 27/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import SwiftUI

struct NewsHome: View {

    @ObservedObject private var newsListVM = NewsListVM()

    init() {
        newsListVM.loadData()
    }

    var body: some View {
        VStack {
            NewsListHeader()
            
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
