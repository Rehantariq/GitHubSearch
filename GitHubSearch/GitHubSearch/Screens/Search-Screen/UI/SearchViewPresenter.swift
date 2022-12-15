//
//  SearchViewPresenter.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

class SearchViewPresenter : AnyPresenter {
    
    let repositoryService: AnyRepositoryService
    var repositories: [Repository] = []
    private var throttler: Throttler?
    
    typealias ViewDelegate = SearchViewDelegate?
    var view: SearchViewDelegate?{
        didSet {
            if let _ = view {
                didAttachView()
            }
        }
    }
    
    init(repositoryService: AnyRepositoryService){
        self.repositoryService = repositoryService
    }
    
    func didAttachView() {
    }
    
    func search(text: String){
        self.view?.hideMessage()
        if self.throttler == nil  {
            self.throttler = Throttler()
        }
        
        self.throttler?.throttle(){ [weak self]  in
            guard let self = self else {return}
            self.throttler = nil
            
            self.repositoryService.search(text: text) { [weak self] (result: SearchResult?, error )in
                guard let self = self else {return}
                
                if error != nil {
                    if let message = error?.localizedDescription {
                        DispatchQueue.main.async {
                        self.view?.showMessage(text: message)
                        }
                    }
                    return
                }
                if let items = result?.items {
                    self.repositories = items
                    DispatchQueue.main.async {
                        self.view?.updateView()
                    }
                }
            }
            
        }
    }
}
