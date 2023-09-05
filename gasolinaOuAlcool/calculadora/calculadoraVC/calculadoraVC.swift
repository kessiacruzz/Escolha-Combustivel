//
//  calculadoraVC.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 22/08/23.
//

import UIKit

class calculadoraVC: UIViewController {

    var screen: calculadoraScreen?
    
    var alert: alert?
    
   
    
    override func loadView() {
        screen = calculadoraScreen()
        view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baixarTecladoAoTocarQualquerLugar()
        screen?.delegate(delegate: self)
        alert = gasolinaOuAlcool.alert(controller: self)
    }
    
    
    
}

extension calculadoraVC: calculadoraScreenDelegate {
    
    func tappedCalculadoraButton() {
        
        func validaTextField() -> Bool {
            
            guard let valorAlcool = screen?.alcoolPrecoTextField.text else { return false }

            guard let valorGasolina = screen?.gasolinaPrecoTextField.text else {return false }

            if valorAlcool.isEmpty && valorGasolina.isEmpty {

                alert?.alertInfaromativa(titulo: "Atenção !", mensagem: "Informe os valores necessários!")
                return false

            } else if valorAlcool.isEmpty {
                alert?.alertInfaromativa(titulo: "Atenção !", mensagem: "Informe o valor do àlcool")

            } else if valorGasolina.isEmpty {
                alert?.alertInfaromativa(titulo: "Atenção !", mensagem: "Informe o valor da Gasolina")

            }
               return true
      }
            
            
            
            if validaTextField() {
                
                
                let formatoNumerico = NumberFormatter()
                formatoNumerico.numberStyle = .decimal

                let precoAlcool: Double = (formatoNumerico.number(from: screen?.alcoolPrecoTextField.text ?? "0.0") as? Double) ?? 0.0

                let precoGasolina: Double = (formatoNumerico.number(from: screen?.gasolinaPrecoTextField.text ?? "0.0") as? Double) ?? 0.0

                let vc: resultadoVC?
                if precoAlcool / precoGasolina > 0.7 {
                    print("melhor usar gasolina")
                    vc = resultadoVC(melhorEscolha: .gasolina)
                } else {
                    print("melhor usar alcool")
                    vc = resultadoVC(melhorEscolha: .alcool)
                }
                navigationController?.pushViewController(vc ?? UIViewController(), animated: true)

            }
        }
        
        func tappedVoltarButton() {
            navigationController?.popViewController(animated: true)
            
        }
        
}
