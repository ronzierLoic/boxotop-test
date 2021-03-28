//
//  MovieResponse.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

struct MovieSearchResponseEntity: Codable {
    let moviesSearch: [MovieSearchEntity]?
    let totalResults: String?
    let response: String

    enum CodingKeys: String, CodingKey {
        case moviesSearch = "Search"
        case totalResults
        case response = "Response"
    }
}
