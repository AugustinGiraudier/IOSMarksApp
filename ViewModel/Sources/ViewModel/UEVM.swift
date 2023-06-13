//
//  UEVM.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Model

@available(iOS 13.0, *)
public class UEVM : BaseVM, Identifiable, Hashable{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    @Published
    var model: UE{
        didSet{
            if name != model.Name {
                name = model.Name
            }
            if coef != model.Coef {
                coef = model.Coef
            }
            if !SubjectsEqualsModel() {
                unsubscribeAllSubjects()
                subjects = model.subjects.map { SubjectVM(withSubject: $0) }
                setSubjectsListeners()
            }
            if average != model.Average{
                average = model.Average
            }
            ModelChanged()
        }
    }
    
    @Published
    public var copy: UEVM? = nil

    public var id: UUID { model.id }
    
    @Published
     public var name: String = "" {
         didSet {
             if model.Name != name {
                 model.Name = name
             }
         }
     }
     
     @Published
     public var coef: Int = 0 {
         didSet {
             if model.Coef != coef {
                 model.Coef = coef
             }
         }
     }
    
    @Published
    public var subjects: [SubjectVM] = []
    {
        didSet{
            if !SubjectsEqualsModel(){
                updateSubjects()
            }
        }
    }
     
    @Published
    public var average: Float = 0
    
    @Published
    public var isEditing: Bool = false

    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withUe ue: UE) {
        self.model = ue
        super.init()
        defer{self.model = ue}
    }
    
    // ============================================== //
    //          Methods
    // ============================================== //
    
    public func onEditing() {
        self.copy = UEVM(withUe: model)
        copy!.subjects.forEach { $0.onEditing() }
        isEditing = true
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            update()
        }
        self.copy = nil
        isEditing = false
        objectWillChange.send()
    }

    private func update() {
        if let copy = self.copy {
            self.name = copy.name
            self.coef = copy.coef
            self.subjects = copy.subjects.map { $0.clone() }
            setSubjectsListeners()
        }
    }
    
    private func SubjectsEqualsModel() -> Bool {
        return model.subjects.count == subjects.count
        && model.subjects.allSatisfy({ sub in
            subjects.contains { subVM in
                subVM.model == sub
            }
        })
    }
    
    public func addSubject(subject: Subject){
        _=model.addSubject(subjectToAdd: subject)
        subjects.first{ $0.id == id }?.subscribe(source: self, callback: {_ in self.updateSubjects() })
    }
    
    public func addEmptySubject(){
        addSubject(subject: Subject(withName: "New", andMark: 10, andCoef: 1)!)
    }
    
    public func removeSubject(id: UUID){
        subjects.first{ $0.id == id }?.unsubscribe(source: self)
        model.removeSubject(id: id)
    }
    
    private func setSubjectsListeners(){
        subjects.forEach{sub in
            sub.subscribe(source : self, callback:  {_ in
                self.updateSubjects()
           })
        }
    }
    
    private func unsubscribeAllSubjects(){
        subjects.forEach{ sub in sub.unsubscribe(source: self) }
    }
    
    public func updateSubjects(){
        model.subjects = subjects.map { $0.model }
        average = model.Average
    }
    
    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

