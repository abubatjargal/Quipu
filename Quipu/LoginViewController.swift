//
//  LoginViewController.swift
//  Quipu
//
//  Created by Abu Batjargal on 8/22/17.
//  Copyright © 2017 Abu Batjargal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupBackground() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "login_background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }

    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "segueHome", sender: self)
    }
}
