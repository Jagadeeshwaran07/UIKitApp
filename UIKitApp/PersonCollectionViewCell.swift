//
//  PersonCollectionViewCell.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 29/07/25.
//

import UIKit
 
protocol PersonCollectionViewCellDelegate: AnyObject {
    func didTapSubscribed()
}

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var vw: PersonVIew?
    
    weak var delegate: PersonCollectionViewCellDelegate?
    
    var item: PersonResponse? {
        didSet {
            guard let firstName = item?.firstName,
                    let lastName = item?.lastName,
                    let email = item?.email  else { return }
            vw?.set(name: "\(firstName) \(lastName)", email: email)
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PersonCollectionViewCell {
    
    func setup() {
        
        guard vw == nil else { return }
        
        vw = PersonVIew { [weak self] in
            self?.delegate?.didTapSubscribed()
        }
        
        self.contentView.addSubview(vw!)
        
        NSLayoutConstraint.activate([
        
            vw!.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            vw!.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            vw!.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            vw!.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
                 
        ])
        
        
    }
}
