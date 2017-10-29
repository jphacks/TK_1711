//
//  DeliveryListViewController.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class DeliveryListViewController: UIViewController {

    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var deliveryListTableView: UITableView!

    private var deliveries: [Delivery] = [] {
        didSet {
            deliveryListTableView.reloadData()
        }
    }
    private var balance: Int = 0 {
        didSet {
            balanceLabel.text = "所有金 " + String(round(Double(balance / 30000) * 100) / 100)  + "ether"
        }
    }
    var refreshControl: UIRefreshControl?

    @IBAction func logoutButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDeliveries()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(getDeliveries), for: .valueChanged)
        deliveryListTableView.addSubview(refreshControl!)
        deliveryListTableView.register(UINib(nibName: "DeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "SF UI Text", size: 20)!,
            .foregroundColor: UIColor.white
        ]
    }

    @objc func getDeliveries() {
        let userId = UserDefaults.standard.integer(forKey: "userId")
        GetDeliveriesService(id: userId).request(URLSession.shared) { result in
            switch result {
            case .success(let res):
                DispatchQueue.main.async {
                    self.deliveries = res.deliveries.sorted(by: { (d1, d2) -> Bool in
                        return d1.status != .delivered
                    })
                    self.balance = res.balance
                    self.refreshControl?.endRefreshing()
                }
            case .failure(let err):
                print(err)
                DispatchQueue.main.async {
                    self.refreshControl?.endRefreshing()
                }
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
        let cell = deliveryListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryTableViewCell
        let delivery = deliveries[indexPath.row]
        cell.configure(delivery)
        return cell
    }

}

extension DeliveryListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

}
