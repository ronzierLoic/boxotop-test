//
//  MovieListTableViewCell.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private var informationContainerView: [UIView]!
    @IBOutlet private weak var movieTypeLabel: UILabel!
    @IBOutlet private weak var movieDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.applyCornerRadius(withRadius: MovieListTableViewCellValues.MOVIE_IMAGE_CORNER_RADIUS)
        informationContainerView.forEach({
            $0.applyCircleRender()
        })
    }
}

