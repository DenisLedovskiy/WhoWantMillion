//
//  GameViewController.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 02.03.2022.
//

import UIKit

protocol GameSessionDelegate: AnyObject {

    func getGameRigtQustions(rightQuestion: Int)
    func getGameBalance(balance: Int)
    func getGameWinRate(winRateProcent: Int)

}

class GameViewControler: UIViewController {

    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTable: UITableView!
    @IBOutlet weak var costQuestionLabel: UILabel!

    var session = GameSession()
    var mementoAddQuestion = MementoAddQuestion()

    var delegate: GameSessionDelegate?
    
    var questionArray = [Questions]()
    var indexQuestion = 0
    var questionCounter = 0
    var numberOfQuestion = 1
    var winRate = 0
    var prize = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        fillQuestionArray()
        setLabelsText()

        answerTable.delegate = self
        answerTable.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(setWinRate), name: Notification.Name("winRate"), object: nil)
    }

    @objc func setWinRate() {

    //winRate = session.winRate
        winRate = (questionCounter * 100) / questionArray.count

    }

    func setLabelsText() {
        numberOfQuestionLabel.text = "Вопрос \(numberOfQuestion) (Ответил: \(winRate) %)"
        questionLabel.text = questionArray[indexQuestion].question
        costQuestionLabel.text = "Ответьте и получите \(prize.description) рублей!"
    }


    func fillQuestionArray() {

    let questionOne = Questions(numberOfQuestion: 1,
                                question: "Где, если верить пословице, любопытной Варваре нос оторвали?",
                                answers: [0 : "Магазин",
                                          1: "Дом",
                                          2: "Конкретно в Дикси",
                                          3: "Базар"],
                                idRightAnswer: 3)
    let questionTwo = Questions(numberOfQuestion: 2,
                                question: "Кто самая красивая?",
                                answers: [0 : "Стаська",
                                          1: "Катя",
                                          2: "Лена",
                                          3: "Маша"],
                                idRightAnswer: 0)
    let questionThree = Questions(numberOfQuestion: 3,
                                  question: "Какую фамилию носил главный герой поэмы А. Твардовского?",
                                  answers: [0 : "Ложкин",
                                            1: "Теркин",
                                            2: "Пароваркин",
                                            3: "Мясорубкин"],
                                  idRightAnswer: 1)
    let questionFour = Questions(numberOfQuestion: 4,
                                 question: "Какой советский космонавт получил первую космическую почту?",
                                 answers: [0 : "Гагарин",
                                           1: "Петров",
                                           2: "Шаталов",
                                           3: "Грузнов"],
                                 idRightAnswer: 2)
    let questionFive = Questions(numberOfQuestion: 5,
                                 question: "Какой танец исполнил Чарли Чаплин в фильме Золотая лихорадка?",
                                 answers: [0 : "Танец моряка",
                                           1: "Польку",
                                           2: "Вальс",
                                           3: "Танец булочек"],
                                 idRightAnswer: 3)
        
    questionArray.append(questionOne)
    questionArray.append(questionTwo)
    questionArray.append(questionThree)
    questionArray.append(questionFour)
    questionArray.append(questionFive)
    questionArray = Game.instance.gameStrategy[Game.instance.currentStrategy].getQuestion(question: questionArray)
    let addQuestions = mementoAddQuestion.retrieveRecords()
    questionArray += addQuestions
    }
}
