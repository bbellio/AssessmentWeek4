//
//  BBMovieTableViewCell.swift
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBMovieTableViewCell: UITableViewCell {
    // MARK: - Global Variables
    var movie: BBMovie? 
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Custom Functions
    func updateViews(for movie: BBMovie) {
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        overviewLabel.text = movie.overview
    }
}
