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
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "TransactionTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable();
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
/*        let cell = self.transactionTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TransactionTableViewCell
*/
        guard let cell = transactionTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? TransactionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        cell.transactionName.text = self.animals[indexPath.row]
        

        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}


