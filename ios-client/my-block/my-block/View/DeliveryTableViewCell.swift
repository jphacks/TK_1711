//
//  DeliveryTableViewCell.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var coverView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ delivery: Delivery) {
        nameLabel.text = delivery.name
        dateLabel.text = "配達予定日 " + delivery.date.toString() + delivery.date.weekdayStr()
        photoImageView.load(from: delivery.photoUrl)
        if delivery.status == .delivered {
            coverView.isHidden = false
        } else {
            coverView.isHidden = true
        }
    }

}
