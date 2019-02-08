//
//  Hack.swift
//  practica2
//
//  Created by Manel Sitjar on 07/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

class Hack: UIViewController ,UIPickerViewDataSource
, UIPickerViewDelegate {
    
    @IBOutlet weak var lblFinal: UILabel!
    @IBOutlet weak var currentTxt: UITextField!
    @IBOutlet weak var pvMonedas: UIPickerView!
    @IBOutlet weak var btnAplicar: UIButton!
    var currentMoney = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monedas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return monedas[row].getTipo()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    
    @IBAction func Aplicar(_ sender: UIButton) {
        currentMoney = pvMonedas.selectedRow(inComponent: 0)
        let moneda = monedas[currentMoney]
        
        if currentTxt.text == ""{
            lblFinal.text = "tienes que introducir algun valor"
        }
        else{
            if currentTxt.text?.isNumber == true {
                moneda.setValor(valor: currentTxt.text ?? "")
                let alert = UIAlertController(title: "Vas a cambiar un valor", message: "Vas a hacer un cambio permanente en la aplicación, estás seguro/a de continuar?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                lblFinal.text = "El valor del \(moneda.getTipo()) ha pasado a ser \(moneda.getValor())"
            } else{
                let alert = UIAlertController(title: "Valor no numérico", message: "no puedes definir un valor no numérico en este campo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                currentTxt.text = ""
            }
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //lblFinal.text = ""
    }
    
}


