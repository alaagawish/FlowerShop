//
//  ClientsViewModel.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

class ClientsViewModel {
    
    private let getClientsUseCase: GetClientsUseCase
    
    var clients: [Clients] = []
    var onReload: (() -> Void)?
    
    init(getClientsUseCase: GetClientsUseCase) {
        self.getClientsUseCase = getClientsUseCase
    }
    
    func loadClients() {
        getClientsUseCase.execute { [weak self] clients in
            self?.clients = clients
            DispatchQueue.main.async {
                self?.onReload?()
            }
        }
    }
}
