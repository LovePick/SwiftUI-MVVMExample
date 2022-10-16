//
//  ProductModel.swift
//  MVVMExampleApp
//
//  Created by Supapon Pucknavin on 16/10/2565 BE.
//

import Foundation

struct Product: Decodable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
}
