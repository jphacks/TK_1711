//
//  DeliveryListViewController.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class DeliveryListViewController: UIViewController {

    @IBOutlet private weak var deliveryListTableView: UITableView!

    private var deliveries: [Delivery] = [] {
        didSet {
            deliveryListTableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDeliveries()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(getDeliveries), for: .valueChanged)
        deliveryListTableView.addSubview(refreshControl)
    }

    @objc func getDeliveries() {
        GetDeliveriesService().request(URLSession.shared) { result in
            switch result {
            case .success(let res):
                DispatchQueue.main.async {
                    self.deliveries = res.deliveries
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let c as DeliveryDetailViewController:
            guard let indexPath = deliveryListTableView.indexPathForSelectedRow else { break }
            let delivery = deliveries[indexPath.row]
            c.delivery = delivery
        default:
            break
        }
    }

}

extension DeliveryListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = deliveryListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = deliveries[indexPath.row].name
        return cell
    }

}
