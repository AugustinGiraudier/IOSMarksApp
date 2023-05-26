//
//  Subject.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation


public struct Subject : Identifiable, Equatable{
    
    // ==========================================
    //      Static members
    // ==========================================
    
    public static let MAX_MARK : Float = 20.0
    
    // ==========================================
    //      Attributs and Properties
    // ==========================================
    
    public let id : UUID
    
    private var name : String
    public var Name : String{
        get {name}
        set{
            guard !newValue.isEmpty else {return}
            name = newValue
        }
    }
    
    private var mark : Float
    public var Mark : Float{
        get {mark}
        set{
            guard newValue>=0 && newValue <= Subject.MAX_MARK else {return}
            mark = newValue
        }
    }
    
    private var coef : Float
    public var Coef : Float{
        get {coef}
        set{
            guard newValue>=0 else {return}
            coef = newValue
        }
    }
    
    // ==========================================
    //      Constructors
    // ==========================================
    
    public init?(withId id:UUID, andName name:String, andMark mark:Float, andCoef coef:Float){
        guard !name.isEmpty && mark >= 0 && mark <= Subject.MAX_MARK && coef > 0 else { return nil }
        
        self.id = id
        self.name = name
        self.mark = mark
        self.coef = coef
        
    }
    
    public init?(withName name:String, andMark mark:Float, andCoef coef:Float){
        self.init(withId: UUID(), andName: name, andMark: mark, andCoef: coef)
    }
    
    // ==========================================
    //      Equality protocol
    // ==========================================
    
    public static func == (lhs: Subject, rhs: Subject) -> Bool {
        return lhs.id == rhs.id
    }
}
