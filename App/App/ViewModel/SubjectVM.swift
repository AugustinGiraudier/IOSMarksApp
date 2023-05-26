//
//  SubjectVM.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Model

extension Subject{
    
    struct Data : Identifiable{
        public let id : UUID
        public var name : String
        public var mark : Float
        public var coef : Float
    }
    
    var data: Data {
        Data(id: self.id, name: Name, mark: Mark, coef: Coef)
    }
    
    mutating func update(from data: Data) {
        guard data.id == self.id else {
            return
        }
        
        self.Name = data.name
        self.Mark = data.mark
        self.Coef = data.coef
    }
}

class SubjectVM: ObservableObject {
 
    var original: Subject
    
    @Published var model: Subject.Data
    @Published var canModify : Bool = false
    
    public init(withSubject subject: Subject) {
        self.original = subject
        self.model = subject.data
    }
    
    public convenience init() {
        self.init(withSubject: Subject(withName: "New Suject", andMark: 10, andCoef: 1)!)
    }
    
}

