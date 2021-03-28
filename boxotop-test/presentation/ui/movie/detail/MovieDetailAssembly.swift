//
//  MovieDetailAssembly.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Swinject

class MovieDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieDetailViewModel.self) { (resolver: Resolver, idMovie: String) in
            MovieDetailViewModel(
                idMovie: idMovie,
                movieRepository: resolver.forceResolve(MovieRepository.self)
            )
        }
        
        container.register(MovieDetailViewController.self) { (_, idMovie: String) in
            MovieDetailViewController.makeViewController(
                viewModel: container.forceResolve(MovieDetailViewModel.self, argument: idMovie)
            )
        }
    }
}
