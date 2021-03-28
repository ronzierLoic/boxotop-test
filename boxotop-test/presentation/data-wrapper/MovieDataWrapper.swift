//
//  MovieDataWrapper.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 28/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Foundation

class MovieDataWrapper {
    let movie: MovieEntity
    
    init(movie: MovieEntity) {
        self.movie = movie
    }
    
    var imagerUrl: URL? {
        guard let poster = movie.poster else { return nil }
        return URL(string: poster)
    }
    
    var title: String {
        movie.title ?? ""
    }
    
    var genre: String? {
        movie.genre
    }
    
    var plot: String? {
        movie.plot
    }
    
    var runtime: String? {
        guard let runtime = movie.runtime else { return nil }
        return R.string.localized.movieRuntime(runtime)
    }
    
    var writer: String? {
        movie.writer
    }
    
    var actors: String? {
        movie.actors
    }
    
    var type: String? {
        switch movie.type {
        case "series":
            return R.string.localized.movieTypeSeries()
        case "movie":
            return R.string.localized.movieTypeMovie()
        case "game":
            return R.string.localized.movieTypeGame()
        default:
            return movie.type
        }
    }
}
