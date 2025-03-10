import Foundation

/*
 class EmailService {
 func sendEmail(to recipient: String, message: String) {
 print("Sending email to \(recipient): \(message)")
 }
 }
 
 class NotificationManager {
 let emailService = EmailService()
 
 func sendNotification(to recipient: String, message: String) {
 emailService.sendEmail(to: recipient, message: message)
 }
 }

 */

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
