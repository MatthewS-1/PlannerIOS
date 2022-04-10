//
//  ViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/7/22.
//

import UIKit

let UIButtonCornerRadius = CGFloat(20)

class ViewController: UIViewController {
    @IBOutlet weak var plannerButton: UIButton!
    @IBOutlet weak var analyticsButton: UIButton!
    
    override func viewDidLoad() {
        plannerButton.layer.cornerRadius = UIButtonCornerRadius
        analyticsButton.layer.cornerRadius = UIButtonCornerRadius
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapPlanner(_ sender: Any) {
        guard let PlannerVC = storyboard?.instantiateViewController(withIdentifier: "PlannerViewController") as? PlannerViewController else { return }
        PlannerVC.modalPresentationStyle = .fullScreen
        present(PlannerVC, animated: true)
    }
    @IBAction func tapAnalytics(_ sender: Any) {
    
    }
    

}

