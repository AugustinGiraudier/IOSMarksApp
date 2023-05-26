//
//  UE.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct UE : Identifiable, Equatable, Markable, Averagable{
    
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
    
    public private(set) var subjects : [Subject] = []
    
    public var MarkableList: [Markable]{
        get{subjects}
    }
    
    // ==========================================
    //      Constructors
    // ==========================================
    
    public init?(withId id : UUID, andName name : String, andMark mark : Float, andCoef coef : Float, andSubjects subjects : [Subject] = []){
        
        self.id = id
        self.name = name
        self.mark = mark
        self.coef = coef
        
        for sub in subjects{
            if(!addSubject(subjectToAdd: sub)){
                return nil
            }
        }
    }
    
    public init?(withName name : String, andMark mark : Float, andCoef coef : Float, andSubjects subjects : [Subject] = []){
        self.init(withId: UUID(), andName: name, andMark: mark, andCoef: coef, andSubjects: subjects)
    }
    
    // ==========================================
    //      Methods
    // ==========================================
    
    public mutating func addSubject(subjectToAdd sub : Subject) -> Bool {
        guard(subjects.allSatisfy { $0.id != sub.id }) else {return false}
        
        subjects.append(sub)
        return true
    }
    
    public mutating func removeSubject(subjectToRemove sub : Subject){
        subjects.removeAll{$0 == sub}
    }
    
    // ==========================================
    //      Equality protocol
    // ==========================================
    
    public static func == (lhs: UE, rhs: UE) -> Bool {
        return lhs.id == rhs.id
    }
    
}
