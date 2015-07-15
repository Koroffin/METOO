//
//  ViewController.swift
//  TicTacIOiOS
//
//  Created by Erik Little on 3/7/15.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
    
    let socket = SocketIOClient(socketURL: "https://morning-tundra-5050.herokuapp.com")
    var name:String?
    var resetAck:AckEmitter?
    
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
        socket.on("connect") {data, ack in
            println("socket connected")
        }
        self.socket.connect()
    }

    
    
    
    
}

