import Foundation

/*
 class PaymentProcessor {
 func processPayment(type: String, amount: Double) {
 if type == "credit_card" {
 print("Processing credit card payment: \(amount)")
 } else if type == "paypal" {
 print("Processing PayPal payment: \(amount)")
 }
 }
 }

 */

protocol PaymentType {
    func processPayment(amount: Double) 
}

class CreditCardPayment: PaymentType {
    func processPayment(amount: Double) {
        print ("Processing credit card payment: \(amount)")
    }
}

class PaypalPayment: PaymentType {
    func processPayment(amount: Double) {
        print("Processing PayPal payment: \(amount)")
    }
}

class Payment {
    func pay(with type: PaymentType, amount: Double) {
        type.processPayment(amount: amount)
    }
}
