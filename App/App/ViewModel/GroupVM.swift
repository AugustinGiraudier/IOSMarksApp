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
    
    @Published var model: Group{
        didSet{
            if name != model.Name {
                name = model.Name
            }
            if uesEqualsModel() {
                ues = model.UEs.map { UEVM(withUe: $0) }
            }
            ModelChanged()
        }
    }
    
    public var id: UUID { model.id }
    
    @Published
     public var name: String = "" {
         didSet {
             if model.Name != name {
                 model.Name = name
             }
         }
     }
    
    @Published
    public var ues: [UEVM] = []
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withGrp grp: Group) {
        self.model = grp
        super.init()
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
}
