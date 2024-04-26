//
//  iExpense.swift
//  iExspense
//
//  Created by Jon Spight on 4/19/24.
//

import SwiftUI


struct iExpense: View {
    @State private var viewModel = iExpenseViewModel()
    @AppStorage("CurrentNumber") private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Personal Expenses"){
                    ForEach(viewModel.expenses.personalItems){ item in
                        HStack{
                            VStack (alignment: .leading) {
                                Text(item.name)
                                Text(item.type)
                            }
                            Spacer()
                            Text("\(item.amount , format: .currency(code: "USD"))")
                                .foregroundStyle(item.amount >= 100.00 ? .red.opacity(0.8) : .orange.opacity(0.6))
                        }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.removePIndex(at: indexSet)
                    })
                }
                Section("Business Expenses"){
                    ForEach(viewModel.expenses.businessItems){ item in
                        HStack{
                            VStack (alignment: .leading) {
                                Text(item.name)
                                Text(item.type)
                            }
                            Spacer()
                            Text("\(item.amount , format: .currency(code: "USD"))")
                                .foregroundStyle(item.amount >= 100.00 ? .red.opacity(0.8) : .orange.opacity(0.6))
                            
                        }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.removeBIndex(at: indexSet)
                    })
                }
                
            }
            
            .toolbar{
                Button("Add", systemImage: "plus") {
                    viewModel.showingAddExpense.toggle()
                }
                
            }
            .navigationTitle("IExpense")
        }
        .sheet(isPresented: $viewModel.showingAddExpense, content: {
            AddView( expenses: viewModel.expenses)
        })
    }
}

#Preview {
    iExpense()
}



