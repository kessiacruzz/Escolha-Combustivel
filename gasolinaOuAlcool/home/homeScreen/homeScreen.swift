//
//  homeScreen.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 21/08/23.
//

import UIKit

protocol homeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class homeScreen: UIView {
    
    private weak var delegate: homeScreenDelegate?
   
    public func delegate(delegate: homeScreenDelegate){
        self.delegate = delegate
    }
    
    
    lazy var imagemFundoImageView: UIImageView = {
        let imagemfundo = UIImageView()
        imagemfundo.translatesAutoresizingMaskIntoConstraints = false
        imagemfundo.image = UIImage(named: "fundoImage2")
        imagemfundo.contentMode = .scaleAspectFill
        return imagemfundo
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "logoImage")
        imageLogo.contentMode = .scaleAspectFit
        return imageLogo
    }()
    
    lazy var startButton: UIButton = {
        let buttonStar = UIButton()
        buttonStar.translatesAutoresizingMaskIntoConstraints = false
        buttonStar.setTitle("Começar", for: .normal)
        buttonStar.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        buttonStar.setTitleColor(.white, for: .normal)
        buttonStar.clipsToBounds = true
        buttonStar.layer.cornerRadius = 8
        buttonStar.backgroundColor = UIColor(red: 239/255, green: 95/255, blue: 0/255, alpha: 1.0) /* #ef5f00 */
        buttonStar.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        //buttonStar.layer.borderColor = UIColor.white.cgColor
        //buttonStar.layer.borderWidth = 2
        return buttonStar
    }()
    
    lazy var rodapeImageView: UIImageView = {
        let rodapeImage = UIImageView()
        rodapeImage.translatesAutoresizingMaskIntoConstraints = false
        rodapeImage.image = UIImage(named: "rodape")
        rodapeImage.contentMode = .scaleAspectFit
        return rodapeImage
    }()
    
    lazy var gasolinaOuAlcoolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Álcool ou Gasolina?"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        adicionarElementos()
        configConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
    }
    
    private func adicionarElementos() {
        addSubview(imagemFundoImageView)
        addSubview(logoImageView)
        addSubview(startButton)
        addSubview(rodapeImageView)
        addSubview(gasolinaOuAlcoolLabel)
    }
    
    private func configConstrants() {
       NSLayoutConstraint.activate([
        imagemFundoImageView.topAnchor.constraint(equalTo: topAnchor),
        imagemFundoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        imagemFundoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        imagemFundoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 104),
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -580),
        //logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        //logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
        startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
        startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
        startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
        startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        startButton.heightAnchor.constraint(equalToConstant: 44),
        
        rodapeImageView.topAnchor.constraint(equalTo: startButton.topAnchor, constant: 60),
        rodapeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
        rodapeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        //rodape.leadingAnchor.constraint(equalTo: leftAnchor, constant: 50),
        //rodape.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        
        gasolinaOuAlcoolLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 120),
        gasolinaOuAlcoolLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        ])
    }
    


}
