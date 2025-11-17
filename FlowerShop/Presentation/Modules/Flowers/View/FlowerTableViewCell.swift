//
//  FlowerTableViewCell.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit
import Kingfisher

class FlowerTableViewCell: UITableViewCell {
    static let identifier = "FlowerTableViewCell"
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var selectedAmount: UILabel!
    @IBOutlet private weak var flowerStock: UILabel!
    @IBOutlet private weak var flowerPrice: UILabel!
    @IBOutlet private weak var flowerNmae: UILabel!
    @IBOutlet private weak var flowerImage: UIImageView!
    
    var selectFlowerDelegate: SelectFlowerDelegate?
    var index: Int?
    var amount: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addNew(flower: Flowers) {
        self.amount = flower.stock ?? 0
        self.flowerStock.text = "Stock: \(flower.stock ?? 0)"
        self.flowerPrice.text = "Price: \(flower.price ?? 0)$"
        self.flowerNmae.text = flower.name ?? "ERROR"
        self.flowerImage?.kf.setImage(with: URL(string: flower.imageUrl ?? "")!)
        checkAmount()
    }
    @IBAction func addFlower(_ sender: Any) {
        amount -= 1
        self.selectedAmount.text = "\((Int(selectedAmount.text ?? "") ?? 0) + 1)"
        self.selectFlowerDelegate?.changeFlowerStockSelected(amount: Int(selectedAmount.text ?? "") ?? 0, index: index ?? 0)
        checkAmount()
        
    }
    @IBAction func removeFlower(_ sender: Any) {
        amount += 1
        self.selectedAmount.text = "\((Int(selectedAmount.text ?? "") ?? 0) - 1)"
        self.selectFlowerDelegate?.changeFlowerStockSelected(amount: Int(selectedAmount.text ?? "") ?? 0, index: index ?? 0)
        checkAmount()
    }
    
    private func checkAmount() {
        if amount == 0  && Int(selectedAmount.text ?? "") ?? 0 > 0 {
            addButton.isEnabled = false
            minusButton.isEnabled = true
        } else if Int(selectedAmount.text ?? "") ?? 0 == 0 && amount > 0 {
            minusButton.isEnabled = false
            addButton.isEnabled = true
        } else if amount == 0 && (Int(selectedAmount.text ?? "") ?? 0) == 0 {
            addButton.isEnabled = false
            minusButton.isEnabled = false
        }
    }
}

protocol SelectFlowerDelegate {
    func changeFlowerStockSelected(amount: Int, index: Int)
}
