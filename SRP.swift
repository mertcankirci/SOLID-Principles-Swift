import Foundation


/*
 class OrderService {
 func processOrder(orderId: Int) {
 print("Processing order: \(orderId)")
 }
 
 func sendOrderEmail(orderId: Int) {
 print("Sending order email for order: \(orderId)")
 }
 
 func saveOrderToDatabase(orderId: Int) {
 print("Saving order \(orderId) to database")
 }
 }
 
 */


//MARK: - Here is the corrected code.

class OrderService {
    var orderDB: OrderDBManagement
    var orderComm: OrderCommunication
    
    init(orderDB: OrderDBManagement, orderComm: OrderCommunication) {
        self.orderDB = orderDB
        self.orderComm = orderComm
    }
    
    func processOrder(orderId: Int) {
        print("Processing order: \(orderId)")
    }
    
    func sendOrderEmail(orderId: Int) {
        orderComm.sendOrderEmail(orderId: orderId)
    }
    
    func saveOrderToDatabase(orderId: Int) {
        orderDB.saveOrderToDB(orderId: orderId)
    }
}

class OrderCommunication {    
    func sendOrderEmail(orderId: Int) {
        print("Sending order email for order: \(orderId)")
    }
}

class OrderDBManagement {
    func saveOrderToDB(orderId: Int) {
        print("Saving order \(orderId) to database")
    }
}

