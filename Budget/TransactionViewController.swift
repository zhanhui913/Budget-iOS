//
//  TransactionViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-03.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate*/{

    @IBOutlet weak var transactionTableView: UITableView!
    
    let expense: [String] = ["Breakfast with Friends at who knows what the restaurant is called", "Lunch", "Shopping", "Dinner", "Movies", "Clothes", "Lunch","Dim sum"]
    let expenseCost: [String] = ["$55.00","$9066.44","$543.94","$1.33","$9.13", "$98.33","$58.49","$112.33"]

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "TransactionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable();
        //setupData();
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
}

extension TransactionViewController : UITableViewDataSource {
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = transactionTableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier, for: indexPath) as? TransactionItemViewCell else {
            fatalError("The dequeued cell is not an instance of TransactionViewCell.")
        }
        
        // Fetches the appropriate expense for the data source layout.
        cell.transactionName.text = self.expense[indexPath.row]
        cell.transactionCost.text = self.expenseCost[indexPath.row]
        
        return cell
    }
}

extension TransactionViewController : UITableViewDelegate {
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expense.count
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
