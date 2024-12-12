//
//  bankaccount.swift
//  Hw6
//
//  Created by david david on 12.12.2024.
//
class Bank {
    var balance: Double = 0.0
    
    func withdraw(amount: Double) {
        if balance>=amount {
            balance -= amount
        }
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func printBalance() {
        print("current balance:")
        print(balance)
    }
}
