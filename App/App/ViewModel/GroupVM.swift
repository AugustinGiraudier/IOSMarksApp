//
//  GroupVM.swift
//  App
//
//  Created by etudiant on 30/05/2023.
//

import Foundation
import Model

public class GroupVM : BaseVM, Identifiable, Equatable{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    @Published
    var model: Group{
        didSet{
            if name != model.Name {
                name = model.Name
            }
            if !uesEqualsModel() {
                ues = model.UEs.map { UEVM(withUe: $0) }
            }
            if average != model.Average {
                average = model.Average
            }
            ModelChanged()
            print("3")
            
            print(Unmanaged.passUnretained(self).toOpaque())
        }
    }
    
    public var id: UUID { model.id }
    
    @Published
     public var name: String = "No Name" {
         didSet {
             if model.Name != name {
                 model.Name = name
             }
         }
     }
    
    @Published
    public var ues: [UEVM] = []
    
    @Published
    public private(set) var average: Float = 0
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withGrp grp: Group) {
        self.model = grp
        super.init()
        defer{model = grp}
    }
    
    // ============================================== //
    //          Methods
    // ============================================== //
    
    private func uesEqualsModel() -> Bool {
        return model.UEs.count == ues.count
        && model.UEs.allSatisfy({ ue in
            ues.contains { ueVM in
                ueVM.model == ue
            }
        })
    }
    
    public func addUe(ue : UE){
        _=model.addUE(UEToAdd: ue)
    }
    
    public func removeUe(ue : UE){
        model.removeUE(UEToRemove: ue)
    }
    
    public static func == (lhs: GroupVM, rhs: GroupVM) -> Bool {
        lhs.id == rhs.id
    }
    
    public func updateUes(){
        model.UEs = self.ues.map{ $0.model }
        self.average = model.Average
        ModelChanged()
        print("2")
    }
    
    public func setUesListeners(){
        ues.forEach{ue in
            ue.addUpdatedCallback(callback:  {_ in
                self.updateUes()
           })
        }
        print("1")
    }
}
