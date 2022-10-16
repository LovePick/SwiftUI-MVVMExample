//
//  ContentView.swift
//  MVVMExampleApp
//
//  Created by Supapon Pucknavin on 16/10/2565 BE.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @StateObject private var vm = ProductListViewModel(webservice: Webservice())
    
    
    
    // MARK: - BODY
    var body: some View {
        List(vm.products){ product in
            Text(product.title)
        }//: LIST
        .task {
            // .task : A view that runs the specified action asynchronously before the view appears.
            
            // call webservice
            await vm.populateProducts()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
