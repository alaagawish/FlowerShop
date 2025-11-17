//
//  ClientsViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class ClientsViewController: BaseViewController {
    static let identifier = "ClientsViewController"
    
    let clientsViewModel = ClientsViewModel(
            getClientsUseCase: DIContainer.shared.getClientsUseCase
        )
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func bindViewModel() {
        clientsViewModel.onReload = { [weak self] in
        }
        
    }
    override func initValues() {
        
        clientsViewModel.loadClients()
    }
    
}
