//
//  resultadoScreen.swift
//  gasolinaOuAlcool
//
//  Created by MACBOOK M1 on 29/08/23.
//

import UIKit

protocol resultadoScreenDelegate: AnyObject {
    func tappedCalcularNovamenteButton()
    func tappedVoltarResultadoButton()
}

class resultadoScreen: UIView {
    
    private weak var delegate: resultadoScreenDelegate?
    
    public func delegate(delegate: resultadoScreenDelegate) {
        self.delegate = delegate
    }

    lazy var fundoResultadoImageView: UIImageView = {
        let fundoResultado = UIImageView()
        fundoResultado.translatesAutoresizingMaskIntoConstraints = false
        fundoResultado.image = UIImage(named: "fundoImage3")
        fundoResultado.contentMode = .scaleAspectFit
        return fundoResultado
    }()
    
    lazy var logoResultadoImageView: UIImageView = {
        let logoResultado = UIImageView()
        logoResultado.translatesAutoresizingMaskIntoConstraints = false
        logoResultado.image = UIImage(named: "logoImage")
        logoResultado.contentMode = .scaleAspectFit
        return logoResultado
    }()
    
    lazy var fraseResultadoLabel: UILabel = {
        let labelFraseResultado = UILabel()
        labelFraseResultado.translatesAutoresizingMaskIntoConstraints = false
        labelFraseResultado.textColor = .white
        labelFraseResultado.font = UIFont.boldSystemFont(ofSize: 31)
        labelFraseResultado.text = "Abasteça com:"
        return labelFraseResultado
    }()
    
    lazy var resultadoLabel: UILabel = {
        let labelResultado = UILabel()
        labelResultado.translatesAutoresizingMaskIntoConstraints = false
        labelResultado.textColor = .white
        labelResultado.font = UIFont.boldSystemFont(ofSize: 60)
        labelResultado.text = "Gasolina"
        return labelResultado
    }()
    
    lazy var rodapeResultadoImageView: UIImageView = {
        let rodapeResultado = UIImageView()
        rodapeResultado.translatesAutoresizingMaskIntoConstraints = false
        rodapeResultado.image = UIImage(named: "rodape")
        rodapeResultado.contentMode = .scaleAspectFit
        return rodapeResultado
    }()
    
    lazy var gasolinaOuAlcoolResultadoLabel: UILabel = {
        let gasolinaOuAlcoolLabel = UILabel()
        gasolinaOuAlcoolLabel.translatesAutoresizingMaskIntoConstraints = false
        gasolinaOuAlcoolLabel.textColor = .white
        gasolinaOuAlcoolLabel.font = UIFont.systemFont(ofSize: 25)
        gasolinaOuAlcoolLabel.text = "Gasolina ou Álcool?"
        return gasolinaOuAlcoolLabel
    }()
    
    lazy var calularNovameneteResultadoButton: UIButton = {
        let calcularNovamenteButton = UIButton()
        calcularNovamenteButton.translatesAutoresizingMaskIntoConstraints = false
        calcularNovamenteButton.setTitle("Calcular novamente", for: .normal)
        calcularNovamenteButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        calcularNovamenteButton.setTitleColor(.white, for: .normal)
        calcularNovamenteButton.clipsToBounds = true
        calcularNovamenteButton.layer.cornerRadius = 8
        calcularNovamenteButton.backgroundColor = UIColor(red: 239/255, green: 95/255, blue: 0/255, alpha: 1.0)
        calcularNovamenteButton.addTarget(self, action: #selector(tappedCalcularNovamenteButton), for: .touchUpInside)
        return calcularNovamenteButton
    }()
    
    lazy var voltarResultadoButton: UIButton = {
        let voltarButton = UIButton()
        voltarButton.translatesAutoresizingMaskIntoConstraints = false
        voltarButton.setImage(UIImage(named: "voltar"), for: .normal)
        voltarButton.addTarget(self, action: #selector(tappedVoltarResultadoButton), for: .touchUpInside)
        return voltarButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstranits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func tappedCalcularNovamenteButton() {
        delegate?.tappedCalcularNovamenteButton()
    }
    
    @objc func tappedVoltarResultadoButton() {
        delegate?.tappedVoltarResultadoButton()
    }
    
    func addElements() {
        addSubview(fundoResultadoImageView)
        addSubview(logoResultadoImageView)
        addSubview(fraseResultadoLabel)
        addSubview(resultadoLabel)
        addSubview(rodapeResultadoImageView)
        addSubview(gasolinaOuAlcoolResultadoLabel)
        addSubview(calularNovameneteResultadoButton)
        addSubview(voltarResultadoButton)
    }
    
    func configConstranits() {
        NSLayoutConstraint.activate([
            
            fundoResultadoImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoResultadoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoResultadoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoResultadoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rodapeResultadoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 620),
            rodapeResultadoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            rodapeResultadoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoResultadoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130),
            logoResultadoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -560),
            logoResultadoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gasolinaOuAlcoolResultadoLabel.topAnchor.constraint(equalTo: logoResultadoImageView.bottomAnchor, constant: 10),
            gasolinaOuAlcoolResultadoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
             
            fraseResultadoLabel.topAnchor.constraint(equalTo: gasolinaOuAlcoolResultadoLabel.bottomAnchor, constant: 70),
            fraseResultadoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resultadoLabel.topAnchor.constraint(equalTo: fraseResultadoLabel.bottomAnchor, constant: 12),
            resultadoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calularNovameneteResultadoButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -165),
            calularNovameneteResultadoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calularNovameneteResultadoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calularNovameneteResultadoButton.heightAnchor.constraint(equalToConstant: 44 ),
            
            voltarResultadoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            voltarResultadoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            voltarResultadoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350),
            voltarResultadoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -760)
        
        ])
    }
    
}
