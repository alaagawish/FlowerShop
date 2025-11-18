//
//  BaseViewController.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import UIKit
protocol BaseProtocol {
    func bindViewModel()
    func registerCells()
    func initValues()
}

class BaseViewController: UIViewController, BaseProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        registerCells()
        bindViewModel()
        createGestures()
    }
    func bindViewModel() {
        
    }
    func registerCells() {
        
    }
    func initValues() {
        
    }
    func createGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
