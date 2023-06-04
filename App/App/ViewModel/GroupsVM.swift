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
    
    public init(withGroups groups : [Group], uesVM : UEsVM) {
        self.model = groups
        // get uesVM references :
        super.init()
        groups.forEach{
            var grpvm = GroupVM(withGrp: $0)
            grpvm.ues = uesVM.getUEsVM(ues: $0.UEs)
            self.groups.append(grpvm)
        }
    }
}
