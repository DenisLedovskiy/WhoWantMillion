//
//  AddQuestionViewController.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 18.03.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {


    @IBOutlet weak var setQuestion: UITextField!

    @IBOutlet weak var setFirstAnswer: UITextField!
    @IBOutlet weak var setSecondAnswer: UITextField!
    @IBOutlet weak var setThirdAnswer: UITextField!
    @IBOutlet weak var setFouthAnswer: UITextField!
    @IBOutlet weak var setRightAnswer: UITextField!

    var mementoAddQuestion = MementoAddQuestion()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func addQuestion(_ sender: Any) {

        guard let question = setQuestion.text,
              let firstAnswer = setFirstAnswer.text,
              let secondAnswer = setSecondAnswer.text,
              let thirdAnswer = setThirdAnswer.text,
              let fourthAnswer = setFouthAnswer.text else {return}

        let addedQuestion = [Questions(numberOfQuestion: 6,
                                 question: question,
                                 answers: [0: firstAnswer,
                                           1: secondAnswer ,
                                           2: thirdAnswer,
                                           3: fourthAnswer],
                                 idRightAnswer: setRightAnswer.text?.hashValue ?? 0)]

        mementoAddQuestion.save(records: addedQuestion)
    }

}
