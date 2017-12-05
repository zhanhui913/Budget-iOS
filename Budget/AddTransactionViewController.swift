//
//  AddTransactionViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-04.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClick(_ sender: UIBarButtonItem){
        //save something
        self.dismiss(animated: true, completion: nil)
    }

}
