//
//  UEsVM.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//

import Foundation
import Model

public class UEsVM : BaseVM{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    public private(set) var model : [UE] {
        didSet{
            ues = model.map { UEVM(withUe: $0) }
            ModelChanged()
        }
    }
    
    @Published
    public var ues: [UEVM] = []
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withUes ues : [UE]) {
        self.model = ues
        super.init()
    }
    
    // ============================================== //
    //          Methods
    // ============================================== //
    
    public func getUEsVM(ues : [UE]) -> [UEVM]{
        var toReturn : [UEVM] = []
        self.ues.forEach{ ue in
            if ues.contains(where: {extUe in ue.id == extUe.id}){
                toReturn.append(ue)
            }
        }
        return toReturn
    }
}
