//
//  NewGameControllerViewController.swift
//  thehunt
//
//  Created by Adam Wexler on 9/15/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import UIKit
import CoreData

class NewGameControllerViewController: UIViewController {

    @IBOutlet weak var newGameLabel: UILabel!
    @IBOutlet weak var newPlayerLabel: UILabel!
    @IBOutlet weak var newPlayerEntry: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var newPlayerLabel2: UILabel!
    @IBOutlet weak var newPlayerEntry2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Establishes the Background of the New Game Storyboard
        view.backgroundColor = UIColor.blackColor()
        
        //Sets the Values that will be in the Labels
        newGameLabel.text = "New Game"
        newPlayerLabel.text = "1st Player"
        newPlayerLabel2.text = "2nd Player"
        errorMessageLabel.text = ""
        
        //Sets the Colors of those labels
        newGameLabel.textColor = UIColor.whiteColor()
        newPlayerLabel.textColor = UIColor.whiteColor()
        errorMessageLabel.textColor = UIColor.whiteColor()
        newPlayerLabel2.textColor = UIColor.whiteColor()
        
        //Positions the Text and Creates Spacing
        errorMessageLabel.adjustsFontSizeToFitWidth = false
        errorMessageLabel.numberOfLines = 0
        newGameLabel.textAlignment = .Center
        newPlayerLabel.textAlignment = .Center
        newPlayerLabel2.textAlignment = .Center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitName(sender: AnyObject) {
        //Checks Whether the User Entered A Correct Name
        if(newPlayerEntry.text != "" && newPlayerEntry2.text != ""){
            
            performSegueWithIdentifier("StartGameSegue", sender: self)
        
        } else{
            errorMessageLabel.text = "You Entered An Incorrect Username. Please, Try Again!"
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "StartGameSegue"{
            let destination = segue.destinationViewController as? ViewController
            destination?.playerOne = newPlayerEntry.text ?? "Player 1"
            destination?.playerTwo = newPlayerEntry2.text ?? "Player 2"
        } else {
            
        }
    }
    
    
    
    
    

}
