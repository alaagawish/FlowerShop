//
//  EmployeesViewModel.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

class EmployeesViewModel {
    
    private let getEmployessUseCase: GetEmployessUseCase
    
    var Employees: [Employees] = []
    var onReload: (() -> Void)?
    
    init(getEmployessUseCase: GetEmployessUseCase) {
        self.getEmployessUseCase = getEmployessUseCase
    }
    
    func loadEmployees() {
        getEmployessUseCase.execute { [weak self] employees in
            self?.Employees = employees
            DispatchQueue.main.async {
                self?.onReload?()
            }
        }
    }
}
