//
//  UITextField + Extension.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 31/08/23.
//

import Foundation
import UIKit


extension UITextField {
    
    func addBotaoVoltarTeclado() {
        let fazerToobar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    fazerToobar.barStyle = .default
        
        let espacoFlexivel = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let fazerBotao = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(fazerBotaoAction))
        
        let itens = [espacoFlexivel, fazerBotao]
        fazerToobar.items = itens
        fazerToobar.sizeToFit()
        fazerToobar.tintColor = UIColor.black
        self.inputAccessoryView = fazerToobar
    }
    
    @objc func fazerBotaoAction() {
        self.resignFirstResponder()
    }
}
