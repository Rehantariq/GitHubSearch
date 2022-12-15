//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 14/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapOnSearchButton( sender: UIButton ){
        
        let vc = SearchViewController.instanticate(appStoryboard: .Main)
        vc.presenter = SearchViewPresenter(repositoryService: RepositoryService())
        self.navigationController?.pushViewController(vc, animated:true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

