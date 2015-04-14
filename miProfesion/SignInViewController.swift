//
//  SignInViewController.swift
//  miProfesion
//
//  Created by Carolina De La Torre on 3/18/15.
//  Copyright (c) 2015 Martha Garcia Contreras. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion

class SignInViewController: UIViewController, GPPSignInDelegate {
    
    var signIn: GPPSignIn?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.clientID = "993209742773-tpo92j7r26jtfkn86koje2ab86iegfhn.apps.googleusercontent.com"
        signIn?.scopes = [kGTLAuthScopePlusLogin]
        signIn?.delegate = self
        
        // User is already authenticated
        let userLoggedIn = signIn?.trySilentAuthentication()
        if (userLoggedIn!.boolValue) {
            self.presentMainStoryboard()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func googlePlusSignIn(sender: AnyObject) {
        signIn?.authenticate()

    }
    
    // MARK: - G+
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        self.presentMainStoryboard()
    }
    
    func didDisconnectWithError(error: NSError!) {
        
    }
    
    func presentMainStoryboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController") as! UIViewController
        self.presentViewController(mainViewController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
