//
//  AnalyticsViewController.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/9/22.
//

import UIKit
import Charts
import CoreData

class AnalyticsViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var combinedChart: CombinedChartView!
    var planners = [Planner]()
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
            // retreive and sort the planners so that the chart is also sorted
            let request = Planner.fetchRequest() as NSFetchRequest<Planner>
            self.planners = try context.fetch(request)
            self.planners.sort{
                $0.tasks?.count ?? 0 < $1.tasks?.count ?? 0
            }
        }
        catch {
            
        }
    }
    // To avoid the chart from being too large, trim the planners array.
    func trimPlanners(length: Int = 15){
        for _ in 0..<planners.count-length{
            context.delete(planners[0])
            planners.remove(at: 0)
        }
    }
    
    @objc func returnHome(){
        presentHome(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // disabling to make the chart cleaner
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
        
        combinedChart.data = data
    }
    // if a bar chart is selected, load the preview popup and send the selected planner to that popup.
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let PopUpPlannerVC = storyboard?.instantiateViewController(withIdentifier: "PopUpPlannerViewController") as? PopUpPlannerViewController else { return }
        present(PopUpPlannerVC, animated: true)
        let i = Int(entry.x-1)
        NotificationCenter.default.post(name: Notification.Name("sendPlanner"), object: self.planners[i])
    }
}
