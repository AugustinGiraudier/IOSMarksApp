//
//  GroupsVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//

import Foundation
import Model

@available(iOS 13.0, *)
public class GroupsVM : BaseVM{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    public private(set) var model : [Group]{
        didSet{
            groups = model.map { GroupVM(withGrp: $0)}
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
    }
    
    public func updateWithUesVM(uesVM : UEsVM){
        // get uesVM references :
        model.forEach{mod in
            if let grpvm = groups.first(where: {grp in grp.id == mod.id}){
                grpvm.ues = uesVM.getUEsVM(ues: mod.UEs)
            }
        }
    }
    
    public func reload(withGroups groups : [Group]){
        model = groups
    }
}
