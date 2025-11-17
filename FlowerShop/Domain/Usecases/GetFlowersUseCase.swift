//
//  GetFlowersUseCase.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class GetFlowersUseCase {
    private let repository: ShopRepo
    
    init(repository: ShopRepo) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Flowers]) -> Void) {
        repository.fetchFlowers(completion: completion)
    }
}
