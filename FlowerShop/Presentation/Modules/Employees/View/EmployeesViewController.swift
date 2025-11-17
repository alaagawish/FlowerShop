//
//  EmployeesViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class EmployeesViewController: BaseViewController {
    static let identifier = "EmployeesViewController"
    let employeesViewModel = EmployeesViewModel(
            getEmployessUseCase: DIContainer.shared.getEmployeesUseCase
        )
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func bindViewModel() {
        employeesViewModel.onReload = { [weak self] in
        }
        
    }
    override func initValues() {
        
        
        employeesViewModel.loadEmployees()
    }
    
}
