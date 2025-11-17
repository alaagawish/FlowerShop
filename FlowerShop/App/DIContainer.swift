//
//  DIContainer.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    lazy var apiClient = APIClient()
    
    lazy var shopRepository: ShopRepo = {
        ShopRepoImpl(apiClient: apiClient)
    }()
    
    lazy var getFlowersUseCase: GetFlowersUseCase = {
        GetFlowersUseCase(repository: shopRepository)
    }()
    lazy var getEmployeesUseCase: GetEmployessUseCase = {
        GetEmployessUseCase(repository: shopRepository)
    }()
    lazy var getClientsUseCase: GetClientsUseCase = {
        GetClientsUseCase(repository: shopRepository)
    }()
}
