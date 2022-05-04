//
//  CellViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/10/22.
//

import UIKit

class CellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapDelete(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("cellDelete"), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func tapEdit(_ sender: Any) {
        guard let TaskVC = storyboard?.instantiateViewController(withIdentifier: "TaskViewController") as? TaskViewController else { return }
        present(TaskVC, animated: true)
    }
    
    @IBAction func tapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
