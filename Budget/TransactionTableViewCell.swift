//
//  TransactionTableViewCell.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-26.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit
import GTProgressBar

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionName : UILabel!
    @IBOutlet weak var transactionCost : UILabel!
    @IBOutlet weak var progress : GTProgressBar!
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
