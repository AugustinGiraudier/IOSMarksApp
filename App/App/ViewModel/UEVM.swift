//
//  UEVM.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Model

public class UEVM : BaseVM, Equatable{
    
    // ============================================== //
    //          Member data
    // ============================================== //
    
    @Published
    var model: UE{
        didSet{
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
     public var coef: Float = 0 {
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
                model.clearSubjects()
                subjects.forEach{
                    _=model.addSubject(subjectToAdd: $0.model)
                }
            }
        }
    }
     
    @Published
    public private(set) var average: Float = 0
    
    @Published
    public var isEditing: Bool = false

    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withUe ue: UE) {
        self.model = ue
        super.init()
    }
    
    // ============================================== //
    //          Methods
    // ============================================== //
    
    public func onEditing() {
        self.copy = UEVM(withUe: model)
        for courseVM in copy!.subjects {
            courseVM.onEditing()
        }
        isEditing = true
        
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            if let copy = self.copy {
                update(copy: copy)
            }
        }
        self.copy = nil
        isEditing = false
    }

    func update(copy: UEVM) {
        if let copy = self.copy {
            self.name = copy.name
            self.coef = copy.coef
            self.subjects = copy.subjects
        }
    }
    
    private func SubjectsEqualsModel() -> Bool {
        return model.subjects.count == subjects.count
        && self.model.subjects.allSatisfy({ sub in
            self.subjects.contains { subVM in
                subVM.model == sub
            }
        })
    }
    
    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id
    }
    
}

