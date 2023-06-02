//
//  Stub.swift
//  
//  Created by etudiant on 02/06/2023.
//

import Foundation
import Model

public struct Stub{
    
    private let ues : [UE]
    private let blocks : [Group]
    
    public init(){
        
        var ue1 = UE(withName: "UE 1 : Génie Logiciel", andMark: 10, andCoef: 6)!
        _=ue1.addSubject(subjectToAdd: Subject(withName: "Processus de développement", andMark: 10, andCoef: 4))
        _=ue1.addSubject(subjectToAdd: Subject(withName: "Programmation Objets", andMark: 10, andCoef: 9))
        _=ue1.addSubject(subjectToAdd: Subject(withName: "Qualité de développpement", andMark: 10, andCoef: 5))
        _=ue1.addSubject(subjectToAdd: Subject(withName: "Remise à niveau objets", andMark: 10, andCoef: 4))
        
        var ue2 = UE(withName: "UE 2 : Systèmes et réseaux", andMark: 10, andCoef: 6)!
        _=ue2.addSubject(subjectToAdd: Subject(withName: "Internet des Objets", andMark: 10, andCoef: 4))
        _=ue2.addSubject(subjectToAdd: Subject(withName: "Réseaux", andMark: 10, andCoef: 4))
        _=ue2.addSubject(subjectToAdd: Subject(withName: "Services Mobiles", andMark: 10, andCoef: 4))
        _=ue2.addSubject(subjectToAdd: Subject(withName: "Système", andMark: 10, andCoef: 5))
        
        var ue3 = UE(withName: "UE 3 : Insertion Professionnelle", andMark: 10, andCoef: 6)!
        _=ue3.addSubject(subjectToAdd: Subject(withName: "Anglais", andMark: 10, andCoef: 5))
        _=ue3.addSubject(subjectToAdd: Subject(withName: "Economie", andMark: 10, andCoef: 4))
        _=ue3.addSubject(subjectToAdd: Subject(withName: "Gestion", andMark: 10, andCoef: 3))
        _=ue3.addSubject(subjectToAdd: Subject(withName: "Communication", andMark: 10, andCoef: 4))
        
        var ue4 = UE(withName: "UE 4 : Technologies Mobiles 1", andMark: 10, andCoef: 9)!
        _=ue4.addSubject(subjectToAdd: Subject(withName: "Android", andMark: 10, andCoef: 6))
        _=ue4.addSubject(subjectToAdd: Subject(withName: "Architecture de projets C# .NET (1)", andMark: 10, andCoef: 5))
        _=ue4.addSubject(subjectToAdd: Subject(withName: "C++", andMark: 10, andCoef: 4))
        _=ue4.addSubject(subjectToAdd: Subject(withName: "Swift", andMark: 10, andCoef: 5))
        
        var ue5 = UE(withName: "UE 5 : Technologies Mobiles 2", andMark: 10, andCoef: 9)!
        _=ue5.addSubject(subjectToAdd: Subject(withName: "Architecture de projets C# .NET (2)", andMark: 10, andCoef: 4))
        _=ue5.addSubject(subjectToAdd: Subject(withName: "Client/Serveur", andMark: 10, andCoef: 4))
        _=ue5.addSubject(subjectToAdd: Subject(withName: "iOS", andMark: 10, andCoef: 5))
        _=ue5.addSubject(subjectToAdd: Subject(withName: "Multiplateformes", andMark: 10, andCoef: 3))
        _=ue5.addSubject(subjectToAdd: Subject(withName: "QT Quick", andMark: 10, andCoef: 5))
        _=ue5.addSubject(subjectToAdd: Subject(withName: "Xamarin", andMark: 10, andCoef: 5))
        
        var ue6 = UE(withName: "UE 6 : Projet", andMark: 10, andCoef: 9)!
        _=ue6.addSubject(subjectToAdd: Subject(withName: "Projet", andMark: 10, andCoef: 1))
        
        var ue7 = UE(withName: "UE 7 : Stage ", andMark: 10, andCoef: 15)!
        _=ue7.addSubject(subjectToAdd: Subject(withName: "Stage", andMark: 10, andCoef: 1))
        
        ues = [ue1, ue2, ue3, ue4, ue5, ue6, ue7]
        
        blocks = [
            Group(withName: "Total", andUEs: ues)!,
            Group(withName: "Projet/Stage", andUEs: [ue6, ue7])!
        ]
    }
    
    
    public func getAllUes() -> [UE]{
        return ues
    }
    
    public func getOneUe() -> UE{
        return ues[0]
    }
    
    public func getAllGroups() -> [Group]{
        return blocks
    }
    
    public func getOneGroup() -> Group{
        return blocks[0]
    }
    
    public func getManySubjects() -> [Subject]{
        return getOneUe().subjects
    }
    
    public func getOneSubject() -> Subject{
        return getManySubjects()[0]
    }
    
}
