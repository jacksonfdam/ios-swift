//
//  Commit+CoreDataProperties.swift
//  exercicio0904
//
//  Created by Jackson on 15/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import Foundation
import CoreData

extension Commit {
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit");
    }
    
    @NSManaged public var date: Date
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String
    @NSManaged public var author: Author
}
