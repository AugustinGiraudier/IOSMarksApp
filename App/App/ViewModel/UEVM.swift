//
//  UEVM.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Model

extension UE{
    
    struct Data : Identifiable{
        public let id : UUID
        public var name : String
        public var mark : Float
        public var coef : Float
        public var someSubjects: [Subject.Data] = []
    }
    
    var data: Data {
        Data(id: self.id,
             name: self.Name,
             mark: self.Mark,
             coef: self.Coef,
             someSubjects: self.subjects.map { $0.data })
    }
    
    mutating func update(from data: Data) {
        guard self.id == data.id else {return}
        
        self.Name = data.name
        self.Mark = data.mark
        self.Coef = data.coef
        
        self.clearSubjects()
        for sub in data.someSubjects{
            _ = self.addSubject(subjectToAdd: Subject(withId: sub.id, andName: sub.name, andMark: sub.mark, andCoef: sub.coef))
        }
    }
}

public class UEVM : ObservableObject{
    
    @Published var original: UE
    @Published var model: UE.Data
    
    public init(withUe ue: UE) {
        self.original = ue
        self.model = ue.data
    }
    
    public convenience init() {
        self.init(withUe: UE(withName: "New Suject", andMark: 10, andCoef: 1)!)
    }
}

