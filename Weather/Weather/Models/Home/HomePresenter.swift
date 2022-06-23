//
//  HomePresenter.swift
//  Weather
//
//  Created by Adem Tarhan on 23.06.2022.
//

import Foundation

protocol HomePresenterImp : AnyObject{
    
    var view: HomeViewControllerImp? {get set}
    var interactor: HomeInteractorImpl? {get set}
    func presenter(for city: String)
}


class HomePresenter: HomePresenterImp{
    var view: HomeViewControllerImp?
    var interactor: HomeInteractorImpl?
    typealias JSON = [String: AnyObject]
    
    func presenter(for city: String) {
        interactor?.currentData(for: city, { result,error  in
            print("----")
            print(result)
        })
    }
    
    
    
    
}
