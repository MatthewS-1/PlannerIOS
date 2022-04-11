//
//  PlannerViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit

struct Task {
    var name : String
    var time : String
    
}

class PlannerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var plannerTitle: UILabel!
    @IBOutlet weak var table: UITableView!
    var tasks = [Task]()
    var cellAnticipatingChange: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(didGetTask(_:)), name: Notification.Name("task"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetReset(_:)), name: Notification.Name("resetPlanner"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetCellDeletion(_:)), name: Notification.Name("cellDelete"), object: nil)
    }
    
    @objc func didGetTask(_ notification: Notification) {
        let input = notification.object as! Array<String>?
        let taskName = input![0]
        let taskDate = input![1]
        let newTask = Task(name: taskName, time: taskDate)
        if cellAnticipatingChange == nil {
            tasks.append(newTask)
        } else {
            tasks[cellAnticipatingChange!] = newTask
        }
        table.reloadData()
    }
    
    @objc func didGetReset(_ notification: Notification) {
        tasks = [Task]()
        table.reloadData()
    }
    
    @objc func didGetCellDeletion(_ notification: Notification) {
        tasks.remove(at: cellAnticipatingChange!)
        cellAnticipatingChange = nil
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
        guard let CellVC = storyboard?.instantiateViewController(withIdentifier: "CellViewController") as? CellViewController else { return }
        present(CellVC, animated: true)
        cellAnticipatingChange = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func tapAddTask(_ sender: Any) {
        cellAnticipatingChange = nil
    }
}
