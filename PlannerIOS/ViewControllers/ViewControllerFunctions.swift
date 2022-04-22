//
//  ViewControllerFunctions.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/22/22.
//

import Foundation
import UIKit

let UIButtonCornerRadius = CGFloat(20)

func addSwipeGestures(view: UIView, target: Any?, swipeLeft: Selector, swipeRight: Selector){
    let leftSwipe = UISwipeGestureRecognizer(target: target, action: swipeLeft)
    let rightSwipe = UISwipeGestureRecognizer(target: target, action: swipeRight)
    
    leftSwipe.direction = .left
    rightSwipe.direction = .right
    
    view.addGestureRecognizer(leftSwipe)
    view.addGestureRecognizer(rightSwipe)
}

func presentPlanner(_ view: UIViewController){
    guard let PlannerVC = view.storyboard?.instantiateViewController(withIdentifier: "PlannerViewController") as? PlannerViewController else { return }
    PlannerVC.modalTransitionStyle = .crossDissolve
    PlannerVC.modalPresentationStyle = .fullScreen
    view.present(PlannerVC, animated: true)
}

func presentHome(_ view: UIViewController){
    guard let HomeVC = view.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
    HomeVC.modalTransitionStyle = .crossDissolve
    HomeVC.modalPresentationStyle = .fullScreen
    view.present(HomeVC, animated: true)
}

func presentAnalytics(_ view: UIViewController){
    guard let AnalyticsVC = view.storyboard?.instantiateViewController(withIdentifier: "AnalyticsViewController") as? AnalyticsViewController else { return }
    AnalyticsVC.modalTransitionStyle = .crossDissolve
    AnalyticsVC.modalPresentationStyle = .fullScreen
    view.present(AnalyticsVC, animated: true)
}
