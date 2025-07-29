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
        config.buttonSize = .large
         
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
        
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
        self.view.addSubview(subscribeBtn)
        
        NSLayoutConstraint.activate([
            subscribeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subscribeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("Subscribed")
    }  
}

