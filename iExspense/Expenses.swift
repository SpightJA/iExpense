//
//  Expenses.swift
//  iExspense
//
//  Created by Jon Spight on 4/26/24.
//

import Foundation

@Observable
class Expenses {
    var businessItems = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    var personalItems = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                personalItems = decodedItems
                return
            }
        }
        
        personalItems = []
        
        if let savedBItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBItems) {
                businessItems = decodedItems
                return
            }
        }
        
        businessItems = []
    }
}

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    var name    : String
    var type    : String
    var amount  : Double
}
