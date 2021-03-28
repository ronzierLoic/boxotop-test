//
//  MovieRepository.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

class MovieRepository {
    private var apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func retieveMovies(search: String) -> Single<[MovieSearchEntity]> {
        apiManager.getMovies(search: search)
    }
    
    func retrieveMovie(by id: String) -> Single<MovieEntity> {
        apiManager.getMovie(by: id)
    }
}
