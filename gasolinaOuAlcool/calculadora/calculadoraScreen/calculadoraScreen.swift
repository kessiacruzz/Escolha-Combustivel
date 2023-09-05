//
//  calculadoraScreen.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 22/08/23.
//

import UIKit

protocol calculadoraScreenDelegate: AnyObject {
    func tappedCalculadoraButton()
    func tappedVoltarButton()
}

class calculadoraScreen: UIView {
    
    private weak var delegate: calculadoraScreenDelegate?
    
    public func delegate(delegate: calculadoraScreenDelegate) {
        self.delegate = delegate
    }

    lazy var FundoCalculadoraImageView: UIImageView = {
      let imagemFundo = UIImageView()
        imagemFundo.translatesAutoresizingMaskIntoConstraints = false
        imagemFundo.image = UIImage(named: "fundoImage3")
        imagemFundo.contentMode = .scaleAspectFit
      return imagemFundo
    }()
    
    lazy var logoCalculadoraImageView: UIImageView = {
        let logoCalculadora = UIImageView()
        logoCalculadora.translatesAutoresizingMaskIntoConstraints = false
        logoCalculadora.image = UIImage(named: "logoImage")
        logoCalculadora.contentMode = .scaleAspectFit
        return logoCalculadora
    }()
    
    lazy var gasolinaOuAlcoolCalculadoraLabel: UILabel = {
        let labelCalculadora = UILabel()
        labelCalculadora.translatesAutoresizingMaskIntoConstraints = false
        labelCalculadora.text = "Álcool ou Gasolina?"
        labelCalculadora.textColor = .white
        labelCalculadora.font = UIFont.systemFont(ofSize: 25)
        return labelCalculadora
    }()
    
    lazy var alcoolPrecoTextField: UITextField = {
        let alcoolTextField = UITextField()
        alcoolTextField.translatesAutoresizingMaskIntoConstraints = false
        alcoolTextField.autocorrectionType = .no
        alcoolTextField.backgroundColor = .white
        alcoolTextField.borderStyle = .roundedRect
        alcoolTextField.keyboardType = .decimalPad
        alcoolTextField.placeholder = "Preço do álcool:"
        alcoolTextField.textColor = .darkGray
        alcoolTextField.addBotaoVoltarTeclado()
        return alcoolTextField
    }()
    
    lazy var gasolinaPrecoTextField: UITextField = {
        let gasolinaTextField = UITextField()
        gasolinaTextField.translatesAutoresizingMaskIntoConstraints = false
        gasolinaTextField.autocorrectionType = .no
        gasolinaTextField.backgroundColor = .white
        gasolinaTextField.borderStyle = .roundedRect
        gasolinaTextField.keyboardType = .decimalPad
        gasolinaTextField.placeholder = "Preço do gasolina:"
        gasolinaTextField.textColor = .darkGray
        gasolinaTextField.addBotaoVoltarTeclado()
        return gasolinaTextField
    }()
    
    lazy var calculadoraButton: UIButton = {
        let buttonCalculadora = UIButton()
        buttonCalculadora.translatesAutoresizingMaskIntoConstraints = false
        buttonCalculadora.setTitle("Calcular", for: .normal)
        buttonCalculadora.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        buttonCalculadora.setTitleColor(.white, for: .normal)
        buttonCalculadora.clipsToBounds = true
        buttonCalculadora.layer.cornerRadius = 8
        buttonCalculadora.backgroundColor = UIColor(red: 239/255, green: 95/255, blue: 0/255, alpha: 1.0)
        buttonCalculadora.addTarget(self, action: #selector(tappedCalculadoraButton), for: .touchUpInside)
        
        return buttonCalculadora
    }()
    
    lazy var voltarButton: UIButton = {
        let buttonVoltar = UIButton()
        buttonVoltar.translatesAutoresizingMaskIntoConstraints = false
        buttonVoltar.setImage(UIImage(named: "voltar"), for: .normal)
        buttonVoltar.addTarget(self, action: #selector(tappedVoltarButtton), for: .touchUpInside)
        return buttonVoltar
    }()
    
    lazy var rodapeCalculadoraImageView: UIImageView = {
        let rodapeCalculadoraImage = UIImageView()
        rodapeCalculadoraImage.translatesAutoresizingMaskIntoConstraints = false
        rodapeCalculadoraImage.image = UIImage(named: "rodape")
        rodapeCalculadoraImage.contentMode = .scaleAspectFit
        return rodapeCalculadoraImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElemetos()
        configConstranits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedCalculadoraButton() {
        delegate?.tappedCalculadoraButton()
    }
    
    @objc func tappedVoltarButtton() {
        delegate?.tappedVoltarButton()
    }
    
    
    
    private func addElemetos() {
      addSubview(FundoCalculadoraImageView)
      addSubview(logoCalculadoraImageView)
      addSubview(gasolinaOuAlcoolCalculadoraLabel)
      addSubview(alcoolPrecoTextField)
      addSubview(gasolinaPrecoTextField)
      addSubview(calculadoraButton)
      addSubview(voltarButton)
      addSubview(rodapeCalculadoraImageView)
    }
    
    private func configConstranits() {
        NSLayoutConstraint.activate([
            FundoCalculadoraImageView.topAnchor.constraint(equalTo: topAnchor),
            FundoCalculadoraImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            FundoCalculadoraImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            FundoCalculadoraImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            voltarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            voltarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            voltarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350),
            voltarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -760),
            
            
            logoCalculadoraImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoCalculadoraImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoCalculadoraImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -540),
            //logoCalculadoraImageView.leadingAnchor.constraint(equalTo: leftAnchor, constant: 20),
            //logoCalculadoraImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            gasolinaOuAlcoolCalculadoraLabel.topAnchor.constraint(equalTo: logoCalculadoraImageView.topAnchor, constant: 120),
            gasolinaOuAlcoolCalculadoraLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            alcoolPrecoTextField.topAnchor.constraint(equalTo: logoCalculadoraImageView.bottomAnchor, constant: 134),
            alcoolPrecoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            alcoolPrecoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            alcoolPrecoTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasolinaPrecoTextField.topAnchor.constraint(equalTo: alcoolPrecoTextField.bottomAnchor, constant: 16),
            gasolinaPrecoTextField.leadingAnchor.constraint(equalTo: alcoolPrecoTextField.leadingAnchor),
            gasolinaPrecoTextField.trailingAnchor.constraint(equalTo: alcoolPrecoTextField.trailingAnchor),
            gasolinaPrecoTextField.heightAnchor.constraint(equalTo: alcoolPrecoTextField.heightAnchor),
            
            calculadoraButton.topAnchor.constraint(equalTo: gasolinaPrecoTextField.bottomAnchor, constant: 70),
            calculadoraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculadoraButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculadoraButton.heightAnchor.constraint(equalToConstant: 44),
            
            rodapeCalculadoraImageView.topAnchor.constraint(equalTo: calculadoraButton.topAnchor, constant: 60),
            rodapeCalculadoraImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            rodapeCalculadoraImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
        ])
    }
    
}
