//
//  RepositoryService.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

typealias ResultData<T> = (T? , _ error: Error?) -> Void

class RepositoryService: AnyRepositoryService {

    private let search = "search/repositories"

    private func url(path: String) -> URL {
        let original = baseUrl + path
        if let encoded = original.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
        {
            return  url.absoluteURL
        }
        return  URL(string: baseUrl + path )!.absoluteURL
    }
    
    func search<T: Decodable>(text: String, completion: @escaping ResultData<T>){
        
        let urlRequest: URLRequest = URLRequest(url: url(path: search + "?q=" + text))
        let task =    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if error != nil {
                completion(nil, error)
                return
            }
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                            completion(result, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
            }
            task.resume()
    }
}

