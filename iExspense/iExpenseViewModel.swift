//
//  iExpenseViewModel.swift
//  iExspense
//
//  Created by Jon Spight on 4/26/24.
//

import Foundation
import SwiftUI

@Observable
class iExpenseViewModel {
    var expenses = Expenses()
    
    var showSheet = false
    var numbers = [Int]()
    var showingAddExpense = false
    
    
    func removePIndex(at offsets : IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    func removeBIndex(at offsets : IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}
