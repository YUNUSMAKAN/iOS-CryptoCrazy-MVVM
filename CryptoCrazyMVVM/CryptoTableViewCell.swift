//
//  CryptoTableViewCell.swift
//  CryptoCrazyMVVM
//
//  Created by MAKAN on 30.08.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
