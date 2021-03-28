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
        container.register(MovieListNavigator.self) { (_: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            MovieListNavigator(viewControllerProvider: viewControllerProvider, router: router)
        }
        
        container.register(MovieListViewModel.self) { resolver in
            MovieListViewModel(movieRepository: resolver.forceResolve(MovieRepository.self))
        }
        
        container.register(MovieListViewController.self) { (_: Resolver, viewControllerProvider: ViewControllerProvider, router: Router) in
            MovieListViewController.makeViewController(
                viewModel: container.forceResolve(MovieListViewModel.self),
                navigator: container.forceResolve(MovieListNavigator.self, arguments: viewControllerProvider, router)
            )
        }
    }
}
