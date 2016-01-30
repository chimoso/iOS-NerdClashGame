//
//  Character.swift
//  NerdClash
//
//  Created by Ian Boersma on 1/22/16.
//  Copyright © 2016 iboersma. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int
    
    //getters
    var hp: Int {
        get {
            return _hp
        }
    }
    
//    var attackPwr: Int {
//        get {
//            // Generate random attack HP between 0 and 20
//            let rand = Int(arc4random_uniform(20))
//            self._attackPwr = rand
//            return rand
//        }
//    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr

    }
    
    func receiveAttack(attackPwr: Int) {
        self._hp -= attackPwr
 
    }
    
}