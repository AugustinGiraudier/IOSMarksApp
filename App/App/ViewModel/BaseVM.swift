//
//  BaseVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//


import Foundation

public class BaseVM: ObservableObject {
    private var updatedCallback: [(BaseVM) -> ()] = []
    
    public func addUpdatedCallback(callback: @escaping (BaseVM) -> ()) {
        updatedCallback.append(callback)
    }
    
    public func ModelChanged() {
        updatedCallback.forEach { $0(self) }
    }
}
