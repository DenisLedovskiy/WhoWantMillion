//
//  ViewController.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 02.03.2022.
//

import UIKit

class MenuViewController: UIViewController {


    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var rezultButton: UIButton!

    let fromMenuToGameIdentifire = "fromMenuToGame"
    let session = Game.instance

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startGame(_ sender: Any) {
        session.session?.numberOfGame += 1
        performSegue(withIdentifier: fromMenuToGameIdentifire, sender: Any.self)
    }


}

