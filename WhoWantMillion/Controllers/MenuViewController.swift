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
    let fromMenuToRezults = "fromMainToRezults"

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startGame(_ sender: Any) {
        performSegue(withIdentifier: fromMenuToGameIdentifire, sender: Any.self)
    }

    @IBAction func showRezults(_ sender: Any) {
        performSegue(withIdentifier: fromMenuToRezults, sender: Any.self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromMenuToGameIdentifire{
            guard let destinationVC = segue.destination as? GameViewControler else {return}
            if Game.instance.session == nil {
                let session = GameSession()
                Game.instance.session = session
                destinationVC.delegate = session
            }
        }
    }


}

