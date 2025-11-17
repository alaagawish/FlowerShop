//
//  FlowersViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class FlowersViewController: BaseViewController {
    static let identifier = "FlowersViewController"
    @IBOutlet private weak var totalPrice: UILabel!
    @IBOutlet private weak var flowersTableView: UITableView!
    let flowersViewModel = FlowersViewModel(
        getFlowersUseCase: DIContainer.shared.getFlowersUseCase
    )
    private var flowers: [Flowers] = []
    private var selectedFlowers: [Flowers] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func registerCells() {
        flowersTableView.register(UINib(nibName: FlowerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FlowerTableViewCell.identifier)
    }
    override func bindViewModel() {
        flowersViewModel.onReload = { [weak self] in
            self?.flowers = self?.flowersViewModel.flowers ?? []
            self?.selectedFlowers = self?.flowers ?? []
            self?.resetAllStock()
            self?.flowersTableView.reloadData()
        }
        
    }
    override func initValues() {
        
        flowersViewModel.loadFlowers()
    }
     func resetAllStock() {
        selectedFlowers = selectedFlowers.map {
            Flowers(name: $0.name, stock: 0, price: $0.price, imageUrl: $0.imageUrl)
        }
    }
}

extension FlowersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlowerTableViewCell.identifier, for: indexPath) as! FlowerTableViewCell
        
        cell.addNew(flower: flowers[indexPath.row])
        cell.selectFlowerDelegate = self
        cell.index = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FlowersViewController: SelectFlowerDelegate {
    func changeFlowerStockSelected(amount: Int, index: Int) {
        selectedFlowers[index].stock = amount
        let total = self.selectedFlowers.reduce(0.0) { partial, item in
            let stock = item.stock ?? 0
            let price = item.price ?? 0.0
            return partial + (Double(stock) * price)
        }
        totalPrice.text = String(total)
    }
}
