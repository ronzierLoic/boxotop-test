//
//  MovieListNavigator.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class MovieListNavigator: Navigator {
    enum Destination {
        case detail(id: String)
    }
    
    private weak var viewControllerProvider: ViewControllerProvider?
    private var router: Router
    
    init(viewControllerProvider: ViewControllerProvider, router: Router) {
        self.viewControllerProvider = viewControllerProvider
        self.router = router
    }


    func navigate(to destination: Destination) {
        let controller = makeViewContoller(destination: destination)
        switch destination {
        case .detail:
            router.push(controller)
        }
    }
}

private extension MovieListNavigator {
    func makeViewContoller(destination: Destination) -> Presentable {
        guard let viewControllerProvider = viewControllerProvider else { return UIViewController() }
        
        switch destination {
        case .detail(let idMovie):
            return viewControllerProvider.movieDetailViewController(idMovie: idMovie)
        }
    }
}
