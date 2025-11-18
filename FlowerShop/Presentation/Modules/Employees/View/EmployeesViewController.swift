//
//  EmployeesViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit

class EmployeesViewController: BaseViewController {
    static let identifier = "EmployeesViewController"
    @IBOutlet private weak var salaryTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var addEmployeeView: UIView!
    @IBOutlet private weak var employeesTableView: UITableView!
    private var employees: [Employees] = []
    private let employeesViewModel = EmployeesViewModel(
        getEmployessUseCase: DIContainer.shared.getEmployeesUseCase
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func bindViewModel() {
        employeesViewModel.onReload = { [weak self] in
            self?.employees = self?.employeesViewModel.Employees ?? []
            self?.employeesTableView.reloadData()
        }
        
    }
    override func registerCells() {
        employeesTableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    override func initValues() {
        employeesViewModel.loadEmployees()
    }
    
    @IBAction func close(_ sender: Any) {
        addEmployeeView.isHidden = true
    }
    @IBAction func addNewEmployee(_ sender: Any) {
        addEmployeeView.isHidden = false
    }
    
    @IBAction func doneAddEmployee(_ sender: Any) {
        employees.append(Employees(name: nameTextField.text ?? "", phone: phoneTextField.text ?? "", salary: Int(salaryTextField.text ?? "")))
        addEmployeeView.isHidden = true
        employeesTableView.reloadData()
    }
}
extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        cell.addNew(employee: employees[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            employees.remove(at: indexPath.row)
            employeesTableView.reloadData()
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [ deleteAction])
        
    }
}
