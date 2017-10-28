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

extension DeliveryListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DeliveryDetail") as! DeliveryDetailViewController
        vc.delivery = deliveries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
