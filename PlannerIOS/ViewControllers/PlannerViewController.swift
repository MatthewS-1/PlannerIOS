//
//  PlannerViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit

class PlannerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var table: UITableView!
    var tasks = [Task]()
    // cell anticipating change will store the index of the selected cell or will store nil if nothing is to be changed
    var cellAnticipatingChange: Int?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self

        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetTask(_:)), name: Notification.Name("task"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetReset(_:)), name: Notification.Name("resetPlanner"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetCellDeletion(_:)), name: Notification.Name("cellDelete"), object: nil)
        
        retreivePlanner()
        
        addSwipeGestures(view: view, target: self, swipeLeft: #selector(tapAddTask(_:)), swipeRight: #selector(returnHome))
    }
    
    func retreivePlanner(){
        do {
            let request = Task.fetchRequest()
            // If a task entity is not mapped to a planner, that means it isn't finished yet, and should be displayed
            let pred = NSPredicate(format: "planner == nil")
            request.predicate = pred
            
            self.tasks = try context.fetch(request)
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        catch {
            
        }
    }
    // didGetTask is called whenever the TaskViewController is used by the user to create or edit a task
    @objc func didGetTask(_ notification: Notification) {
        let input = notification.object as! Array<String>?
        let newName = input![0]
        let newTime = input![1]
        // If we weren't anticipating a cell to change, that means we should create a new cell with the given name and time
        if cellAnticipatingChange == nil {
            let newTask = Task(context: context)
            newTask.name = newName
            newTask.time = newTime
            tasks.append(newTask)
        } else {
            tasks[cellAnticipatingChange!].name = newName
            tasks[cellAnticipatingChange!].time = newTime
        }
        do {
            try self.context.save()
        } catch {
            print("error attempting to save tasks")
        }
        table.reloadData()
    }
    
    @objc func didGetReset(_ notification: Notification) {
        let planner = Planner(context: context)
        let plannerName = notification.object as! String
        // If the user didn't enter a planner name, just name the planner after what iteration it is.
        if plannerName == "Enter Planner Name" {
            do {
                let plannerCount = try context.count(for: Planner.fetchRequest())
                planner.name = "Planner \(plannerCount)"
            } catch {
                print("error attempting to count number of planners")
            }
        } else {
            planner.name = plannerName
        }
        // once each task in the planner is assigned to a planner entity, then these tasks will no longer appear in retrievePlanner. This would clear the planner.
        for task in tasks{
            task.planner = planner
        }
        retreivePlanner()
        do {
            try self.context.save()
        } catch {
            print("error attempting to reset planner")
        }
        table.reloadData()
        
    }
    
    @objc func didGetCellDeletion(_ notification: Notification) {
        context.delete(tasks[cellAnticipatingChange!])
        tasks.remove(at: cellAnticipatingChange!)
        cellAnticipatingChange = nil
        do {
            try self.context.save()
        } catch {
            print("error attempting to delete certain task")
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.titleText.text = tasks[indexPath.row].name
        cell.subtext.text = tasks[indexPath.row].time
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellAnticipatingChange = indexPath.row
        guard let CellVC = storyboard?.instantiateViewController(withIdentifier: "CellViewController") as? CellViewController else { return }
        present(CellVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func tapAddTask(_ sender: Any) {
        cellAnticipatingChange = nil
        guard let TaskVC = storyboard?.instantiateViewController(withIdentifier: "TaskViewController") as? TaskViewController else { return }
        present(TaskVC, animated: true)
    }
    
    @objc func returnHome(){
        presentHome(self)
    }
}
