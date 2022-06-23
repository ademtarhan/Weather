//
//  Service.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation

class Service {
    
   
    
    
    let session: URLSession
    
    init (config: URLSessionConfiguration){
        self.session = URLSession(configuration: config)
    }
    convenience init() {
        self.init(config: URLSessionConfiguration.default)
    }
    
    typealias JSON = [String: AnyObject]
    
    func jsonTask(with request: URLRequest,completionHandler completion: @escaping(JSON? , Errors?)->Void) -> URLSessionDataTask{
        let task = session.dataTask(with: request) { data, response, Error in
            guard let httpResponse = response as? HTTPURLResponse else{
                completion(nil,Errors.RequestError)
                return
            }
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
    
    
}
