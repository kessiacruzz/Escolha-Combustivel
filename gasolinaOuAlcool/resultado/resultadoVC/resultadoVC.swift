//
//  resultadoVC.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 29/08/23.
//

import UIKit

class resultadoVC: UIViewController {
    
    enum melhorEscolha: String {
        case gasolina = "Gasolina"
        
        case alcool = "Álcool"
    }
    
    var screen: resultadoScreen?
    let melhorEscolha: melhorEscolha
    
    init(melhorEscolha: melhorEscolha) {
        self.melhorEscolha = melhorEscolha
        super.init(nibName: nil, bundle: nil)
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func loadView() {
        screen = resultadoScreen()
        view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultadoLabel.text = self.melhorEscolha.rawValue
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension resultadoVC: resultadoScreenDelegate {
    
    func tappedCalcularNovamenteButton() {
        popViewController()
    }
    
    func tappedVoltarResultadoButton() {
        popViewController()
    }
    
    
}
