//
//  Product.swift
//  1,2HomeWork
//
//  Created by Байгелди Акылбек уулу on 20/10/22.
//

import Foundation

//1  task
class Car{
    
    var brand:String
    var model:String
    var maxSpeed:Int
    var power:Int
    var accelation0to100:Double
    
    var point = 0
    
init(brand:String,model:String,maxSpeed:Int,power:Int,accelation0to100:Double){
       
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.power = power
        self.accelation0to100 = accelation0to100
        
    }
    func upgrade(){
        print("""

марка - \(brand)
модель - \(model)
максимальная скорость- \(maxSpeed) км/ч
мощность- \(power) лошадиных сил
разгон - \(accelation0to100) секунд
""")
        switch maxSpeed{
        case 0...399 :
            maxSpeed = 400
        default:
            point += 1
        }
        
        switch power{
        case  0...499 :
            power = 500
        default:
            point += 1
        }
        
        switch accelation0to100{
        case 2.4... :
            accelation0to100 = 2.5
        default:
            point += 1
        }
        
        switch point{
        case 3 :
            print("Эту машину уже некуда улучшать!")
        case ...3 :
            print("""

    После тюнинга
    марка - \(brand)
    модель - \(model)
    максимальная скорость - \(maxSpeed) км/ч
    мощность - \(power) лошадиных сил
    разгон - \(accelation0to100) секунд
    """)
        default:
            return
        }
    }
}


var car1 = Car (brand: "Mercedes", model: "S550", maxSpeed: 220, power: 320 , accelation0to100: 5)
car1.upgrade()

var car2 = Car(brand: "Bugatti", model: "Veyron", maxSpeed: 420, power: 600, accelation0to100: 2)
car2.upgrade()



//2 task
class Shop{

    var nameOfShop = "Globus"
    var products = ["Pepsi 70","Bread 30","Milk 68","Eqqs 150"]
    var str = ""
    
    func showProducts(){
        for x in products{
        str += ("\(x) ")
    }
    print(str)
    str = ""
}
}

class NewProduct{

    var nameAndPrice: String


    init(nameAndPrice: String){
        self.nameAndPrice = nameAndPrice
    }
        func addToShop(){
            shop.products.append(nameAndPrice)
        }
    }



var shop = Shop()
shop.showProducts()

var product1 = NewProduct(nameAndPrice: "Potato 45")
product1.addToShop()
var product2 = NewProduct(nameAndPrice: "Salt 20")
product2.addToShop()
shop.showProducts()


//2 task

class Client{
    
    var name:String
    var surname:String
    var id:Int
    var balance:Int
    
    init(name:String,surname:String,id:Int,balance:Int){
        self.name = name
        self.surname = surname
        self.id = id
        self.balance = balance
    }
}

class Bank{
    
    var base:[Client]
    init (clients: [Client]){
       self.base = clients
       }
    

    func sameID(id: Int) {
           for i in base{
               if i.id == id   {
                   print("Баланс клиента с ID (\(id)) равен \(i.balance)")
               }
           }
       }
    
    func sameSurname(surname:String) {
        for x in base{
            if x.surname == surname{
                print("Баланс клиента с фамилией \(surname) равен \(x.balance)")
            }
        }
    }
    
    func tranzaction(from:String,to:String,sum:Int){
        for v in base{
            if v.name == from{
                v.balance -= sum
                print("\(v.name), \(v.balance) - \(sum)")
               
            }
        
              if v.name == to {
                  v.balance += sum
                print("\(v.name), \(v.balance) + \(sum)")
               
            }
        }
    }
}

var client1 = Client(name: "Baigeldi", surname: "Akylbek uulu", id: 12, balance: 7000)
var client2 = Client(name: "Nuridin", surname: "Safaraliev", id: 45, balance: 7875)
var client3 = Client(name: "Maga", surname: "Altynbekov", id: 76, balance: 6556)
print(client1.name, client1.balance)
print(client3.name,client3.balance)

var bank1 = Bank(clients: [client1,client2,client3])
bank1.sameID(id: 12)
bank1.sameSurname(surname: "Akylbek uulu")
bank1.tranzaction(from: "Maga", to: "Safaraliev", sum: 2850)



//dop zadanie
class NebesnyeTela{
    
    var name: String
    var radius: Int
    var massa: String
    
    init(name:String,radius:Int,massa:String){
        self.name = name
        self.radius = radius
        self.massa = massa
    }
    
    func objectInfo(){
        print("Название \(name), радиус - \(radius), масса - \(massa) ")
    }
}

class Stars:NebesnyeTela{
    
    var yarcost:Int
    var typeOfStar:String
    
    init(name:String,radius:Int,massa:String,yarcost:Int,typeOfStar:String){
        self.yarcost = yarcost
        self.typeOfStar = typeOfStar
        super.init(name: name, radius: radius, massa: massa)
    }
    override func objectInfo() {
        print("""
Название \(name), радиус - \(radius), масса - \(massa)
тип звезды - \(typeOfStar), яркость \(yarcost)
""")
    }
}

class Planets:NebesnyeTela{
    
    var sputnik:Bool
    var rings:Bool
    
    var sputnikYest = ""
    var ringsYest = ""
    
    var yes = "есть"
    var no = "нет"
    
     init(name: String, radius: Int, massa: String,sputnik:Bool,rings:Bool) {
         
        self.sputnik = sputnik
        self.rings = rings
        super.init(name: name, radius: radius, massa: massa)
         
    }
    override func objectInfo() {
       sputnikYest = sputnik ==  true ? yes : no
        ringsYest = rings ==  true ? yes : no
        
        print("""
Название "\(name)", радиус - \(radius)
масса \(massa), спутник \(sputnikYest), кольца \(ringsYest)
""")
    }
}

var nebtelo1 = NebesnyeTela(name: "Earth", radius: 12000, massa:"4565465")
var star1 = Stars(name: "Sun", radius: 4355345435, massa: "6756765765" , yarcost: 435435435, typeOfStar: "Orange Dwarf")
var planet1 = Planets(name: "Saturn", radius: 45435354, massa: "34545345", sputnik: true, rings: true)

nebtelo1.objectInfo()
star1.objectInfo()
planet1.objectInfo()
 

