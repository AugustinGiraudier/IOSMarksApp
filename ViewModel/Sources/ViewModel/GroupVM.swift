//
//  GroupVM.swift
//  App
//
//  Created by etudiant on 30/05/2023.
//

import Foundation
import Model


@available(iOS 13.0, *)
public class GroupVM : BaseVM, Identifiable, Hashable{
    
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
                unsubscribeFromAllUes()
                ues = model.UEs.map { UEVM(withUe: $0) }
            }
            if average != model.Average {
                average = model.Average
            }
            ModelChanged()
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
    public var ues: [UEVM] = []{
        didSet{
            setUesListeners()
        }
    }
    
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
        ues.first{ $0.id == id }?.subscribe(source: self, callback: {_ in self.updateUes() })
    }
    
    public func removeUe(ue : UE){
        ues.first{ $0.id == id }?.unsubscribe(source: self)
        model.removeUE(UEToRemove: ue)
    }
    
    public static func == (lhs: GroupVM, rhs: GroupVM) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public func updateUes(){
        model.UEs = self.ues.map{ $0.model }
        self.average = model.Average
    }
    
    public func setUesListeners(){
        ues.forEach{ue in
            ue.subscribe(source : self, callback:  {_ in
                self.updateUes()
           })
        }
    }
    
    private func unsubscribeFromAllUes() {
        ues.forEach{ ue in
            ue.unsubscribe(source: self)
        }
    }
}
