//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by IZIY on 8/20/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var name : String = ""
    @State var quantity : String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Product.entity(), sortDescriptors: [])
    private var products : FetchedResults<Product>
    
    private func saveContext(){
        do {
            try viewContext.save()
        }catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    private func addProduct(){
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            saveContext()
        }
    }
    
    private func deleteProducts(offsets: IndexSet){
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name ",text: $name)
                TextField("Product Quantity",text: $quantity)
                
                HStack{
                    Spacer()
                    Button("Add"){
                        addProduct()
                    }
                    Spacer()
                    Button("Clear"){
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List{
                    ForEach(products){ product in
                        HStack {
                            Text(product.name ?? "Not Found")
                            Spacer()
                            Text(product.quantity ?? "Not Found")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Product database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
