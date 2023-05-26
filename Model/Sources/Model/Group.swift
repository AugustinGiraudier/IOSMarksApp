//
//  Group.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Group : Identifiable, Equatable{
    
    // ==========================================
    //      Attributs and Properties
    // ==========================================
    
    public let id : UUID
    public private(set) var name : String
    public private(set) var UEs : [UE] = []
    
    public var average : Float {
        get{
            var sum : Float = 0
            var sumCoef : Float = 0
            for ue in UEs{
                sum += ue.Mark * ue.Coef
                sumCoef += ue.Coef
            }
            return sumCoef > 0 ? sum/sumCoef : 0
        }
    }
    
    // ==========================================
    //      Constructors
    // ==========================================
    
    public init?(withId id : UUID, andName name : String, andUEs UEs : [UE] = []){
        self.id = id
        self.name = name
        
        for ue in UEs{
            if(!addUE(UEToAdd: ue)){
                return nil
            }
        }
    }
    
    public init?(withName name : String, andUEs UEs : [UE] = []){
        self.init(withId: UUID(), andName: name, andUEs: UEs)
    }
    
    // ==========================================
    //      Methods
    // ==========================================
    
    public mutating func addUE(UEToAdd ue : UE) -> Bool {
        guard(UEs.allSatisfy { $0.id != ue.id }) else {return false}
        
        UEs.append(ue)
        return true
    }
    
    public mutating func removeUE(UEToRemove ue : UE){
        UEs.removeAll{$0 == ue}
    }
    
    // ==========================================
    //      Equality protocol
    // ==========================================
    
    public static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    }
}
