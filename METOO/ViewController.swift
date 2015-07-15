//
//  ViewController.swift
//  METOO
//
//  Created by Петр Дорожкин on 14.07.15.
//  Copyright (c) 2015 Петр Дорожкин. All rights reserved.
//

import UIKit




class ViewController: UIViewController {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Test Button", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func buttonAction(sender:UIButton!)
    {
        let socket = SocketIOClient(socketURL: "localhost:8080")
        
        socket.on("connect") {data, ack in
            println("socket connected")
        }
        
        
        
        socket.connect()
        println("Button tapped")
    }

}

