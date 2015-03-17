//
//  ViewController.swift
//  miProfesion
//
//  Created by Martha Garcia Contreras on 12/03/15.
//  Copyright (c) 2015 Martha Garcia Contreras. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion


class ViewController: UIViewController{ //GPPSignInDelegate

    var signIn: GPPSignIn?
    override func viewDidLoad() {
        super.viewDidLoad()
    /*    signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.clientID = "993209742773-tpo92j7r26jtfkn86koje2ab86iegfhn.apps.googleusercontent.com"
        signIn?.scopes = [kGTLAuthScopePlusLogin]
        signIn?.delegate = self;
        signIn?.authenticate() */
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(sender: UIButton) {
        
    }
    
    /*MARK: G+
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        println(auth)
    }
    
    func didDisconnectWithError(error: NSError!) {
        
    }*/
    

}

