//
//  MovieDetailViewController.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    
    @IBOutlet private weak var ratingView: UIView!
    @IBOutlet private weak var ratingStackView: UIStackView!
    
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
    
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    private var viewModel: MovieDetailViewModel!
    
    private var disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        loadViewModel()
    }
}

// MARK: - Private Function
extension MovieDetailViewController {
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        informationContainer.roundSpecificCorners(corners: [.topLeft, .topRight], radius: MovieDetailViewControllerValues.INFORMATION_VIEW_CORNER_RADIUS)
        typesContainer.applyCircleRender()
        ratingView.applyCircleRender()
        [titleLabel, genreLabel, runtimeLabel, plotTitleStackView, writerStackView, actorsStackView, typesContainer, ratingView].forEach { $0?.isHidden = true }
        plotTitleLabel.text = R.string.localized.moviePlotTitle()
        writerTitleLabel.text = R.string.localized.movieWriterTitle()
        actorsTitleLabel.text = R.string.localized.movieActorsTitles()
    }
    
    func setupDetail(movie: MovieDataWrapper) {
        movieImageView.kf.setImage(with: movie.imagerUrl)
        
        titleLabel.isHidden = false
        titleLabel.text = movie.title
        
        genreLabel.isHidden = movie.genre == nil
        genreLabel.text = movie.genre
        
        runtimeLabel.isHidden = movie.runtime == nil
        runtimeLabel.text = movie.runtime
        
        typesContainer.isHidden = false
        typesLabel.text = movie.type
        
        plotTitleStackView.isHidden = movie.plot == nil
        plotLabel.text = movie.plot
        
        writerStackView.isHidden = movie.writer == nil
        writerLabel.text = movie.writer
        
        actorsStackView.isHidden = movie.actors == nil
        actorsLabel.text = movie.actors
        
        ratingView.isHidden = movie.rating == nil
        setupRating(rating: movie.rating ?? 0)
    }
    
    func bindViewModel() {
        viewModel
            .movie
            .subscribe(onNext: { [weak self] movie in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                
                self?.setupDetail(movie: movie)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .error
            .subscribe(onNext: { [weak self] _ in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                
                self?.errorLabel.isHidden = false
                self?.errorLabel.text = R.string.localized.genericError()
            })
            .disposed(by: disposeBag)
    }
    
    func loadViewModel() {
        viewModel.retrieveMovie()
        activityIndicator.startAnimating()
    }
    
    func setupRating(rating: Int) {
        for index in 0..<5 {
            let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
            imageView.tintColor = .systemGray2
            imageView.contentMode = .scaleAspectFit
            
            if index < rating {
                imageView.tintColor = .yellow
            }
            
            ratingStackView.addArrangedSubview(imageView)
        }
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
