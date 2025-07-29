//
//  PeopleViewModel.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 29/07/25.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject{
    func didFinish()
    func didFail(error: Error)
}

@MainActor
class PeopleViewModel{
    
    private(set) var people = [PersonResponse]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)

                 let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let response = try jsonDecoder.decode(UserResponse.self, from: data)
                self?.people = response.data
                self?.delegate?.didFinish()
                
            } catch {
                self?.delegate?.didFail(error: error)
                
            }
           
            
        }
    }
}
