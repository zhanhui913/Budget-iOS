//
//  FirstViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-12.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    var meals = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadSampleMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
        }
    

        // Fetches the appropriate meal for the data source layout.
        cell.transactionName.text = meals[indexPath.row]
        
        return cell
    }
    
    private func loadSampleMeals() {
        let meal1 = "meal 1"
        let meal2 = "meal 2"
        let meal3 = "meal 3"
        
        meals += [meal1, meal2, meal3]
    }
}

