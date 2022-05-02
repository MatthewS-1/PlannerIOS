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
    addSwipeLeft(view: view, target: target, swipeLeft: swipeLeft)
    addSwipeRight(view: view, target: target, swipeRight: swipeRight)
}

func addSwipeLeft(view: UIView, target: Any?, swipeLeft: Selector){
    let leftSwipe = UISwipeGestureRecognizer(target: target, action: swipeLeft)
    leftSwipe.direction = .left
    view.addGestureRecognizer(leftSwipe)
}
func addSwipeRight(view: UIView, target: Any?, swipeRight: Selector){
    let rightSwipe = UISwipeGestureRecognizer(target: target, action: swipeRight)
    rightSwipe.direction = .right
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
