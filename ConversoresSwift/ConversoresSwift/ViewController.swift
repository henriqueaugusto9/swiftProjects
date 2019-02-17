//
//  ViewController.swift
//  ConversoresSwift
//
//  Created by Henrique Augusto on 12/02/2019.
//  Copyright © 2019 Henrique Augusto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnitOne: UIButton!
    @IBOutlet weak var btUnitTwo: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnitOne.setTitle("Kilograma", for: .normal)
            btUnitTwo.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnitOne.setTitle("Real", for: .normal)
            btUnitTwo.setTitle("Dollar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distancia"
            btUnitOne.setTitle("Metro", for: .normal)
            btUnitTwo.setTitle("Kilometro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnitOne.setTitle("Celsius", for: .normal)
            btUnitTwo.setTitle("Fairenheight", for: .normal)
    }
        Convert(nil)
    }
    
    
    @IBAction func Convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btUnitOne {
                btUnitOne.alpha = 0.5
            } else {
                btUnitTwo.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperatura()
        case "Peso":
            calcPeso()
        case "Moeda":
            calcMoeda()
        default:
            calcDistancia()
        }
    view.endEditing(true)
    }
    
    func calcTemperatura(){
        guard let temperatura = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0{
            labelUnit.text = "Fairenheight"
            labelResult.text = String((temperatura * 1.8) + 32.0)
        } else {
            labelUnit.text = "Celsius"
            labelResult.text = String((temperatura - 32.0) / 1.8)
        }
    }
    func calcPeso(){
        guard let peso = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0{
            labelUnit.text = "Libra"
            labelResult.text = String(peso / 2.2046)
        } else {
            labelUnit.text = "Kg"
            labelResult.text = String(peso * 2.2046)
        }
    }
    func calcMoeda(){
        guard let dinheiro = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0{
            labelUnit.text = "Dollar"
            labelResult.text = String(dinheiro / 3.5)
        } else {
            labelUnit.text = "Real"
            labelResult.text = String(dinheiro * 3.5)
        }
    }
    func calcDistancia(){
        guard let distancia = Double(tfValue.text!) else {return}
        if btUnitOne.alpha == 1.0{
            labelUnit.text = "Km"
            labelResult.text = String(distancia * 1000)
        } else {
            labelUnit.text = "Metros"
            labelResult.text = String(distancia / 1000)
        }
    }
}
