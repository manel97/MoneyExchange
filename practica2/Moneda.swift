//
//  Moneda.swift
//  practica2
//
//  Created by Manel Sitjar on 31/10/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let x = pow(10.0, Double(places))
        return (self * x).rounded() / x
    }
}


class Moneda {
    var tipo: String?
    var valorToday: String?    
    var image: UIImage
    var backImage: UIImage
    
    init(tipo:String, valorToday:String, image:UIImage, backImage: UIImage) {
        self.tipo = tipo
        self.valorToday = valorToday
        self.image = image
        self.backImage = backImage
    }
    func getTipo() -> String{
        return (tipo ?? nil)!
    }
    func setTipo(tipo:String){
        self.tipo = tipo
    }
    func getValor() -> String{
        return (valorToday ?? nil)!
    }   
    func setValor(valor:String){
        self.valorToday = valor
    }
    func getImg() -> UIImage{
        return image
    }
    func setImg(img:UIImage){
        self.image = img
    }
    func getBackImg() -> UIImage{
        return backImage
    }
    func setImg(backImg:UIImage){
        self.backImage = backImg
    }
    
    func convert(mn1:Moneda, mn2:Moneda, cantidad:Double) -> Double {
        let moneda1:String = mn1.getTipo()
        let moneda2:String = mn2.getTipo()
        
        if moneda1 == "dollar"{
            if moneda2 == "dollar"{
                return cantidad.rounded(toPlaces: 2)
            } else if moneda2 == "euro" {
                return cantidad*0.88.rounded(toPlaces: 2)
            } else if moneda2 == "libra"{
                return cantidad*0.78.rounded(toPlaces: 2)
            } else if moneda2 == "bitcoin"{
                return cantidad*0.00016.rounded(toPlaces: 2)
            } else if moneda2 == "franco suizo"{
                return cantidad*1.01.rounded(toPlaces: 2)
            }
        } else if moneda1 == "euro"{
            if moneda2 == "dollar"{
                return cantidad*1.13.rounded(toPlaces: 2)
            } else if moneda2 == "euro" {
                return cantidad.rounded(toPlaces: 2)
            } else if moneda2 == "libra"{
                return cantidad*0.89.rounded(toPlaces: 2)
            } else if moneda2 == "bitcoin"{
                return cantidad*0.00018.rounded(toPlaces: 2)
            } else if moneda2 == "franco suizo"{
                return cantidad*1.14.rounded(toPlaces: 2)
            }
        } else if moneda1 == "libra"{
            if moneda2 == "dollar"{
                return cantidad*1.28.rounded(toPlaces: 2)
            } else if moneda2 == "euro" {
                return cantidad*1.13.rounded(toPlaces: 2)
            } else if moneda2 == "libra"{
                return cantidad.rounded(toPlaces: 2)
            } else if moneda2 == "bitcoin"{
                return cantidad*0.00021.rounded(toPlaces: 2)
            } else if moneda2 == "franco suizo"{
                return cantidad*1.28.rounded(toPlaces: 2)
            }
        } else if moneda1 == "bitcoin"{
            if moneda2 == "dollar"{
                return cantidad*6221.rounded(toPlaces: 2)
            } else if moneda2 == "euro" {
                return cantidad*5500.rounded(toPlaces: 2)
            } else if moneda2 == "libra"{
                return cantidad*4872.rounded(toPlaces: 2)
            } else if moneda2 == "bitcoin"{
                return cantidad.rounded(toPlaces: 2)
            } else if moneda2 == "franco suizo"{
                return cantidad*6255.rounded(toPlaces: 2)
            }
        } else if moneda1 == "franco suizo" {
            if moneda2 == "dollar"{
                return cantidad*0.99.rounded(toPlaces: 2)
            } else if moneda2 == "euro" {
                return cantidad*0.88.rounded(toPlaces: 2)
            } else if moneda2 == "libra"{
                return cantidad*0.78.rounded(toPlaces: 2)
            } else if moneda2 == "bitcoin"{
                return cantidad*0.00016.rounded(toPlaces: 2)
            } else if moneda2 == "franco suizo"{
                return cantidad.rounded(toPlaces: 2)
            }
        } else {
            return 0
        }
    return 0
}
}
