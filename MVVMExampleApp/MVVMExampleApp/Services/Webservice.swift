//
//  Webservice.swift
//  MVVMExampleApp
//
//  Created by Supapon Pucknavin on 16/10/2565 BE.
//

import Foundation
enum NetworkError: Error {
    case badURL
    case badRequest
    case decodingError
}

class Webservice {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "http://fakestoreapi.com/products") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return products
    }
}
