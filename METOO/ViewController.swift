//
//  ViewController.swift
//  METOO
//
//  Created by Петр Дорожкин on 14.07.15.
//  Copyright (c) 2015 Петр Дорожкин. All rights reserved.
//

import UIKit
import Socket_IO_Client_Swift
import SwiftHTTP
import FBSDKCoreKit
import FBSDKLoginKit



class ViewController: UIViewController, FBSDKLoginButtonDelegate{
    
    let socket = SocketIOClient(socketURL: base_url)
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            println("Not logged in..")
        }
        else
        {
            println("Logged in..")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error == nil
        {
            println("Login complete.")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else
        {
            println(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        println("User logged out...")
    }
    
    @IBAction func SocketButton(sender: UIButton) {
        socket.on("connect") {data, ack in
            println("socket connected")
        }
        socket.connect()
    }


}







//class ViewController: UIViewController, UIAlertViewDelegate, FBSDKLoginButtonDelegate{
//
//    let socket = SocketIOClient(socketURL: base_url)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    func httpGet(url: String, callback: (String, String?) -> Void) {
//        var request = HTTPTask()
//        request.GET(url, parameters: nil, completionHandler: {(response: HTTPResponse) in
//            if let err = response.error {
//                callback("", err.localizedDescription)
//            }
//            if let data = response.responseObject as? NSData {
//                var result = NSString(data: data, encoding:
//                    NSASCIIStringEncoding)!
//                callback(result as String, nil)
//            }
//        })
//    }
//    func httpPost(url: String, params: Dictionary<String,AnyObject>, callback: (String, String?) -> Void) {
//        var request = HTTPTask()
//        //we have to add the explicit type, else the wrong type is inferred. See the vluxe.io article for more info.
//        let params: Dictionary<String,AnyObject> = ["param": "param1", "array": ["first array element","second","third"], "num": 23, "dict": ["someKey": "someVal"]]
//        request.POST("http://domain.com/create", parameters: params, completionHandler: {(response: HTTPResponse) in
//            if let err = response.error {
//                callback("", err.localizedDescription)
//            }
//            if let data = response.responseObject as? NSData {
//                var result = NSString(data: data, encoding:
//                    NSASCIIStringEncoding)!
//                callback(result as String, nil)
//            }
//        })
//    }
//    
//    func sendAJAXRequest(url: String, method: String, jsonString: String, callback: (httpResponse: NSHTTPURLResponse) -> Void) {
//        
//        var request = NSMutableURLRequest(URL: NSURL(string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 5)
//        var response: NSURLResponse?
//        var error: NSError?
//        
//        request.HTTPMethod = method
//        
//        if method != "GET" {
//            // create some JSON data and configure the request
//            request.HTTPBody = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
//
//            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        }
//        
//        // send the request
//        NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
//        
//        // look at the response
//        if let httpResponse = response as? NSHTTPURLResponse {
//            callback(httpResponse: httpResponse)
//        } else {
//            println("bad request "+url+" "+method)
//        }
//        
//    }
//    
//    @IBAction func SocketButton(sender: UIButton) {
//        socket.on("connect") {data, ack in
//            println("socket connected")
//        }
//        socket.connect()
//    }
//
//
//    @IBAction func FBLoginButton(sender: UIButton) {
////        httpGet(base_url){
////            (data, error) -> Void in
////            if error != nil {
////                println(error)
////            } else {
////                println(data)
////            }
////        }
//        httpPost("http://www.posttestserver.com/", params: ["name": "hello", "type": "world"]){
//            (data, error) -> Void in
//            if error != nil {
//                println(error)
//            } else {
//                println(data)
//            }
//        }
//    }
//    
//    @IBOutlet weak var MainIndicator: UIActivityIndicatorView!
//    
//    @IBAction func VKButton(sender: UIButton) {
//
//    }
//    
//    
//    
//}




