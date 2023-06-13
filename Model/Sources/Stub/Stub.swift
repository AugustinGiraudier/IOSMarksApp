//
//  Stub.swift
//
//  Created by etudiant on 02/06/2023.
//

import Foundation
import Model
import Data

public struct Stub : IDataManager{
    
    public init(){}
    
    private static let group : Group =
        Group(withName: "Total", andUEs:[
            UE(withName: "UE 1 : Génie Logiciel", andCoef: 6, andSubjects: [
                Subject(withName: "Processus de développement", andMark: 12, andCoef: 4),
                Subject(withName: "Programmation Objets", andMark: 15, andCoef: 9),
                Subject(withName: "Qualité de développpement", andMark: 9, andCoef: 5),
                Subject(withName: "Remise à niveau objets", andMark: 14, andCoef: 4)
            ])!,
        
            UE(withName: "UE 2 : Systèmes et réseaux", andCoef: 6, andSubjects: [
                Subject(withName: "Internet des Objets", andMark: 20, andCoef: 4),
                Subject(withName: "Réseaux", andMark: 10, andCoef: 4),
                Subject(withName: "Services Mobiles", andMark: 7, andCoef: 4),
                Subject(withName: "Système", andMark: 4, andCoef: 5),
            ])!,

            UE(withName: "UE 3 : Insertion Professionnelle", andCoef: 6, andSubjects: [
                Subject(withName: "Anglais", andMark: 11, andCoef: 5),
                Subject(withName: "Economie", andMark: 12, andCoef: 4),
                Subject(withName: "Gestion", andMark: 12, andCoef: 3),
                Subject(withName: "Communication", andMark: 17, andCoef: 4),

            ])!,

            UE(withName: "UE 4 : Technologies Mobiles 1", andCoef: 9, andSubjects: [
                Subject(withName: "Android", andMark: 10, andCoef: 6),
                Subject(withName: "Architecture de projets C# .NET (1)", andMark: 18, andCoef: 5),
                Subject(withName: "C++", andMark: 17, andCoef: 4),
                Subject(withName: "Swift", andMark: 20, andCoef: 5),
            ])!,

            UE(withName: "UE 5 : Technologies Mobiles 2", andCoef: 9, andSubjects: [
                Subject(withName: "Architecture de projets C# .NET (2)", andMark: 12, andCoef: 4),
                Subject(withName: "Client/Serveur", andMark: 4, andCoef: 4),
                Subject(withName: "iOS", andMark: 20, andCoef: 5),
                Subject(withName: "Multiplateformes", andMark: 13, andCoef: 3),
                Subject(withName: "QT Quick", andMark: 14, andCoef: 5),
                Subject(withName: "Xamarin", andMark: 8, andCoef: 5),
            ])!,

            UE(withName: "UE 6 : Projet", andCoef: 9, andSubjects: [
                Subject(withName: "Projet", andMark: 12, andCoef: 1)
            ])!,

            UE(withName: "UE 7 : Stage ", andCoef: 15, andSubjects: [
                Subject(withName: "Stage", andMark: 15, andCoef: 1)
            ])!
        ])!
    
    public func getAllUes() -> [UE]{
        return Stub.group.UEs
    }
    
    public func getOneUe() -> UE{
        return Stub.group.UEs[0]
    }
    
    public func getGroups() -> [Model.Group] {
        return [Stub.group, Group(withName: "Projet/Stage", andUEs: [Stub.group.UEs[5],Stub.group.UEs[6]])!]
    }
    
    public func getOneGroup() -> Group{
        return Stub.group
    }
    
    public func getManySubjects() -> [Subject]{
        return getOneUe().subjects
    }
    
    public func getOneSubject() -> Subject{
        return getManySubjects()[0]
    }
    
    public func saveGroups(groups: [Model.Group]) {
        
    }
    
}
