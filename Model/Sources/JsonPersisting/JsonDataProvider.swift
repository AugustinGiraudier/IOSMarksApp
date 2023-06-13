//
//  JsonProvider.swift
//  
//
//  Created by augustin giraudier on 13/06/2023.
//

import Foundation
import Model
import Data

public class JsonDataProvider : IDataManager{
    
    public init(){}
    
    public static var FILE_NAME = "UCA_NOTES.data"
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent(JsonDataProvider.FILE_NAME)
    }
    
    
    public func getGroups() -> [Model.Group] {
        do{
            let fileURL = try Self.fileURL()
            
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            return try JSONDecoder().decode([Group].self, from: data)
        }
        catch{
            return []
        }
    }
    
    public func saveGroups(groups: [Group]) {

        do{
            let data = try JSONEncoder().encode(groups)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        catch{
            
        }
    }
    
}
