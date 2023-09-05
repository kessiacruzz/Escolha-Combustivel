//
//  homeVC.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 21/08/23.
//

import UIKit

class homeVC: UIViewController {
    
    var screen: homeScreen?

  
    override func loadView() {
        screen = homeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }


}

extension homeVC: homeScreenDelegate {
    
    func tappedStartButton() {
    let vc = calculadoraVC()
    navigationController?.pushViewController(vc, animated: true)
    }
}

