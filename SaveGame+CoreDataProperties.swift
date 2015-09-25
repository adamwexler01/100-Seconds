//
//  SaveGame+CoreDataProperties.swift
//  thehunt
//
//  Created by Adam Wexler on 9/19/15.
//  Copyright © 2015 apwex.com. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SaveGame {

    @NSManaged var winner: String?
    @NSManaged var loser: String?
    @NSManaged var scoreWinner: NSNumber?
    @NSManaged var scoreLoser: NSNumber?

}
