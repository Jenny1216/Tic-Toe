//
//  ViewController.swift
//  tic toe
//
//  Created by Jinisha Savani on 10/1/18.
//  Copyright © 2018 Jinisha Savani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
        playGame(selectedButton: sender)
       if winner == nil {
            sender.isEnabled = false
       } else if winner != nil {
        sender.isEnabled = true
        resetGame()
        playGame(selectedButton: sender)
        }
    }
    var activePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    var winner : String!
    
    func playGame(selectedButton: UIButton){
        
        if activePlayer == 1 {
            
            selectedButton.setTitle("O", for: .normal)
            player1.append(selectedButton.tag)
            activePlayer = 2
            
        } else if activePlayer == 2 {
            
            selectedButton.setTitle("X", for: .normal)
            player2.append(selectedButton.tag)
            activePlayer = 1
        }
        
        findWinner()
    }
    
    func findWinner(){
        
        let msg1 = "Great Job!"
        let msg2 = "No Winner!"
       
        if ((player1.contains(1) && player1.contains(2) && player1.contains(3)) || (player1.contains(4) && player1.contains(5) && player1.contains(6)) || (player1.contains(7) && player1.contains(8) && player1.contains(9)) || (player1.contains(1) && player1.contains(4) && player1.contains(7)) || (player1.contains(2) && player1.contains(5) && player1.contains(8)) || (player1.contains(3) && player1.contains(6) && player1.contains(9)) || (player1.contains(1) && player1.contains(5) && player1.contains(9)) || (player1.contains(3) && player1.contains(5) && player1.contains(7)))
        {
            winner = "Player 1 is winner"
            alertView(message: msg1)
        }
        else if ((player2.contains(1) && player2.contains(2) && player2.contains(3)) || (player2.contains(4) && player2.contains(5) && player2.contains(6)) || (player2.contains(7) && player2.contains(8) && player2.contains(9)) || (player2.contains(1) && player2.contains(4) && player2.contains(7)) || (player2.contains(2) && player2.contains(5) && player2.contains(8)) || (player2.contains(3) && player2.contains(6) && player2.contains(9)) || (player2.contains(1) && player2.contains(5) && player2.contains(9)) || (player2.contains(3) && player2.contains(5) && player2.contains(7)) )
        
        {
            winner = "Player 2 is winner"
            alertView(message: msg1)
       }
        else if ((player1.count == 4 && player2.count == 5) || (player1.count == 5 && player2.count == 4)){
            winner = "Oops!"
            alertView(message: msg2 )
        }
//       winner = ""
    }
    
    func alertView(message: String) {
        
        let alert = UIAlertController(title: "\(winner ?? "")", message: "\(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        resetGame()
        
    }
    
    func resetGame() {
        for button in allButtons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        
        player1 = []
        player2 = []
        winner = nil
    }
    
    
}

