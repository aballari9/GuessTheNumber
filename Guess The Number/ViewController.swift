//
//  ViewController.swift
//  Guess The Number
//
//  Created by Akhila Ballari on 9/5/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberofGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberToGuess = generateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(upperBound))) + lowerBound
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        if let guess = guessTextField.text {
            if let numberGuess = Int(guess) {
                numberofGuesses += 1
                print(guess)
                validateGuess(numberGuess)
            }
        }
        guessTextField.text = ""
        
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            guessLabel.text = "Guess out of range"
        } else if guess < numberToGuess {
            guessLabel.text = "Guess higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Guess lower! ⬇️"
        } else {
            showWinAlert()
        }
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "CONGRATS! 😁", message: "You won after only \(numberofGuesses) guesses.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play again", style: .default, handler: { _ in
            
            self.guessLabel.text = "Guess the number"
            self.numberofGuesses = 0
            self.numberToGuess = self.generateRandomNumber()
        })
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }

}

