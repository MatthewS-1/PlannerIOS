//
//  Planner+CoreDataProperties.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/11/22.
//
//

import Foundation
import CoreData


extension Planner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planner> {
        return NSFetchRequest<Planner>(entityName: "Planner")
    }

    @NSManaged public var name: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension Planner {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension Planner : Identifiable {

}
