//
//  GroupsVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//

import Foundation
import Model

@available(iOS 13.0, *)
public class GroupsVM : BaseVM, Hashable{
        
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    public private(set) var model : [Group]{
        didSet{
            if !groupsEqualsModel(){
                unscubscribeFromAllGroups()
                groups = model.map { GroupVM(withGrp: $0)}
                subscribeToAllGroups()
            }
            ModelChanged()
        }
    }
    
    @Published
    public var groups: [GroupVM] = []
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withGroups groups : [Group]) {
        self.model = groups
        self.groups = model.map { GroupVM(withGrp: $0) }
        super.init()
        subscribeToAllGroups()
    }
    
    public func updateWithUesVM(uesVM : UEsVM){
        // get uesVM references :
        model.forEach{mod in
            if let grpvm = groups.first(where: {grp in grp.id == mod.id}){
                grpvm.ues = uesVM.getUEsVM(ues: mod.UEs)
            }
        }
    }
    
    private func groupsEqualsModel() -> Bool {
        return model.count == groups.count
        && model.allSatisfy({ grp in
            groups.contains { grpVM in
                grpVM.model == grp
            }
        })
    }
    
    public func reload(withGroups groups : [Group]){
        model = groups
    }
    
    private func onGroupChanged(baseVM : BaseVM){
        if let groupVM = baseVM as? GroupVM{
            if let id = (model.firstIndex { $0.id == groupVM.id }){
                model[id] = groupVM.model
            }
        }
    }
    
    public func subscribeToAllGroups(){
        groups.forEach{ grp in
            grp.subscribe(source: self, callback: onGroupChanged)
        }
    }
    
    public func unscubscribeFromAllGroups(){
        groups.forEach{ grp in
            grp.unsubscribe(source: self)
        }
    }
    
    public static func == (lhs: GroupsVM, rhs: GroupsVM) -> Bool {
        true
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(true)
    }
}
