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

    // MARK: - The Url's
    private let BASE_URL = "https://newsapi.org/v2"
    private let TOP_HEADLINES = "/top-headlines"

    // MARK: - Query parameters
    private let PARAM_COUNTRY = "country"
}

// MARK: - Services
extension NetworkManager {

    func getTopHeadlines(completion: @escaping (Result<[News], Error>) -> ()) {
        let urlString = NetworkManager.shared.BASE_URL + NetworkManager.shared.TOP_HEADLINES
        guard var urlComponents = URLComponents(string: urlString) else {return}

        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: PARAM_COUNTRY, value: "us"),
        ]

        guard let url = urlComponents.url else {return}

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }

            guard let data = data else {return}

            do {
                let decodeData = try JSONDecoder().decode(NewsEnvelope.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(decodeData.articles))
                }
            } catch {
                print("Error", error.localizedDescription)
                completion(.failure(error))
                return
            }
        }
    }
}
