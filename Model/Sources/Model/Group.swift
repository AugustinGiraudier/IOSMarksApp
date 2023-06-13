//
//  Group.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Group : Identifiable, Equatable, Averagable, Codable{
    
    // ==========================================
    //      Attributs and Properties
    // ==========================================
    
    public let id : UUID
    
    private var name : String
    public var Name : String{
        get{name}
        set{
            guard !newValue.isEmpty else {return}
            name = newValue
        }
    }
    
    public var UEs : [UE] = []
    
    public var MarkableList: [Markable]{
        get{UEs}
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
    
    public mutating func addUE(UEToAdd ue : UE?) -> Bool {
        guard let ue = ue else{return false}
        guard(UEs.allSatisfy { $0.id != ue.id }) else {return false}
        
        UEs.append(ue)
        return true
    }
    
    public mutating func removeUE(UEToRemove ue : UE){
        UEs.removeAll{$0 == ue}
    }
    
    public mutating func clearUEs(){
        UEs = []
    }
    
    // ==========================================
    //      Equality protocol
    // ==========================================
    
    public static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    }
}
