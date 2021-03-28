//
//  MovieDetailViewController.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    
    @IBOutlet private weak var raitingView: UIView!
    
    @IBOutlet private weak var typesContainer: UIView!
    @IBOutlet private weak var typesLabel: UILabel!
    
    @IBOutlet private weak var informationContainer: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var runtimeLabel: UILabel!
    
    @IBOutlet private weak var plotTitleStackView: UIStackView!
    @IBOutlet private weak var plotTitleLabel: UILabel!
    @IBOutlet private weak var plotLabel: UILabel!
    
    @IBOutlet private weak var writerStackView: UIStackView!
    @IBOutlet private weak var writerTitleLabel: UILabel!
    @IBOutlet private weak var writerLabel: UILabel!
    
    @IBOutlet private weak var actorsStackView: UIStackView!
    @IBOutlet private weak var actorsTitleLabel: UILabel!
    @IBOutlet private weak var actorsLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel: MovieDetailViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Function
extension MovieDetailViewController {
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        informationContainer.roundSpecificCorners(corners: [.topLeft, .topRight], radius: MovieDetailViewControllerValues.INFORMATION_VIEW_CORNER_RADIUS)
        typesContainer.applyCircleRender()
        
    }
}

// MARK: - Internal Extension
extension MovieDetailViewController {
    static func makeViewController(
        viewModel: MovieDetailViewModel
    ) -> MovieDetailViewController {
        guard let viewController = R.storyboard.movieDetailViewController.movieDetailViewController() else {
            preconditionFailure()
        }
    
        viewController.viewModel = viewModel
        
        return viewController
    }
}
