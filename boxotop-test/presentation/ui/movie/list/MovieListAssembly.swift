//
//  MovieListAssembly.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

class MovieListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieListNavigator.self) { _ in
            MovieListNavigator()
        }
        
        container.register(MovieListViewModel.self) { _ in
            MovieListViewModel()
        }
        
        container.register(MovieListViewController.self) { _ in
            MovieListViewController.makeViewController(
                viewModel: container.forceResolve(MovieListViewModel.self),
                navigator: container.forceResolve(MovieListNavigator.self)
            )
        }
    }
}
