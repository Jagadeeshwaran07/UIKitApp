//
//  ViewController.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 28/07/25.
//

import UIKit

class PeopleViewController: UIViewController {

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
    
    private lazy var personContainerView: UIView = {
        
        var vw = UIView()
        vw.layer.cornerRadius = 11
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        return vw
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hiiiii")
        setup()
    }

}

private extension PeopleViewController {
    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(personContainerView)
        
        personContainerView.addSubview(personStackView)
        personStackView.addArrangedSubview(nameLbl)
        personStackView.addArrangedSubview(emailLbl)
        personStackView.addArrangedSubview(subscribeBtn  )
                
        NSLayoutConstraint.activate([
            personContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            personStackView.topAnchor.constraint(equalTo: personContainerView.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: personContainerView.bottomAnchor,constant: -8),
            personStackView.trailingAnchor.constraint(equalTo: personContainerView.trailingAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: personContainerView.leadingAnchor, constant: 8)
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("Subscribed")
    }
}

