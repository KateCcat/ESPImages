//
//  ApiManager.swift
//  ESPImages
//
//  Created by Kate on 12.09.17.
//  Copyright © 2017 Kate. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    
    typealias ErrorCompletion = (Error?) -> Void
    typealias ImageCompletion = ([ImageModel]?, Error?) -> Void
 
    func getModels(completion: @escaping ImageCompletion) {
        
        Alamofire.request("http://www.xiag.ch/share/testtask/list.json")
       // Alamofire.request(Router.getProjects())
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[ImageModel]>) in
                
                if let items = response.result.value {
                    completion(items, nil)
                } else {
                    //response.logError()
                    completion(nil, response.result.error)
                }
        }
        
       
    }
    
    


}
