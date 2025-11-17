//
//  ShopRepoImpl.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class ShopRepoImpl: ShopRepo {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchFlowers(completion: @escaping ([Flowers]) -> Void) {
        
        apiClient.loadLocalJSON() { result in
            switch result {
            case .success(let data):
                let dtos = (try? JSONDecoder().decode(ShopResponse.self, from: data))
                let flowers = dtos.map { $0.flowersToDomain() }
                completion(flowers ?? [])
                
            case .failure:
                completion([])
            }
        }
    }
    func fetchClients(completion: @escaping ([Clients]) -> Void) {
        
        apiClient.loadLocalJSON() { result in
            switch result {
            case .success(let data):
                let dtos = (try? JSONDecoder().decode(ShopResponse.self, from: data))
                let clients = dtos.map { $0.clientsToDomain() }
                completion(clients ?? [])
                
            case .failure:
                completion([])
            }
        }
    }
    func fetchEmployees(completion: @escaping ([Employees]) -> Void) {
        
        apiClient.loadLocalJSON() { result in
            switch result {
            case .success(let data):
                let dtos = (try? JSONDecoder().decode(ShopResponse.self, from: data))
                let emplyees = dtos.map { $0.employeesToDomain()  }
                completion(emplyees ?? [])
                
            case .failure:
                completion([])
            }
        }
    }
}
