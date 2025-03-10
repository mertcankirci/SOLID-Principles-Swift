# 📌 SOLID Principles in Swift

This repository contains examples of **SOLID principles** implemented in Swift.  
SOLID is an acronym for **five design principles** that make software more maintainable and scalable.

---

## **1️⃣ Single Responsibility Principle (SRP)**
**_"A class should have only one reason to change."_**  

### ❌ **Bad Example (SRP Violation)**  
```swift
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
```
### ✅ **Good Example (SRP Applied)**
```swift
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
```

---

## **2️⃣ Open/Closed Principle (OCP)**
**_"A class should be open for extension but closed for modification."_**

### ❌ **Bad Example (OCP Violation)**
```swift
class PaymentProcessor {
    func processPayment(type: String, amount: Double) {
        if type == "credit_card" {
            print("Processing credit card payment: \(amount)")
        } else if type == "paypal" {
            print("Processing PayPal payment: \(amount)")
        }
    }
}
```

### ✅ **Good Example (OCP Applied)**
```swift
protocol PaymentType {
    func processPayment(amount: Double) 
}

class CreditCardPayment: PaymentType {
    func processPayment(amount: Double) {
        print("Processing credit card payment: \(amount)")
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
```

---

## **3️⃣ Liskov Substitution Principle (LSP)**
**_"A subclass should be able to replace its superclass without causing errors."_**

### ❌ **Bad Example (LSP Violation)**
```swift
class Rectangle {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

class Square: Rectangle {
    override init(width: Double, height: Double) {
        super.init(width: width, height: width)
    }

    override var width: Double {
        didSet { height = width }
    }

    override var height: Double {
        didSet { width = height }
    }
}
```

### ✅ **Good Example (LSP Applied)**
```swift
protocol Shape {
    func area() -> Double
}

class Rectangle: Shape {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

class Square: Shape {
    var side: Double

    init(side: Double) {
        self.side = side
    }

    func area() -> Double {
        return side * side
    }
}
```

---

## **4️⃣ Interface Segregation Principle (ISP)**
**_"A class should not be forced to implement methods it does not use."_**

### ❌ **Bad Example (ISP Violation)**
```swift
protocol Worker {
    func work()
    func eat()
}

class Engineer: Worker {
    func work() {
        print("Engineering work in progress...")
    }

    func eat() {
        print("Taking a lunch break")
    }
}

class Robot: Worker {
    func work() {
        print("Robot is working 24/7...")
    }

    func eat() {
        fatalError("Robots don't eat!") // ⚠️ ISP Violation
    }
}
```

### ✅ **Good Example (ISP Applied)**
```swift
protocol Workable {
    func work()
}

protocol Eatable {
    func eat()
}

class Engineer: Workable, Eatable {
    func work() {
        print("Engineering work in progress...")
    }

    func eat() {
        print("Taking a lunch break")
    }
}

class Robot: Workable {
    func work() {
        print("Robot is working 24/7...")
    }
}
```

---

## **5️⃣ Dependency Inversion Principle (DIP)**
**_"High-level modules should not depend on low-level modules. Both should depend on abstractions."_**

### ❌ **Bad Example (DIP Violation)**
```swift
class EmailService {
    func sendEmail(to recipient: String, message: String) {
        print("Sending email to \(recipient): \(message)")
    }
}

class NotificationManager {
    let emailService = EmailService() // ⚠️ DIP Violation!

    func sendNotification(to recipient: String, message: String) {
        emailService.sendEmail(to: recipient, message: message)
    }
}
```

### ✅ **Good Example (DIP Applied)**
```swift
protocol CommunicationService {
    func sendNotification(to recipient: String, message: String)
}

class EmailService: CommunicationService {
    func sendNotification(to recipient: String, message: String) {
        print("Sending email to \(recipient): \(message)")
    }
}

class SMSService: CommunicationService {
    func sendNotification(to recipient: String, message: String) {
        print("Sending SMS to \(recipient): \(message)")
    }
}

class NotificationManager {
    let communicationService: CommunicationService

    init(communicationService: CommunicationService) {
        self.communicationService = communicationService
    }

    func sendNotification(to recipient: String, message: String) {
        communicationService.sendNotification(to: recipient, message: message)
    }
}
```

---

### 🎉 **Conclusion**
By applying **SOLID principles** in Swift:  
✅ Our code is **cleaner, more maintainable, and scalable**.  
✅ We avoid **rigid, fragile, and tightly coupled designs**.  
✅ We follow **best software engineering practices**.  

🚀 **Happy Coding!**  
