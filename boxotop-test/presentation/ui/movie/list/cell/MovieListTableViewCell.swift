//
//  MovieListTableViewCell.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private var informationContainerView: [UIView]!
    @IBOutlet private weak var movieTypeLabel: UILabel!
    @IBOutlet private weak var movieDateLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.isHighlighted = false
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.applyCornerRadius(withRadius: MovieListTableViewCellValues.MOVIE_IMAGE_CORNER_RADIUS)
        informationContainerView.forEach({
            $0.applyCircleRender()
        })
    }
    
    func setup(movie: MovieSearchDataWrapper) {
        movieTitleLabel.text = movie.title
        movieTypeLabel.text = movie.type
        movieDateLabel.text = movie.years
        movieImageView.kf.setImage(with: movie.imageUrl)
    }
}
