//
//  Game.swift
//  thehunt
//
//  Created by Adam Wexler on 9/13/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import Foundation

class Game{
    var mScore: Int
    var mTime: Int = 5
    
    init() {
        mScore = 0
    }
    
    func increaseScore(){
        mScore += 100
    }
    
    func decreaseScore(){
        mScore -= 100
    }
    
    func updateScore() -> String{
        return "Current Score: \(mScore)"
    }
    
    func countDown() -> String{
        return "\(mTime) Seconds"
    }
    
    func printMessage() -> String{
        return "Stop!"
    }
    
}