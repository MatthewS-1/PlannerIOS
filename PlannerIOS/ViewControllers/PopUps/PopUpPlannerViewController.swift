//
//  PopUpPlannerViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 5/3/22.
//

import UIKit

class PopUpPlannerViewController: PlannerViewController {

    @IBOutlet weak var plannerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetPlanner(_:)), name: Notification.Name("sendPlanner"), object: nil)
    }
    
    @objc func didGetPlanner(_ notification: Notification) {
        let planner = notification.object as! Planner?
        let plannerTasks = planner?.tasks?.array as! [Task]
        self.plannerName.text = planner?.name
        self.tasks = plannerTasks
        table.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
