import Foundation

/*
 protocol Printer {
 func printDocument()
 func scanDocument()
 func faxDocument()
 }
 
 class BasicPrinter: Printer {
 func printDocument() {
 print("Printing document...")
 }
 
 func scanDocument() {
 fatalError("Basic printers can't scan!")
 }
 
 func faxDocument() {
 fatalError("Basic printers can't fax!") 
 }
 }
 
 class AdvancedPrinter: Printer {
 func printDocument() {
 print("Printing document...")
 }
 
 func scanDocument() {
 print("Scanning document...")
 }
 
 func faxDocument() {
 print("Faxing document...")
 }
 }

 */

protocol Printable {
    func printDocument() 
}

protocol Scanable {
    func scanDocument() 
}

protocol Faxable {
    func faxDocument()
}

class BasicPrinter: Printable {
    func printDocument() {
        print("Printing document...")
    }
}

class AdvancedPrinter: Printable, Faxable, Scanable {
    func scanDocument() {
        print("Scanning document...")
    }
    
    func faxDocument() {
        print("Faxing document...")        
    }
    
    func printDocument() {
        print("Printing document...")
    }
}

