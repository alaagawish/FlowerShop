//
//  GetEmployessUseCase.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class GetEmployessUseCase {
    private let repository: ShopRepo
    
    init(repository: ShopRepo) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Employees]) -> Void) {
        repository.fetchEmployees(completion: completion)
    }
}
