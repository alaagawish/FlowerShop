//
//  ClientsViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class ClientsViewController: BaseViewController {
    static let identifier = "ClientsViewController"
    
    @IBOutlet private weak var customersTbaleView: UITableView!
    private var clients: [Clients] = []
    
    private let clientsViewModel = ClientsViewModel(
        getClientsUseCase: DIContainer.shared.getClientsUseCase
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func bindViewModel() {
        clientsViewModel.onReload = { [weak self] in
            self?.clients = self?.clientsViewModel.clients ?? []
            self?.customersTbaleView.reloadData()
        }
        
    }
    override func registerCells() {
        customersTbaleView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    override func initValues() {
        clientsViewModel.loadClients()
    }
    
}
extension ClientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        cell.addNew(customer: clients[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            clients.remove(at: indexPath.row)
            customersTbaleView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
}
