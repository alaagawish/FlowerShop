//
//  ClientsViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class ClientsViewController: BaseViewController {
    static let identifier = "ClientsViewController"
    
    @IBOutlet private weak var updateTitle: UILabel!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var addressTetField: UITextField!
    @IBOutlet private weak var updateClientView: UIView!
    @IBOutlet private weak var customersTbaleView: UITableView!
    private var clients: [Clients] = []
    private var currentIndex = 0
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
    
    @IBAction func closeUpdate(_ sender: Any) {
        updateClientView.isHidden = true
    }
    @IBAction func update(_ sender: Any) {
        updateClientView.isHidden = true
        
        clients[currentIndex].address = addressTetField.text
        clients[currentIndex].phone = phoneTextField.text
        customersTbaleView.reloadData()
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
        let updateAction = UIContextualAction(style: .normal, title: "Update") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            currentIndex = indexPath.row
            updateTitle.text = "Update Address or Phone for \(clients[indexPath.row].name ?? "")"
            addressTetField.text = clients[indexPath.row].address
            phoneTextField.text = clients[indexPath.row].phone
            updateClientView.isHidden = false
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [updateAction, deleteAction])
        
    }
    
}
