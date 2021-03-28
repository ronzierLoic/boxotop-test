//
//  MovieDetailViewModel.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

class MovieDetailViewModel {
    private var idMovie: String
    private var movieRepository: MovieRepository
    
    // MARK: - DisposeBag
    private var disposeBag = DisposeBag()
    
    // MARK: - Outputs
    var movie: PublishSubject<MovieDataWrapper> = PublishSubject()
    var error: PublishSubject<Void> = PublishSubject()
    
    init(idMovie: String, movieRepository: MovieRepository) {
        self.idMovie = idMovie
        self.movieRepository = movieRepository
    }
    
    func retrieveMovie() {
        movieRepository
            .retrieveMovie(by: idMovie)
            .map(MovieDataWrapper.init)
            .subscribe(onSuccess: { [weak self] movie in
                self?.movie.onNext(movie)
            }, onError: { [weak self] _ in
                self?.error.onNext(())
            })
            .disposed(by: disposeBag)
    }
}
