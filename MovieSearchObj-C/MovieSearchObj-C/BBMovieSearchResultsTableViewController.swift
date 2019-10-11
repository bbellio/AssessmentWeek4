//
//  BBMovieSearchResultsTableViewController.swift
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBMovieSearchResultsTableViewController: UITableViewController {
    // MARK: - Global Variables
    var movies: [BBMovie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? BBMovieTableViewCell else { return UITableViewCell()}
        let movie = movies[indexPath.row]
        cell.movie = movie
        cell.updateViews(for: movie)
        return cell
    }
} // End of class

// MARK: - Extension
extension BBMovieSearchResultsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        BBMovieController.fetchMovies(withSearchText: searchText) { (movies) in
            self.movies = movies
        }
    }
}
