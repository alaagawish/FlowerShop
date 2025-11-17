//
//  GetClientsUseCase.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class GetClientsUseCase {
    private let repository: ShopRepo
    
    init(repository: ShopRepo) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Clients]) -> Void) {
        repository.fetchClients(completion: completion)
    }
}
