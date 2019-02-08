//
//  ViewController.swift
//  practica2
//
//  Created by Manel Sitjar on 30/10/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import UIKit

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
let mn1 = Moneda(tipo: "dollar", valorToday: "1.14", image: UIImage.init(named: "usa")!, backImage: UIImage.init(named: "dollar")!)
let mn2 = Moneda(tipo: "euro", valorToday: "1", image: UIImage.init(named: "euro")!, backImage: UIImage.init(named: "europe")!)
let mn3 = Moneda(tipo: "libra", valorToday: "1.13",image: UIImage.init(named: "uk")!, backImage: UIImage.init(named: "libra")!)
let mn4 = Moneda(tipo: "bitcoin", valorToday: "5500", image: UIImage.init(named: "bitcoin.svg")!, backImage: UIImage.init(named: "monedas")!)
let mn5 = Moneda(tipo: "franco suizo", valorToday: "0.88", image: UIImage.init(named: "switzerland")!, backImage: UIImage.init(named: "franco")!)

var monedas = [Moneda]()



class ViewController: UIViewController, UIPickerViewDataSource
, UIPickerViewDelegate {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monedas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return monedas[row].getTipo()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var bckGris: UIImageView!
    @IBOutlet weak var lblConvirtiendo: UILabel!
    @IBOutlet weak var lblValorConvertido: UILabel!
    @IBOutlet weak var lblMonedaEscogida: UILabel!
    @IBOutlet weak var lblValorHoy: UILabel!
    @IBOutlet weak var lblTitol: UILabel!
    @IBOutlet weak var btnConvertir: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBefore: UIButton!
    @IBOutlet weak var txtValorMoneda: UITextField!
    @IBOutlet weak var pvMonedas: UIPickerView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bckground: UIImageView!
    var counter = 0
    
    
    
    //var valores = ["1.14", "1", "1.13", "5500", "0.88"]
    var currentMoney = 0
    var currentMoney2 = 0
    
   
    
    @IBAction func convertir(_ sender: UIButton) {
        currentMoney = pvMonedas.selectedRow(inComponent:0)
        currentMoney2 = pvMonedas.selectedRow(inComponent: 1)
        let moneda1 = monedas[currentMoney]
        let moneda2 = monedas[currentMoney2]
        lblConvirtiendo.text = "Convirtiendo de \(moneda1.getTipo()) a \(moneda2.getTipo())"
        
        if txtValorMoneda.text == "999"{
            
            let alert = UIAlertController(title: "Entrando al HACK", message: "Estas a punto de entrar al control de datos, aprieta el boton de arriba a la derecha para poder hackear el valor de las monedas del mundo", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            
            self.present(alert, animated: true)
            btnSettings.isHidden = false
        }
        
            let strCantidad:String = txtValorMoneda.text ?? "cantidad invalida"
            let cantidad:Double = strCantidad.toDouble() ?? 0
            let valorFinal:String = String(moneda1.convert(mn1: moneda1, mn2: moneda2, cantidad: cantidad))
            lblValorConvertido.text = valorFinal
        
        
        
    }
    
    func showMoneda(counter: Int){
        image.image = monedas[counter].getImg()
        lblMonedaEscogida.text = monedas[counter].getTipo()
        lblValorHoy.text = "\(monedas[counter].getValor())€"
        bckground.image = monedas[counter].getBackImg()
    }
    
    
    @IBAction func Atras(_ sender: UIButton) {
        counter -= 1
        btnNext.isHidden = false
        //print(counter)
        if counter <= 0 {
           btnBefore.isHidden = true
            showMoneda(counter: counter)
        }  else{
           btnBefore.isHidden = false
           showMoneda(counter: counter)
        }
    }
    
    @IBAction func Adelante(_ sender: UIButton) {
        counter += 1
        btnBefore.isHidden = false
        //print(counter)
        if counter >= 4{
            btnNext.isHidden = true
            showMoneda(counter: counter)
        } else{
            btnNext.isHidden = false
            showMoneda(counter: counter)
        }
    }
    
    
    @IBAction func Settings(_ sender: UIButton) {
        //abrir el otro View Controller
        
    }
    
    
    func cargarMonedas(){
        monedas.append(mn1)
        monedas.append(mn2)
        monedas.append(mn3)
        monedas.append(mn4)
        monedas.append(mn5)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0
        //Este sirve para que no vuelva a cargar 5 monedas en el array
        if monedas.count == 0{
            cargarMonedas()
        }
        pvMonedas.delegate = self
        pvMonedas.dataSource = self        
        lblValorConvertido.text = ""
        lblConvirtiendo.text = ""        
        btnBefore.isHidden = true
        btnSettings.isHidden = true
        showMoneda(counter: counter)
    }
}

