//
//  GroupVM.swift
//  App
//
//  Created by etudiant on 30/05/2023.
//

import Foundation
import Model

extension Group{
    
    struct Data : Identifiable{
        public let id : UUID
        public var name : String
        public var someUEs: [UE.Data] = []
    }
    
    var data: Data {
        Data(id: self.id,
             name: self.Name,
             someUEs: self.UEs.map { $0.data })
    }
    
    mutating func update(from data: Data) {
        guard self.id == data.id else {return}
        
        self.Name = data.name
        
        self.clearUEs()
        for ue in data.someUEs{
            _ = self.addUE(UEToAdd: UE(withId: ue.id ,andName: ue.name, andMark: ue.mark, andCoef: ue.coef))
        }
    }
}

public class GroupVM : ObservableObject{
    
    
    @Published var original: Group
    @Published var model: Group.Data
    
    public init(withGrp grp: Group) {
        self.original = grp
        self.model = grp.data
    }
    
    public convenience init() {
        self.init(withGrp: Group(withName: "New Group")!)
    }
}
