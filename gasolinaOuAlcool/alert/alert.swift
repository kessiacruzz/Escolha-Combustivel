//
//  alert.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 24/08/23.
//

import UIKit

class alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func alertInfaromativa(titulo: String, mensagem: String) {
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        
        controller.present(alertController, animated: true)
    }

}
