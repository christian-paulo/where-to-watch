//
//  ViewController.swift
//  where-to-watch
//
//  Created by Christian Paulo on 17/10/22.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating{
    
    let parser = Parser()
    var movies = [Movie]()
    
    
    let searchController = UISearchController()
    
    let mainView = MainView()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        
        parser.parse{
            data in
            self.movies = data
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
        self.mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.mainView.tableView.frame = view.bounds
        
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].name
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = Parser(id: movies[indexPath.row].id)
        let detailsMovie = MovieDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(detailsMovie, animated: true)
    }
}

