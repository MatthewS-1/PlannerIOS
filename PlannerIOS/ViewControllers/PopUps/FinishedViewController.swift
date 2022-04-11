//
//  FinishedViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/10/22.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var newPlannerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapNewPlanner(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("resetPlanner"), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func tapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
}
