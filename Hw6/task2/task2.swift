//
//  task2.swift
//  Hw6
//
//  Created by david david on 12.12.2024.
//
import Foundation
class SecondTask {
    let bank: Bank
    
    init() {
        self.bank = Bank()
        bank.deposit(amount: 9000)
    }
    
    func raceConditionFunc() {
        
        for iteration in 0...15 {
            DispatchQueue.global().async {
                self.bank.withdraw(amount: 20) 
            }
        }
        bank.printBalance()
    }
    
}
