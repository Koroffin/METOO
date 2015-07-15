//
//  ViewController.swift
//  METOO
//
//  Created by Петр Дорожкин on 14.07.15.
//  Copyright (c) 2015 Петр Дорожкин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    let socket = SocketIOClient(socketURL: "https://morning-tundra-5050.herokuapp.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Test Button", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    func buttonAction(sender:UIButton!) {
        socket.on("connect") {data, ack in
            println("socket connected")
        }
        socket.connect()
    }

}



