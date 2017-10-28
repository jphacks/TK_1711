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
    var dates: [Date] {
        guard let delivery = delivery else { return [] }
        let maxDays = 5
        var dates: [Date] = []
        for index in 0..<maxDays {
            dates.append(delivery.date.addingTimeInterval(TimeInterval(60 * 60 * 24 * index)))
        }
        return dates
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var datePickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = delivery?.name
        statusLabel.text = delivery?.status
        guard let date = delivery?.date, let duration = delivery?.duration else { return }
        dateLabel.text = date.toString() + " " + duration
    }

}

extension DeliveryDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return dates.count
        case 1: return allDeliveryDurations().count
        default: return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return dates[row].toShortString()
        case 1: return allDeliveryDurations()[row]
        default: return nil
        }
    }

}
