 //
//  HomeViewController.swift
//  IOS-Calculator
//
//  Created by Susana Santos Moreno on 23/06/2019.
//  Copyright © 2019 Susana Santos Moreno. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    // Result
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    //Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorPlus: UIButton!
    @IBOutlet weak var operatorMinus: UIButton!
    @IBOutlet weak var operatorProduct: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    //Decimal
    @IBOutlet weak var numberDecimal: UIButton!
    
    // MARK: - Variables
    
    private var total: Double = 0 //Total
    private var operation: String = "" //operacion
    private var parameter1: String = "" //parameter 1
    private var parameter2: String = "" //parameter 2
    private var changePar : Bool = false // change when an operation is pressed
    private var decimal : Bool = false // change when a number is decimal
    private var negative : Bool = false // change when a number is negative
    private var percent : Bool = false // change when a number is percent
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round Borders
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        operatorAC.round()
        operatorPlus.round()
        operatorMinus.round()
        operatorResult.round()
        operatorPercent.round()
        operatorProduct.round()
        operatorDivision.round()
        operatorPlusMinus.round()
        numberDecimal.round()
        
        operatorPlus.backgroundColor = UIColor.orange
        operatorProduct.backgroundColor = UIColor.orange
        operatorDivision.backgroundColor = UIColor.orange
        operatorMinus.backgroundColor = UIColor.orange
        operatorResult.backgroundColor = UIColor.orange
        
    }

    // MARK: - Button Actions
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // AC Action
    @IBAction func OperationAC_Action(_ sender: UIButton) {
        sender.shine()
        
        colorNoPulsado(button: operatorPlus)
        colorNoPulsado(button: operatorMinus)
        colorNoPulsado(button: operatorDivision)
        colorNoPulsado(button: operatorProduct)
        
        resultLabel.text = "0"
        parameter1 = ""
        parameter2 = ""
        operation = ""
        changePar = false
        decimal = false
        negative = false
        percent = false
    }
    
    // Plus Minus Action
    @IBAction func operationPlusMinusAction(_ sender: UIButton) {
        sender.shine()
        negative = true
        percent = false
    }
    
    // Percent Action
    @IBAction func operationPercentAction(_ sender: UIButton) {
        sender.shine()
        operation = "%"
        percent = true
        var num = 0.0
        if let label = resultLabel.text{
            num = Double(label) ?? 0.0
        }
        
        let resultado = num/100
        resultLabel.text = String(resultado)
        if(changePar == false){
             parameter1 = resultLabel.text!
        }else{
             parameter2 = resultLabel.text!
        }
    }
    
    // Division Action
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
        operation = "/"
        changePar = true
        decimal = false
        negative = false
        percent = false
        
        colorPulsado(button: sender)
        colorNoPulsado(button: operatorPlus)
        colorNoPulsado(button: operatorMinus)
        colorNoPulsado(button: operatorProduct)
    }
    
    // Multiplication Action
    @IBAction func operatorProductAction(_ sender: UIButton) {
        sender.shine()
        operation = "*"
        changePar = true
        decimal = false
        negative = false
        percent = false
        
        colorPulsado(button: sender)
        colorNoPulsado(button: operatorPlus)
        colorNoPulsado(button: operatorDivision)
        colorNoPulsado(button: operatorMinus)
    }
    
    // Minus Action
    @IBAction func operationMinusAction(_ sender: UIButton) {
        sender.shine()
        operation = "-"
        if(resultLabel.text != "0"){
            changePar = true
        }//de momento solo cambia de parametro si éste es distinto de 0
        decimal = false
        negative = false
        percent = false
        
        colorPulsado(button: sender)
        colorNoPulsado(button: operatorPlus)
        colorNoPulsado(button: operatorDivision)
        colorNoPulsado(button: operatorProduct)
    }
    
    // Plus Action
    @IBAction func operationPlusAction(_ sender: UIButton) {
        sender.shine()
        operation = "+"
        changePar = true
        decimal = false
        negative = false
        percent = false
        
        colorPulsado(button: sender)
        colorNoPulsado(button: operatorMinus)
        colorNoPulsado(button: operatorDivision)
        colorNoPulsado(button: operatorProduct)
    }
    
    // Result
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
        resultLabel.text = String(calcular(p1: Double(parameter1) ?? 0.0 , op: operation, p2: Double(parameter2) ?? 0.0))
        //se vuelve al inicio por si acaso no pulsa el AC
        parameter1 = ""
        parameter2 = ""
        operation = ""
        changePar = false
        decimal = false
        negative = false
        percent = false
    }
    
    // Decimal
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
        if let label = resultLabel.text {
            resultLabel.text = label + "."
        }
        decimal = true
        
    }
    
    // MARK: - NUMBERS ACTIONS
    @IBAction func numberAction(_ sender: UIButton) {
        colorNoPulsado(button: operatorPlus)
        colorNoPulsado(button: operatorMinus)
        colorNoPulsado(button: operatorDivision)
        colorNoPulsado(button: operatorProduct)
        sender.shine()
        if let label = resultLabel.text {
            if(resultLabel.text == "0"){
                if(operation == "-" || negative == true){
                    resultLabel.text = "-" + sender.currentTitle!
                }else{
                    resultLabel.text = sender.currentTitle!
                }
            }else{
                if(changePar == true){
                    if(negative){
                        resultLabel.text = "-" + sender.currentTitle!
                    }else{
                        resultLabel.text = sender.currentTitle!
                    }
                }else{
                    if(negative){
                        resultLabel.text = "-" + label + sender.currentTitle!
                    }else{
                        resultLabel.text = label + sender.currentTitle!
                    }
                }
            }
            if(changePar == false){
                if(decimal == false){
                    if let resultado = resultLabel.text{
                        parameter1 = resultado
                    }
                }else{
                    parameter1 = parameter1 + "." + sender.currentTitle!
                }
            }else{
                if(decimal == false){
                    if let resultado = resultLabel.text{
                        parameter2 = resultado
                    }
                }else{
                    parameter2 = parameter2 + "." + sender.currentTitle!
                }
            }
        }
    }
    
    private func colorPulsado (button: UIButton){
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.orange, for: .normal)
    }
    
    private func colorNoPulsado (button: UIButton){
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    private func calcular ( p1: Double, op : String, p2: Double) -> Double{
        var resultado: Double = 0
        
        if(p1 != 0.0 && p2 != 0.0){
            if(op == "+"){
                resultado = p1 + p2
            }else if ( op == "-"){
                resultado = p1 - p2
            }else if ( op == "*"){
                resultado = p1 * p2
            }else if ( op == "/"){
                if (p2 != 0){
                    resultado = p1 / p2
                }
            }else if ( op == "%"){
                resultado = p1/100
            }
        }else{
            if(p1 == 0.0){
                resultado = p2
            }else if (p2 == 0.0){
                resultado = p1
            }
        }
        return resultado
        
    }
    
 }
