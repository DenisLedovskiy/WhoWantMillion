//
//  SettingsViewController.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 18.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func switchChange(_ sender: Any) {

        if Game.instance.currentStrategy == 1 {
            Game.instance.currentStrategy = 0
        } else {
            Game.instance.currentStrategy = 1
        }
    }
    
}
