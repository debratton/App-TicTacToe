//
//  ViewController.swift
//  TicTacToe
//
//  Created by David E Bratton on 10/21/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playBtn: UIBarButtonItem!
    
    // Set Game Status
    var activeGame = true
    
    // 1 is o and 2 is x
    var activePlayer = 1
    
    // 0 = empty, 1 = 0, 2 = x
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Winning Combinations
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        playBtn.isEnabled = false
    }

    // NOTE (sender.tag doesn't work with Default Any and had to set to UIButton
    @IBAction func xoBtnPressed(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0  && activeGame {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "o.png"), for: [])
                //print(sender.tag)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "x.png"), for: [])
                //print(sender.tag)
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    // Someone has one
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "We have a wiener! Good Job (O)."
                    } else {
                        winnerLabel.text = "We have a wiener! Good Job (X)."
                    }
                    activeGame = false
                    winnerLabel.isHidden = false
                    playBtn.isEnabled = true
                    
                    
                }
            }
        }
    }
    
    @IBAction func playGameBtnPressed(_ sender: UIBarButtonItem) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winnerLabel.isHidden = true
        playBtn.isEnabled = false
        
        // Go through and clear all images on buttons
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
    }
    
    
}

