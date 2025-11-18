//
//  UserTableViewCell.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var phone: UILabel!
    @IBOutlet private weak var addressOrSalary: UILabel!
    static let identifier = "UserTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addNew(customer: Clients) {
        self.name.text = customer.name
        self.phone.text = "Phone: \(customer.phone ?? "")"
        self.addressOrSalary.text = "Address: \(customer.address ?? "")"
    }
    
    func addNew(employee: Employees) {
        self.name.text = employee.name
        self.phone.text = "Phone: \(employee.phone ?? "")"
        self.addressOrSalary.text = "Salary: $\(employee.salary ?? 0)"
    }
    
}
