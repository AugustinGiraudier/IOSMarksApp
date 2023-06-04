//
//  GroupsVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//

import Foundation
import Model

public class GroupsVM : BaseVM{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    public private(set) var model : [Group]
    
    @Published
    public var groups: [GroupVM] = []
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withGroups groups : [Group]) {
        self.model = groups
        self.groups = model.map {GroupVM(withGrp: $0) }
        super.init()
    }
    
    public func updateWithUesVM(uesVM : UEsVM){
        self.groups = []
        // get uesVM references :
        model.forEach{
            let grpvm = GroupVM(withGrp: $0)
            grpvm.ues = uesVM.getUEsVM(ues: $0.UEs)
            self.groups.append(grpvm)
        }
    }
}
