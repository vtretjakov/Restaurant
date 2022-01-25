//
//  URL+Extension.swift
//  Restaurant
//
//  Created by Владимир on 25.01.2022.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return components?.url
    }
}
// данный экстеншн позволяет к URL добавлять словарь где в качестве параметров идут ключи (в нашем случае категории), а в качестве значений - значения (категории)

