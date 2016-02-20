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
    
    static func checkEmail(userEmail: String, completion: (success: Bool, data: JSON) -> Void) {
        let emailToBeChecked: [String : AnyObject] = [
            "email":userEmail
        ]
        
        Alamofire.request(Method.POST, self.baseURL + "user/exists", parameters: emailToBeChecked, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) -> Void in
            print(response.debugDescription)
            
            if response.response?.statusCode == 200 {
                completion(success: true, data: JSON(response.result.value!))
            }
            else {
                completion(success: false, data: nil)
            }
        }
    }
    
    static func registerUser(name: String, email: String, password: String, role: Int, completion: (success: Bool, data: JSON) -> Void) {
        let parameters: [String : AnyObject] = [
            "name": name,
            "email": email,
            "password": password,
            "role": role
        ]
        
        Alamofire.request(Method.POST, self.baseURL + "user/register", parameters: parameters, encoding: ParameterEncoding.URL, headers: nil)
    }
    
}