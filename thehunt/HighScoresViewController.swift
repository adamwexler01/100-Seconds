//
//  HighScoresViewController.swift
//  thehunt
//
//  Created by Adam Wexler on 9/19/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import UIKit
import CoreData

class HighScoresViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleOfHighScores: UILabel!
    @IBOutlet weak var scoresTableView: UITableView!
    var fetchedResultsController: NSFetchedResultsController?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchRequest = NSFetchRequest(entityName: "SaveGame")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "scoreWinner", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        try? fetchedResultsController?.performFetch()
        
        print(fetchedResultsController?.fetchedObjects?.count)
        
        scoresTableView.dataSource = self
        
        //Setting the Design of the Layout
        view.backgroundColor = UIColor.blackColor()
        titleOfHighScores.textColor = UIColor.whiteColor()
        scoresTableView.backgroundColor = UIColor.blackColor()
        
        
        //Setting the Outlets initial values
        titleOfHighScores.text = "High Scores"
        titleOfHighScores.textAlignment = .Center
        titleOfHighScores.font = titleOfHighScores.font.fontWithSize(20)
        
    }
    
    @IBAction func takeMeHomeButton(sender: AnyObject) {
        performSegueWithIdentifier("MainMenu", sender: self)
    }
    

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.fetchedObjects?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        if let game = fetchedResultsController?.objectAtIndexPath(indexPath) as? SaveGame {
            cell.textLabel?.text = "Winner: \(game.winner!)  -  \(game.scoreWinner!) | Loser: \(game.loser!)  -  \(game.scoreLoser!)"
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor.blackColor()
        }
        
        return cell
    }
    
}
