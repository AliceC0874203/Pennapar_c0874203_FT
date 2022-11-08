//
//  ViewController.swift
//  Pennapar_c0874203_FT
//
//  Created by Alice’z Poy on 2022-11-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var randomNumber: Int = 0
    var results: [ResultObjProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestion()
    }
    
    func generateQuestion() {
        randomNumber = Int.random(in: 0...9999)
        numberLabel.text = "\(randomNumber)"
        resultImageView.isHidden = true
    }

    @IBAction func answerAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Odd"  {
            checkOddNumber(answerIsOdd: true)
        } else {
            checkOddNumber(answerIsOdd: false)
        }
    }
    
    func checkOddNumber(answerIsOdd: Bool) {
        if randomNumber % 2 == 0 { // Even
            if answerIsOdd == false {
                finishCheckedAnswer(answerIsCorrect: true, isOdd: false, messageAlert: "Yay !.. Correct answer... \n Correct answer is Even")
            } else {
                finishCheckedAnswer(answerIsCorrect: false, isOdd: false, messageAlert: "Oops.. Wrong answer... \n Correct answer is Even")
            }
        } else { // Odd
            if answerIsOdd == true {
                finishCheckedAnswer(answerIsCorrect: true, isOdd: true, messageAlert: "Yay !.. Correct answer... \n Correct answer is Odd")
            } else {
                finishCheckedAnswer(answerIsCorrect: false, isOdd: true, messageAlert: "Oops.. Wrong answer... \n Correct answer is Odd")
            }
        }
    }
    
    func finishCheckedAnswer(answerIsCorrect: Bool, isOdd: Bool, messageAlert: String) {
        results.append(ResultObj(number: randomNumber, answerIsCorrect: answerIsCorrect, isOdd: isOdd))
        showAlert(message: messageAlert)
        setImageResult(isCorrect: answerIsCorrect)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play Again !", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.generateQuestion()
        }))
        
        alert.addAction(UIAlertAction(title: "Show Progress", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.generateQuestion()
            strongSelf.showProgressTVC()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func setImageResult(isCorrect: Bool) {
        resultImageView.isHidden = false
        if isCorrect {
            resultImageView.image = UIImage(named: "Correct")
        } else {
            resultImageView.image = UIImage(named: "InCorrect")
        }
    }
    
    func showProgressTVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "ShowProgressTVC") as? ShowProgressTVC else { return }
        vc.results = results
        navigationController?.pushViewController(vc, animated: true)
    }
}

