//
//  PersonVIew.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 29/07/25.
//

import UIKit

class PersonVIew: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private lazy var subscribeBtn: UIButton = {
        
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.titleAlignment = .center
        config.cornerStyle = .medium
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .medium
         
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
        
    }()
    
    private lazy var personStackView: UIStackView = {
        var sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    private lazy var nameLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Jack"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "jack@example.com"
        lbl.font = .systemFont(ofSize: 15 , weight: .regular)
        return lbl
    }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonVIew {
    
    func setup(){
        self.layer.cornerRadius = 11
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        
        
        self.addSubview(personStackView)
        personStackView.addArrangedSubview(nameLbl)
        personStackView.addArrangedSubview(emailLbl)
        personStackView.addArrangedSubview(subscribeBtn  )
                
        NSLayoutConstraint.activate([
            
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
         
    
    }  
    
    @objc func didTapSubscribe(sender: UIButton) {
        action()
    }

}
