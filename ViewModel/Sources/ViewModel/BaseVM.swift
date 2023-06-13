//
//  BaseVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//


import Foundation

@available(iOS 13.0, *)
public class BaseVM: ObservableObject {
    
    private var updatedCallback: [AnyHashable : (BaseVM) -> ()] = [:]
    
    public func subscribe(source: AnyHashable, callback: @escaping (BaseVM) -> ()) {
        updatedCallback[source] = callback
    }
    
    public func unsubscribe(source: AnyHashable) {
        updatedCallback.removeValue(forKey: source)
    }
    
    public func ModelChanged() {
        updatedCallback.forEach { $0.value(self) }
    }
}
