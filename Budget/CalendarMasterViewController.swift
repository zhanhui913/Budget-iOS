//
//  CalendarMasterViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-03.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class CalendarMasterViewController: UIViewController {

    let dateFormatter = DateFormatter()
    let monthFormatter = DateFormatter()

    fileprivate var transactionViewController: TransactionViewController?
    fileprivate var infoPanelViewController : InfoPanelViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dateFormatter.dateFormat = "MMM dd"
        self.monthFormatter.dateFormat = "MMM yyyy"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destination = segue.destination
        if let calendarController = destination as? CalendarViewController {
            calendarController.delegate = self
        }
        
        if let infoController = destination as? InfoPanelViewController {
            infoPanelViewController = infoController
        }
        
        if let transactionController = destination as? TransactionViewController {
            transactionViewController = transactionController
        }
    }
}

extension CalendarMasterViewController : CalendarDelegate {
    func dateSelected(_ date: Date) {
        print(date)
        
        infoPanelViewController?.name.text = self.dateFormatter.string(from: date)
        infoPanelViewController?.cost.text = "$9.13"
    }
    
    func currentVisibleMonth(_ date: Date) {
        self.title = self.monthFormatter.string(from: date)
    }
}
