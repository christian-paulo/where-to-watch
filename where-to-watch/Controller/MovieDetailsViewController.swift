//
//  MovieDetailsViewController.swift
//  where-to-watch
//
//  Created by Christian Paulo on 24/10/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var viewModel: Parser
    
    init(viewModel: Parser = Parser()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detalhe Filmes"
        viewModel.idMovie()
        // Do any additional setup after loading the view.
    }

}
