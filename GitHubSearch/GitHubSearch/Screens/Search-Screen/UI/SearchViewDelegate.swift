//
//  SearchViewDelegate.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

protocol SearchViewDelegate {
    
    func updateView()
    func showMessage(text:String)
    func hideMessage()
}


