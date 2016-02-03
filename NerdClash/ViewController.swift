//
//  ViewController.swift
//  NerdClash
//
//  Created by Ian Boersma on 1/22/16.
//  Copyright © 2016 iboersma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1HpLabel: UILabel!
    @IBOutlet weak var player2HpLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    @IBOutlet weak var player1AttackButton: UIButton!
    @IBOutlet weak var player2AttackButton: UIButton!
    @IBOutlet weak var player1StackView: UIStackView!
    @IBOutlet weak var player2StackView: UIStackView!
    @IBOutlet weak var player1NameField: UITextField!
    @IBOutlet weak var player2NameField: UITextField!
    @IBOutlet weak var player1SegmentedControl: UISegmentedControl!
    @IBOutlet weak var player2SegmentedControl: UISegmentedControl!
    @IBOutlet weak var restartButton: UIButton!
    
    var gameInstance: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize game
        gameInstance = Game(vc: self)
        gameInstance.setUpGame()
    }

    @IBAction func player1AcceptButtonTapped(sender: AnyObject) {
        // Create player 1.
        gameInstance.createPlayer(1, hpIn: 100, attackPowerIn: 20, nameIn: player1NameField.text!, imageChoiceIn: player1SegmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func player2AcceptButtonTapped(sender: AnyObject) {
        // Create player 2.
        gameInstance.createPlayer(2, hpIn: 100, attackPowerIn: 20, nameIn: player2NameField.text!, imageChoiceIn: player2SegmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func player1Attack(sender: AnyObject) {
        // Disable player 1's 'Attack' button and enable player 2's.
        player1AttackButton.enabled = false
        player2AttackButton.enabled = true
        
        // Perform the attack.
        gameInstance.setUpAttack(gameInstance.player1, playerBeingAttackedIn: gameInstance.player2)
        
    }
    
    @IBAction func player2Attack(sender: AnyObject) {
        
        // Disable player 2's 'Attack' button and enable player 1's.
        player1AttackButton.enabled = true
        player2AttackButton.enabled = false
        
        // Perform the attack.
        gameInstance.setUpAttack(gameInstance.player2, playerBeingAttackedIn: gameInstance.player1)
    }
    
    @IBAction func restartButtonTapped(sender: AnyObject) {
        // Restart the game when the 'Restart' button is pressed.
        gameInstance.restartGame()
    }


}

