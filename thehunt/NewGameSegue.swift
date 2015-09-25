//
//  NewGameSegue.swift
//  thehunt
//
//  Created by Adam Wexler on 9/15/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//

import UIKit

class NewGameSegue: UIStoryboardSegue {

    override func perform() {
        let sourceViewController: UIViewController = self.sourceViewController as UIViewController
        let destinationViewController: UIViewController = self.destinationViewController as UIViewController
        
        sourceViewController.view.addSubview(destinationViewController.view)
        
        destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            
            }, completion: { (finished) -> Void in
                
                destinationViewController.view.removeFromSuperview()
                sourceViewController.presentViewController(destinationViewController, animated: false, completion: nil)
                
        })
        
        
        
    }
    
    
}
