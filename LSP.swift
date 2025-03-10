import Foundation 

/*
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

 */

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



