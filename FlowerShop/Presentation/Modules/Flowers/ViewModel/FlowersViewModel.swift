//
//  FlowersViewModel.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

class FlowersViewModel {
    
    private let getFlowersUseCase: GetFlowersUseCase
    
    var flowers: [Flowers] = []
    var onReload: (() -> Void)?
    
    init(getFlowersUseCase: GetFlowersUseCase) {
        self.getFlowersUseCase = getFlowersUseCase
    }
    
    func loadFlowers() {
        getFlowersUseCase.execute { [weak self] flowers in
            self?.flowers = flowers
            DispatchQueue.main.async {
                self?.onReload?()
            }
        }
    }
}
