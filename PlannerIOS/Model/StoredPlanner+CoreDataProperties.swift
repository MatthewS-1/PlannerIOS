//
//  StoredPlanner+CoreDataProperties.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/11/22.
//
//

import Foundation
import CoreData

public class Task: NSManagedObject {
    init(name: String, time: String){
        super.init(entity: self, insertInto: nil)
        self.name = name
        self.time = time
    }
    
    @NSManaged var name: String
    @NSManaged var time: String
}

extension StoredPlanner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredPlanner> {
        return NSFetchRequest<StoredPlanner>(entityName: "StoredPlanner")
    }

    @NSManaged public var name: String?
    @NSManaged public var planner: [Task]?

}

extension StoredPlanner : Identifiable {

}
