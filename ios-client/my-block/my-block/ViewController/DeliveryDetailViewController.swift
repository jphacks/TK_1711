//
//  DeliveryDetailViewController.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class DeliveryDetailViewController: UIViewController {

    var delivery: Delivery?

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = delivery?.name
        statusLabel.text = delivery?.status
        guard let date = delivery?.date, let duration = delivery?.duration else { return }
        dateLabel.text = date + " " + duration
    }

}
