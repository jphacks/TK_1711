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
    lazy var shownDate = delivery?.date
    lazy var shownRewards = rewards(for: shownDate?.weekday() ?? 1)

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var datePickerView: UIPickerView!

    @IBAction private func changeDate() {
        guard let id = delivery?.id else { return }
        guard let date = shownDate else { return }
        let index = datePickerView.selectedRow(inComponent: 1)
        let reward = shownRewards[index]
        UpdateDeliveryDateService(deliveryId: id, newDate: date.toQueryString(), newDuration: index).request(URLSession.shared) { result in
            switch result {
            case .success(let res):
                DispatchQueue.main.async {
                    self.delivery = res
                    self.update()
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        addReloadButton()
    }

    private func addReloadButton() {
        let item = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reload))
        navigationItem.setRightBarButton(item, animated: false)
    }

    @objc func reload() {
        guard let id = delivery?.id else { return }
        GetDeliveryService(id: id).request(URLSession.shared) { result in
            switch result {
            case .success(let res):
                DispatchQueue.main.async {
                    self.delivery = res
                    self.update()
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    func update() {
        guard let delivery = delivery else { return }
        nameLabel.text = delivery.name
        statusLabel.text = delivery.statusStr
        dateLabel.text = delivery.date.toString() + delivery.date.weekdayStr() + " " + delivery.durationStr
        switch delivery.duration {
        case .morning: datePickerView.selectRow(0, inComponent: 1, animated: false)
        case .daytime: datePickerView.selectRow(1, inComponent: 1, animated: false)
        case .evening: datePickerView.selectRow(2, inComponent: 1, animated: false)
        case .night: datePickerView.selectRow(3, inComponent: 1, animated: false)
        }
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
        case 0: return dates[row].toShortString() + dates[row].weekdayStr()
        case 1: return allDeliveryDurations()[row] + " +" + String(shownRewards[row]) + "円"
        default: return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard component == 0 else { return }
        shownDate = dates[row]
        shownRewards = rewards(for: dates[row].weekday())
        pickerView.reloadComponent(1)
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 { return 110 }
        return pickerView.frame.width - 110
    }

}
