//
//  Services.swift
//  LearnSomeNewCoding
//
//  Created by Adarsh Raj on 23/07/21.
//

import Foundation
import UIKit
import Alamofire

typealias successHandler = (Any?) -> Void
typealias successHandlers = (Any?) -> Void
typealias failureHandler = (Error?, String) -> Void


enum RequestedUrlType: String {

    case HomePage = "homepage"
    
    
    
}

class ServiceCall: NSObject
{
   
    static let kServerURL = "" //URL

    static var mmm : DataRequest?
    
    
    let genericError = "Opps..Somthing went wrong."
    
    var sessionManager:URLSession?
    
    var storedSuccess:successHandler?
    var storedfailure:failureHandler?
  
    class var sharedInstance: ServiceCall {
        struct Singleton {
            static let instance = ServiceCall()
        }
        return Singleton.instance
    }
    
    override init() {
        self.sessionManager = URLSession.shared
    }
    
    
    
    
func sendRequest(parameters:[String : Any],httpMethod:String ,methodType:RequestedUrlType,successCall:@escaping successHandler,failureCall:@escaping failureHandler) -> Void
{
    //ConnectionManager.sharedInstance.observeReachability()
    let serverURL = self.getRequestedURL(url: methodType.rawValue,dictParam: parameters)
    let headers: HTTPHeaders = [
        "Content-Type": "application/json;charset=UTF-8"
    ]
    if httpMethod == "GET" {
        ServiceCall.mmm = AF.request(serverURL, method:.get, parameters: nil,encoding: JSONEncoding.default, headers: headers)
        
    }else if httpMethod == "POST"{
            ServiceCall.mmm = AF.request(serverURL, method: .post, parameters: parameters)

    }else if httpMethod == "PUT"{
            ServiceCall.mmm = AF.request(serverURL, method:.put, parameters: parameters,encoding: JSONEncoding.default,headers: headers)
  
    }
    else if httpMethod == "DELETE"{
            ServiceCall.mmm = AF.request(serverURL, method:.delete, parameters: parameters,encoding: JSONEncoding.default,headers: headers)
  
    }
    ServiceCall.mmm?.responseJSON { (response) in
        
           // print(response)
        
        switch response.result {
                      case .success(let data):
                          //print("Ok: \(data)")
                        successCall(response.value)
                          
                      case .failure(let error):
                        print(error.localizedDescription)
                        failureCall(nil, error.localizedDescription)
                      }
    }
    
}
    func getRequestedURL(url:String, dictParam: EIDictonary) -> String{
        var urlString = "";
        switch url {
        
        
        
        case RequestedUrlType.HomePage.rawValue:
            urlString = ServiceCall.kServerURL + "appapi/product/homepage";
            
        
        default:
            print("Default value")
        
        }
        return urlString
    }
    
}




