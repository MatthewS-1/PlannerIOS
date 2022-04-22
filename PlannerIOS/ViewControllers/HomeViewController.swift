//
//  ViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/7/22.
//
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var plannerButton: UIButton!
    @IBOutlet weak var analyticsButton: UIButton!
    
    override func viewDidLoad() {
        plannerButton.layer.cornerRadius = UIButtonCornerRadius
        analyticsButton.layer.cornerRadius = UIButtonCornerRadius
        
        addSwipeGestures(view: view, target: self, swipeLeft: #selector(tapPlanner(_:)), swipeRight: #selector(tapAnalytics(_:)))

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapPlanner(_ sender: Any) {
        presentPlanner(self)
    }
    @IBAction func tapAnalytics(_ sender: Any) {
        presentAnalytics(self)
    }
}

