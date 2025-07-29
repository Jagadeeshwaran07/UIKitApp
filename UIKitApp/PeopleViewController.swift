//
//  ViewController.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 28/07/25.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var personVw: PersonVIew  = {
        var vw = PersonVIew { [weak self] in
            self?.subscribed()
        }
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome to my UIKit App")
        setup()
    }
}

private extension PeopleViewController {
    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(personVw)
        
        NSLayoutConstraint.activate([
            personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
    }
    
    func subscribed() {
        print("Subscribed")
    }
}

