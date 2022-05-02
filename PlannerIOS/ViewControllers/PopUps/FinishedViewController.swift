//
//  FinishedViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/10/22.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var newPlannerButton: UIButton!
    @IBOutlet weak var plannerName: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapNewPlanner(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("resetPlanner"), object: plannerName.text)
        dismiss(animated: true)
    }
    
    @IBAction func tapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
}
