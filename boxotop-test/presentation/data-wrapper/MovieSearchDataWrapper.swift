//
//  MovieSearchDataWrapper.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Foundation

class MovieSearchDataWrapper {
    let movieSearch: MovieSearchEntity
    
    init(movieSearch: MovieSearchEntity) {
        self.movieSearch = movieSearch
    }
    
    var title: String {
        movieSearch.title
    }
    
    var type: String {
        switch movieSearch.type {
        case "series":
            return R.string.localized.movieTypeSeries()
        case "movie":
            return R.string.localized.movieTypeMovie()
        case "game":
            return R.string.localized.movieTypeGame()
        default:
            return movieSearch.type
        }
    }
    
    var years: String {
        var year = movieSearch.year
        if let last = year.last,
            Int(String(last)) == nil {
            year.removeLast()
        }
        
        return year
    }
    
    var imageUrl: URL? {
        URL(string: movieSearch.poster)
    }
}


