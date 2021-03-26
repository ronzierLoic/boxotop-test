//
//  MovieListViewModel.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import RxSwift

class MovieListViewModel {
    private var movieRepository: MovieRepository
    
    // MARK: - Outputs
    var movieList: PublishSubject<[MovieSearchDataWrapper]> = PublishSubject()
    var error: PublishSubject<Void> = PublishSubject()
    
    // MARK: - DisposeBag
    private var disposeBag = DisposeBag()
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func retrieveMovies(search: String) {
        movieRepository
            .retieveMovies(search: search)
            .map { $0.map(MovieSearchDataWrapper.init) }
            .subscribe(onSuccess: { [weak self] movieSearchList in
                self?.movieList.onNext(movieSearchList)
            }, onError: { [weak self] _ in
                self?.error.onNext(())
            })
            .disposed(by: disposeBag)
    }
}
