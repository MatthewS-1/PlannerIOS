//
//  TaskViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "h:mm a MM/dd/yyyy"
        format.amSymbol = "AM"
        format.pmSymbol = "PM"
    }

    @IBAction func confirmButton(_ sender: Any) {
        let date: String = format.string(from: datePicker.date)
        let taskName: String = field.text!
        NotificationCenter.default.post(name: Notification.Name("task"), object: [taskName, date])
        dismiss(animated: true)
    }
}
