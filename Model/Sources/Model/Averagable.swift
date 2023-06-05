//
//  Averagable.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation


public protocol Averagable{
    
    var MarkableList : [Markable] {get}
    var Average : Float {get}
    
}

extension Averagable{
    
    // fonction de moyenne par défaut
    public var Average : Float {
        get{
            var sum : Float = 0
            var sumCoef : Float = 0
            for markable in MarkableList{
                sum += markable.Mark * Float(markable.Coef)
                sumCoef += Float(markable.Coef)
            }
            return sumCoef > 0 ? sum/sumCoef : 0
        }
    }
    
}
