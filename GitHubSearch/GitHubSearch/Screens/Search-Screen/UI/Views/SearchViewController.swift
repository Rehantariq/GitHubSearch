//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 14/12/2022.
//

import Foundation

import UIKit

class SearchViewController: UIViewController  {
    
    //MARK: - "iVars"
    var presenter : SearchViewPresenter!
    
    //MARK: - "IBOutlet"
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK: - "ViewControllerLife"
    override func viewDidLoad() {
        self.navigationItem.title = "Search".loc
        viewSetup()
    }
    
    private func viewSetup(){
        presenter.view = self
        messageLabel.isHidden = true
    }

    //MARK: - "iMethods"
}

extension SearchViewController : SearchViewDelegate {
    
    func updateView(){
        tableView.reloadData()
    }
    
    func showMessage(text: String) {
        messageLabel.isHidden = false
        messageLabel.text = text
    }
    
    func hideMessage() {
        messageLabel.isHidden = true
    }
}

extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(text: searchText)
    }
}
