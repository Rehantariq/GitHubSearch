//
//  AnyRepositoryService.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

protocol AnyRepositoryService: AnyObject {
    
    func search<T: Decodable>(text: String, completion: @escaping ResultData<T>)
}

extension AnyRepositoryService {
    var baseUrl: String {
        return "https://api.github.com/"
    }
}
