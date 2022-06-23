//
//  Interactor.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
protocol HomeInteractorImpl: AnyObject {
    // ..

    func currentData(for city: String, _ completionHanlder: @escaping ([String: AnyObject]?, Errors?) -> Void)
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping ([String: AnyObject]?, Errors?) -> Void) -> URLSessionDataTask
}

class HomeInteractor: HomeInteractorImpl, ApiCallable {
    typealias JSON = [String: AnyObject]
    func currentData(for city: String, _ completionHanlder: @escaping (JSON?, Errors?) -> Void) {
        let taskUrl = "\(baseUrl)weather?q=\(city)&units=metric&appid=\(apiKey)"
        print("-----ad321-")

        guard let invalidUrl = taskUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let taskurl = URL(string: taskUrl) else {
            completionHanlder(nil, Errors.invalidUrl)
            print("line 23---")
            return
        }

        let dataTask = URLSession.shared.dataTask(with: taskurl) { data, _, error in
            guard error == nil else {
                completionHanlder(nil, Errors.RequestError)
                print("line 30---")
                return
            }

            if let data = data {
                do {
                    print("line 36---")
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                    completionHanlder(json, nil)
                } catch {
                    print("line 40---")
                    completionHanlder(nil, Errors.JSONParsingError)
                }
            } else {
                print("line 44---")
                completionHanlder(nil, Errors.invalidData)
            }
        }.resume()
    }

    let session: URLSession

    init(config: URLSessionConfiguration) {
        session = URLSession(configuration: config)
    }

    convenience init() {
        self.init(config: URLSessionConfiguration.default)
    }

    // .. "\(baseURL)weather?q=\(city)&units=metric&appid=\(apiKey)"

    var request = URL(string: "")

    func jsonTask(with request: URLRequest, completionHandler completion: @escaping (JSON?, Errors?) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, Errors.RequestError)
                return
            }
            print(request)
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                        completion(json, nil)
                    } catch {
                        completion(nil, Errors.JSONParsingError)
                    }
                }
            } else {
                completion(nil, Errors.ResponseUnsuccesful(statusCode: httpResponse.statusCode))
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
