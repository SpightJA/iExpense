//
//  AddView.swift
//  iExspense
//
//  Created by Jon Spight on 4/24/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var amount = 0.0
    @State private var currentType = "Personal"
    @Environment(\.dismiss) var dismiss
    
//    @Environment() var submit
    let types = ["Personal", "Business"]
    var expenses : Expenses
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("Name:", text: $name)
                Picker("Type", selection: $currentType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount:", value: $amount,  format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Item")
            .toolbar {
                Button("Save"){
                    //save it to the correct list
                    let expense = ExpenseItem(name: name, type: currentType, amount: amount )
                    if(currentType == "Personal") {
                        expenses.personalItems.insert(expense, at: 0)
                    }else {
                        expenses.businessItems.insert(expense, at: 0)

                    }
                    dismiss()
                }

                
            }
        
        }
    }
}

#Preview {
    AddView( expenses: Expenses())
}
