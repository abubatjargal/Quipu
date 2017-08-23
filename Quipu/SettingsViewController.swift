//
//  SettingsViewController.swift
//  Quipu
//
//  Created by Abu Batjargal on 8/22/17.
//  Copyright © 2017 Abu Batjargal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOut(_ sender: Any) {
        self.performSegue(withIdentifier: "segueLogin", sender: self)
    }

}
