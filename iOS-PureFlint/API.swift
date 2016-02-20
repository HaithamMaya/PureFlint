//
//  API.swift
//  PureFlint
//
//  Created by Rohan Mishra on 2/20/16.
//  Copyright © 2016 haithammaaieh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    static var baseURL: String = "http://54.201.150.217/api/v0.1/"
    
    static func callHearbeat(completion: (success: Bool, data: JSON) -> Void) {
        Alamofire.request(Method.GET, self.baseURL + "heartbeat").responseJSON { (response) -> Void in
            if response.result.isSuccess {
                completion(success: true, data: JSON(response.result.value!))
            }
            else {
                completion(success: false, data: nil)
            }
        }
    }
    
    static func loginUser() {
        
    }
    
}