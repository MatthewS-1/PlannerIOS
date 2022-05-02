//
//  AnalyticsViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit
import Charts

class AnalyticsViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var combinedChart: CombinedChartView!
    var planners = [Planner]()
    let chartPadding = CGFloat(30)
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        addSwipeLeft(view: view, target: self, swipeLeft: #selector(returnHome))
        combinedChart.delegate = self
        
        retreivePlanners()
        trimPlanners()
    }
    
    func retreivePlanners(){
        do {
            let request = Planner.fetchRequest()
            self.planners = try context.fetch(request)
        }
        catch {
            
        }
    }
    
    @objc func returnHome(){
        presentHome(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        combinedChart.noDataText = "Data is not available until a planner is finished."
        combinedChart.xAxis.drawGridLinesEnabled = false
        combinedChart.xAxis.drawLabelsEnabled = false
        combinedChart.xAxis.drawAxisLineEnabled = false
        combinedChart.rightAxis.enabled = false
        combinedChart.drawBordersEnabled = false
        combinedChart.legend.enabled = false
        
        var chartDataEntries = [ChartDataEntry]()
        var barChartDataEntries = [BarChartDataEntry]()
        
        for i in 0..<planners.count {
            chartDataEntries.append(ChartDataEntry(x: Double(i+1), y: Double(planners[i].tasks?.count ?? 0)))
            barChartDataEntries.append(BarChartDataEntry(x: Double(i+1), y: Double(planners[i].tasks?.count ?? 0)))
        }
        
        let lineChartSet = LineChartDataSet(entries: chartDataEntries, label: "")
        lineChartSet.colors = ChartColorTemplates.pastel()
        lineChartSet.drawCirclesEnabled = false
        lineChartSet.drawValuesEnabled = false
        let barChartSet = BarChartDataSet(entries: barChartDataEntries, label: "")
        barChartSet.colors = ChartColorTemplates.pastel()
        barChartSet.drawValuesEnabled = false
        
        let data = CombinedChartData()
        data.barData = BarChartData(dataSet: barChartSet)
        data.lineData = LineChartData(dataSet: lineChartSet)
        
        var names = [String]()
        for planner in planners {
            names.append(planner.name ?? "")
        }
        print(names)
        print(names.count)
        combinedChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: names)
        combinedChart.xAxis.granularity = 1
        combinedChart.data = data
    }
    
    func trimPlanners(length: Int = 15){
        for _ in 0..<planners.count-length{
            context.delete(planners[0])
            planners.remove(at: 0)
        }
    }
}
