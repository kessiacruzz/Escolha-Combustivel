//
//  UIViewController + Extension.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 31/08/23.
//

import Foundation
import UIKit


extension UIViewController {
    func baixarTecladoAoTocarQualquerLugar() {
        let tocar = UITapGestureRecognizer(target: self, action: #selector(baixarTecladoToque))
        tocar.cancelsTouchesInView = false
        view.addGestureRecognizer(tocar)
    }
    
    @objc private func baixarTecladoToque(){
        view.endEditing(true)
    }
}
