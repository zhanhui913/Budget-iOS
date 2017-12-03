//
//  CategoryViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-26.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var transactionTableView: UITableView!
    
    // Data model: These strings will be the data for the table view cells
    let expense: [String] = ["Breakfast", "Lunch", "Shopping", "Dinner", "Movies"]
    let expenseCost: [String] = ["$55.00","$9066.44","$543.94","$1.33","$9.13"]
    
    let income: [String] = ["Salary","Salary","Other","Lottery","Salary","Investment","Other","Found"]
    let incomeCost: [String] = ["$9876.09","$7765.66","$1.32","$11023.33","$876.09","$16.09","$1122.00","$10"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "TransactionTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable();
        setupData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTable(){
        // This view controller itself will provide the delegate methods and row data for the table view.
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }

    func setupData(){
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //section header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 1){
            return "Expense"
        }else{
            return "Income"
        }
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 1){
            return expense.count
        }else{
            return income.count
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = transactionTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? TransactionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
        }
        
        // Fetches the appropriate expense for the data source layout.

        if(indexPath.section == 1){
            // Fetches the appropriate expense for the data source layout.
            cell.transactionName.text = self.expense[indexPath.row]
            cell.transactionCost.text = self.expenseCost[indexPath.row]
            
            cell.progress.progress = 0.25
            cell.progress.barBorderColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
            cell.progress.barFillColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
            cell.progress.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
            
        }else{
            // Fetches the appropriate expense for the data source layout.
            cell.transactionName.text = self.income[indexPath.row]
            cell.transactionCost.text = self.incomeCost[indexPath.row]
            
            cell.progress.progress = 0.5
            cell.progress.barBorderColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
            cell.progress.barFillColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
            cell.progress.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
        }
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}


