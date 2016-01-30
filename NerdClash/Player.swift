//
//  Player.swift
//  NerdClash
//
//  Created by Ian Boersma on 1/22/16.
//  Copyright © 2016 iboersma. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
}