//
//  ProductListViewModel.swift
//  MVVMExampleApp
//
//  Created by Supapon Pucknavin on 16/10/2565 BE.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async {
        do{
            let products = try await webservice.getProducts()
            self.products = products.map(ProductViewModel.init)
            
        } catch {
            print(error)
        }
    }
}


struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
}
