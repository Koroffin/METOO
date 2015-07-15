//
//  DataProvider.swift
//  METOO
//
//  Created by Петр Дорожкин on 15.07.15.
//  Copyright (c) 2015 Петр Дорожкин. All rights reserved.
//


typealias ServiceResponse = (NSDictionary?, NSError?) -> Void

class DataProvider: NSObject {
    
    var client:AFHTTPRequestOperationManager?
    let LOGIN_URL = "/api/v1/login"
    
    class var sharedInstance:DataProvider {
        struct Singleton {
            static let instance = DataProvider()
        }
        return Singleton.instance
    }
    
    func setupClientWithBaseURLString(urlString:String) {
        client = AFHTTPRequestOperationManager(baseURL: NSURL.URLWithString(urlString))
        client!.operationQueue = NSOperationQueue.mainQueue()
        client!.responseSerializer = AFJSONResponseSerializer()
        client!.requestSerializer = AFJSONRequestSerializer()
    }
    
    func loginWithEmailPassword(email:String, password:String, onCompletion: ServiceResponse) -> Void {
        self.client!.POST(LOGIN_URL, parameters: ["email":email, "password":password] , success: {(operation:AFHTTPRequestOperation!, responseObject:AnyObject!) -> Void in
            
            self.setupClientWithBaseURLString("http://somebaseurl.com")
            
            let responseDict = responseObject as NSDictionary
            // Note: This is where you would serialize the nsdictionary in the responseObject into one of your own model classes (or core data classes)
            onCompletion(responseDict, nil)
            }, failure: {(operation: AFHTTPRequestOperation!, error:NSError!) -> Void  in
                onCompletion(nil, error)
        })
    }
}