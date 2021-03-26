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
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var navigator: MovieListNavigator!
    private var viewModel: MovieListViewModel!
    
    
    private var searchBarController: UISearchBar!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private function
private extension MovieListViewController {
    func setupUI() {
        title = R.string.localized.movieListTitle()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        searchBarController = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: MovieListViewControllerValues.SEARCH_BAR_HEIGHT))
        searchBarController.backgroundImage = UIImage()
        searchBarController.delegate = self
        searchBarController.placeholder = R.string.localized.movieListSearchPlaceholder()
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: MovieListViewControllerValues.SEARCH_BAR_HEIGHT))
        headerView.addSubview(searchBarController)
        
        tableView.tableHeaderView = headerView
        tableView.sectionIndexColor = .white
        tableView.sectionIndexBackgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: R.nib.movieListTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.movieListTableViewCell.identifier
        )
    }
}

// MARK: - SearchBar delegate
extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}

// MARK: - SearchBar delegate
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: remove when call api
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.movieListTableViewCell.identifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
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
