//
//  ViewController.swift
//  NerdClash
//
//  Created by Ian Boersma on 1/22/16.
//  Copyright © 2016 iboersma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Lbl: UILabel!
    @IBOutlet weak var player2Lbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var player1Img: UIImageView!
    @IBOutlet weak var player2Img: UIImageView!
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    
    var player1: Player!
    var player2: Player!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create player objects
        player1 = Player(name: "Barbarian", hp: 120, attackPwr: 12)
        player2 = Player(name: "Gladiator", hp: 100, attackPwr: 14)
        
        player1Lbl.text = "\(player1.hp) HP"
        player2Lbl.text = "\(player2.hp) HP"
    }

    
    @IBAction func onTapPlyr1AttackBtn(sender: AnyObject) {

            player2.receiveAttack(player1.attackPwr)
            messageLbl.text = "\(player1.name) attacked \(player2.name) for \(player1.attackPwr) HP"
            player2Lbl.text = "\(player2.hp) HP"
            player2AttackBtn.hidden = true

        
        if !player2.isAlive {
            player2Img.hidden = true
            player2Lbl.hidden = true
            player1AttackBtn.hidden = true
            player2AttackBtn.hidden = true
            player1Lbl.hidden = true
            messageLbl.text = "\(player1.name) vanquished \(player2.name)!!"
        
        } else {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "player2ButtonRestore", userInfo: nil, repeats: false)
        }
    }
    
    @IBAction func onTapPlyr2AttackBtn(sender: AnyObject) {
        
            player1.receiveAttack(player2.attackPwr)
            messageLbl.text = "\(player2.name) attacked \(player1.name) for \(player2.attackPwr) HP"
            player1Lbl.text = "\(player1.hp) HP"
            player1AttackBtn.hidden = true

        
        if !player1.isAlive {
            player1Img.hidden = true
            player1Lbl.hidden = true
            player2AttackBtn.hidden = true
            player1AttackBtn.hidden = true
            player2Lbl.hidden = true
            messageLbl.text = "\(player2.name) vanquished \(player1.name)!!"
            
        } else {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "player1ButtonRestore", userInfo: nil, repeats: false)
        }
        
    }
    
    func player2ButtonRestore() {
        
       player2AttackBtn.hidden = false
        
    }
    
    func player1ButtonRestore() {
        
        player1AttackBtn.hidden = false
        
    }


}

