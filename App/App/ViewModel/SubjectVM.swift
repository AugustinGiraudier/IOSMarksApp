//
//  SubjectVM.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import Model

public class SubjectVM: BaseVM, Identifiable, Equatable {
 
    // ============================================== //
    //          Member data
    // ============================================== //
    
    @Published
    var model: Subject{
        didSet{
            if name != model.Name {
                name = model.Name
            }
            if coef != model.Coef {
                coef = model.Coef
            }
            if mark != model.Mark {
                mark = model.Mark
            }
            ModelChanged()
        }
    }
    
    @Published
    public var copy: SubjectVM? = nil

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
     public var mark: Float = 0 {
         didSet {
             if model.Mark != mark {
                 model.Mark = mark
             }
         }
     }

    @Published
    public var isEditing: Bool = false
    
    @Published
    public var canModifyMark : Bool = false
    
    // ============================================== //
    //          Constructors
    // ============================================== //
    
    public init(withSubject subject: Subject) {
        self.model = subject
        super.init()
    }
    
    // ============================================== //
    //          Methods
    // ============================================== //
    
    public func onEditing() {
        self.copy = SubjectVM(withSubject: model)
        isEditing = true
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            update()
        }
        self.copy = nil
        isEditing = false
    }
    
    private func update() {
        if let copy = self.copy {
            name = copy.name
            coef = copy.coef
            mark = copy.mark
        }
    }
    
    public static func == (lhs: SubjectVM, rhs: SubjectVM) -> Bool {
        lhs.id == rhs.id
    }

}

