//
//  APIClient.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

class APIClient {
    func loadLocalJSON(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "Response", withExtension: "json") else {
            completion(.failure(NSError(domain: "FileNotFound", code: -1)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}
