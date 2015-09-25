//
//  ViewController.swift
//  thehunt
//
//  Created by Adam Wexler on 9/9/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var wrongSquare: UILabel!
    @IBOutlet weak var correctSquare: UILabel!
    @IBOutlet weak var currentTimer: UILabel!
    @IBOutlet weak var stopLabel: UILabel!
    
    var playerOne: String = "Player 1"
    var playerTwo: String = "Player 2"
    var game = Game()
    var timer = NSTimer()
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
    var counter: Int = 0
    var winner: String = ""
    var loser: String = ""
    var winnerScore: Int = 0
    var loserScore: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeGameView()
        
        //Setting the Tap Gesture Recognizer for both squares
        let correctTapped = UITapGestureRecognizer(target: self, action: "increaseScore")
        correctSquare.addGestureRecognizer(correctTapped)
        
        let wrongTapped = UITapGestureRecognizer(target: self, action: "decreaseScore")
        wrongSquare.addGestureRecognizer(wrongTapped)
        
        
    }
    
    func initializeGameView(){
        //Establishing the Settings for the Application of the Game
        restartGame()
        correctSquare.text = ""
        wrongSquare.text = ""
        currentScore.text = "Current Score: \(game.mScore)"
        currentTimer.text = ""
        correctSquare.userInteractionEnabled = true
        wrongSquare.userInteractionEnabled = true
        currentScore.font = currentScore.font.fontWithSize(18)
        currentTimer.font = currentTimer.font.fontWithSize(18)
        currentTimer.textAlignment = .Center
        currentScore.textAlignment = .Center
        view.backgroundColor = UIColor.blackColor()
        currentTimer.textColor = UIColor.whiteColor()
        currentScore.textColor = UIColor.whiteColor()
        stopLabel.text = ""
        stopLabel.textColor = UIColor.whiteColor()
        startGameTimer()
        stopLabel.center = CGPoint(x:20, y: 120)
        
    }

    func restartGame(){
        game = Game()
    }
    
    
    func startGameTimer(){
        //Set the Timer for the Game
        timer = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "countDown", userInfo: nil, repeats: true)
    }

    
    func countDown(){
        //Decrement the time of the Game
        game.mTime -= 1
        
        //Current Time is set
        currentTimer.text = game.countDown()
        if(game.mTime <= 0){
            
            //Stop the timer
            timer.invalidate()
            
            //Stops the User Interaction with the Squares on the Screen
            correctSquare.userInteractionEnabled = false
            wrongSquare.userInteractionEnabled = false
            
            //Prints the Stop Label of the Game
            stopLabel.text = game.printMessage()
            
            //Set Player 1's Score to Global Variable
            
            if (playerOneScore != 0){
                playerTwoScore = game.mScore
                if(playerOneScore > playerTwoScore){
                    winner = playerOne
                    loser = playerTwo
                    winnerScore = playerOneScore
                    loserScore = playerTwoScore
                }
                else{
                    winner = playerTwo
                    loser = playerOne
                    winnerScore = playerTwoScore
                    loserScore = playerOneScore
                }
            }
            
            else{
                playerOneScore = game.mScore
            }
            
            //Animates the Stop label
            animateStopLabel()
            
        
            
        } else {
            
            //Continues the User Interaction with the Squares on the Screen
            correctSquare.userInteractionEnabled = true
            wrongSquare.userInteractionEnabled = true
        }
        
    }
    
    
    
    //Contributes to game logic
    func increaseScore(){
        //Calling the game increase Score method
        game.increaseScore()
        
        //Sets the score to the text of the Current Score label
        currentScore.text = game.updateScore()
        
        //Randomizes the Location of the Squares
        randomizeLocationOfCorrectSquare()
        randomizeLocationOfWrongSquare()
    }
    
    //Contributes to game logic
    func decreaseScore(){
        //Calling the game decrease Score method
        game.decreaseScore()
        
        //Sets the score to the text of the Current Score label
        currentScore.text = game.updateScore()
        
        //Randomize the Location of the Squares
        randomizeLocationOfCorrectSquare()
        randomizeLocationOfWrongSquare()
    }
    
    //Contributes to game logic
    func randomNumberGeneratorY() -> UInt32{
        
        //Randomizes the Y Position for the Labels
        let range = UInt32(300)
        let randomNumber = arc4random_uniform(range)
        return randomNumber
        
    }
    
    //Contributes to game logic
    func randomNumberGeneratorX() -> UInt32{
        
        //Randomizes the X Position for the Labels
        let range = UInt32(100)
        let randomNumber = arc4random_uniform(range)
        return randomNumber
        
    }
    
    
    //Contributes to game logic
    func randomizeLocationOfWrongSquare(){
        
        // Animating the Wrong Square
        UIView.animateWithDuration(0.01, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options:UIViewAnimationOptions.AllowAnimatedContent, animations: {
            
                self.wrongSquare.center = CGPoint(x: Int(self.randomNumberGeneratorX()) + 20, y: Int(self.randomNumberGeneratorY()) + 20)
            
            }, completion: nil)
    
        
        
    }
    
    //Contributes to game logic
    func randomizeLocationOfCorrectSquare(){
        
        // Animating the Correct Square button
        UIView.animateWithDuration(0.01, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options:UIViewAnimationOptions.AllowAnimatedContent, animations: {
            
                self.correctSquare.center = CGPoint(x: Int(self.randomNumberGeneratorX() + 20), y: Int(self.randomNumberGeneratorY()) + 20)
            
            }, completion: nil)
        
        
    }
    
    func animateStopLabel(){
        
        UIView.animateWithDuration(2.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            
                self.stopLabel.center = CGPoint(x:200, y: 290)
            
            }, completion: {(value: Bool) -> Void in
                self.counter++
                if(self.counter < 2){
                    self.initializeGameView()
                } else{
                    
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    let gameResult = NSEntityDescription.insertNewObjectForEntityForName("SaveGame", inManagedObjectContext: appDelegate.managedObjectContext) as! SaveGame
                    gameResult.winner = self.winner
                    gameResult.loser = self.loser
                    gameResult.scoreWinner = self.winnerScore
                    gameResult.scoreLoser = self.loserScore
                    
                    self.performSegueWithIdentifier("HighScoreList", sender: self)
                }
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



