//
//  MasterViewController.swift
//  thehunt
//
//  Created by Adam Wexler on 9/14/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import UIKit
import CoreData


class MasterViewController: UIViewController {

    @IBOutlet weak var titleOfGame: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.blackColor()
        titleOfGame.textColor = UIColor.whiteColor()
        titleOfGame.font = titleOfGame.font.fontWithSize(40.0)
        
        titleOfGame.textAlignment = .Center
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func HighScoresList(sender: AnyObject) {
        performSegueWithIdentifier("highScoresList", sender: self)
    }
    
    @IBAction func instructions(sender: AnyObject){
        let alert = UIAlertController(title: "How to Play", message: howToPlay(), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func howToPlay() -> String{
        return "You Must Choose the Gray Square in Order to Beat Your Opponents. Don't Pick the Orange Squares."
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    


}
