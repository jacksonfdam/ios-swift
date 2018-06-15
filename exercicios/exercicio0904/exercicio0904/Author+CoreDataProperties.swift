//
//  Author+CoreDataProperties.swift
//  exercicio0904
//
//  Created by Jackson on 15/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit
import Foundation
import CoreData

extension Author {
    
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author");
    }
    
    @NSManaged public var name: String
    @NSManaged public var email: String
    @NSManaged public var commits: NSSet
    
}

// MARK: Generated accessors for commits
extension Author {
    
    @objc(addCommitsObject:)
    @NSManaged public func addToCommits(_ value: Commit)
    
    @objc(removeCommitsObject:)
    @NSManaged public func removeFromCommits(_ value: Commit)
    
    @objc(addCommits:)
    @NSManaged public func addToCommits(_ values: NSSet)
    
    @objc(removeCommits:)
    @NSManaged public func removeFromCommits(_ values: NSSet)
    
}
