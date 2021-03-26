//
//  MovieListViewController.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    // MARK: - Outlets

    // MARK: - Properties
    private var navigator: MovieListNavigator!
    private var viewModel: MovieListViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Boxotop"
    }
}

// MARK: - Internal Extension
extension MovieListViewController {
    static func makeViewController(
        viewModel: MovieListViewModel,
        navigator: MovieListNavigator
    ) -> MovieListViewController {
        guard let viewController = R.storyboard.movieListViewController.movieListViewController() else {
            preconditionFailure()
        }
    
        viewController.navigator = navigator
        viewController.viewModel = viewModel
        
        return viewController
    }
}
