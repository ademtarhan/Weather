//
//  Interactor.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
protocol HomeInteractorImplementable : AnyObject{
    //..
    func jsonTask(with request: URLRequest,completionHandler completion: @escaping([String: AnyObject]? , Errors?)->Void) -> URLSessionDataTask
}

class HomeInteractor : HomeInteractorImplementable{
    let session: URLSession
    
    init (config: URLSessionConfiguration){
        self.session = URLSession(configuration: config)
    }
    convenience init() {
        self.init(config: URLSessionConfiguration.default)
    }
    
    //.. "\(baseURL)weather?q=\(city)&units=metric&appid=\(apiKey)"
    typealias JSON = [String: AnyObject]
    var request = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a39be32a3b9802f13a79fcc3ea03e8f5")
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping (JSON?, Errors?) -> Void) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, Error in
            guard let httpResponse = response as? HTTPURLResponse else{
                completion(nil,Errors.RequestError)
                return
            }
            print(request)
            if httpResponse.statusCode == 200 {
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                        completion(json,nil)
                    }catch{
                        completion(nil,Errors.JSONParsingError)
                    }
                }else {
                    completion(nil,Errors.invalidData)
                }
            }else{
                completion(nil,Errors.ResponseUnsuccesful(statusCode: httpResponse.statusCode))
            }
        }
        return task
    }
    
//    private let service: Service
//
//    init(service: Service){
//        self.service = service
//    }
    
    
    
    
}
