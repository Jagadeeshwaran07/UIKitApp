//
//  ViewController.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 28/07/25.
//

import UIKit
import SafariServices

class PeopleViewController: UIViewController {
    
    private let vm = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height:120)
        
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        vw.dataSource = self
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome to my UIKit App")
        setup()
        vm.delegate = self
        vm.getUsers()
    }
}

extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = vm.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        
        cell.delegate = self
        cell.item = item
        return cell

    }
    
}

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func didTapSubscribed() {
        let url = URL(string: "https://www.youtube.com/@SkyNews")!
        let vc = SFSafariViewController(url: url)
        
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        cv.reloadData()
    }
    
    func didFail(error: any Error) {
        print(error)
    }
}

private extension PeopleViewController {
    func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "People"
        
        self.view.backgroundColor = .white
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

