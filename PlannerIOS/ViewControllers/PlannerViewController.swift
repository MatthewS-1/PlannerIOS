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
    
    @IBOutlet weak var plannerTitle: UILabel!
    @IBOutlet weak var plannerStepper: UIStepper!
    @IBOutlet weak var table: UITableView!
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomTableViewCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        
        return cell
    }
}
