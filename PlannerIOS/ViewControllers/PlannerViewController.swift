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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("task"), object: nil)
    }
    
    @objc func didGetNotification(_ notification: Notification) {
        let input = notification.object as! Array<String>?
        let taskName = input![0]
        let taskDate = input![1]
        tasks.append(Task(name: taskName, time: taskDate))
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
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func tapNewPlanner(_ sender: Any) {
        tasks = [Task]()
        table.reloadData()
    }
}
