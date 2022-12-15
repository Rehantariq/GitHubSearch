//
//  Repository.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

struct SearchResult: Codable {
    let total_count: Int?
    let items: [Repository]?
}

struct Repository: Codable {
    let id: Int
    let name: String
}
