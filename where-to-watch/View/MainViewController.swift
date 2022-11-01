//
//  MainViewController.swift
//  where-to-watch
//
//  Created by Christian Paulo on 19/10/22.
//

import UIKit

class MainView: UIView{
    let tableView = UITableView()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(tableView)
        self.backgroundColor = .red
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
