//
//  NetworkManager.swift
//  NewsApp
//
//  Created by omrobbie on 26/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private let apiKey: String = {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path),
            let value = dict["ApiKey"] as? String else {
                return "ApiKey not found!"
        }
        return value
    }()
}
