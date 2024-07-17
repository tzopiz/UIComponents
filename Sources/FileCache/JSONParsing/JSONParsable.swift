//
//  JSONParsable.swift
//  FileCache
//
//  Created by Дмитрий Корчагин on 7/8/24.
//

import Foundation
import CocoaLumberjackSwift

public typealias JSONDictionary = [String: Any]
public protocol JSONParsable {
    associatedtype JSONType
    var json: JSONType { get }
    
    static func parse(json: JSONType) -> Self?
}

extension JSONParsable {
    public static func buildJSONDictionary(@JSONBuilder build: () -> JSONDictionary) -> JSONDictionary { build() }

    public var jsonString: String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
            DDLogError("Failed to serialize JSON data for \(self)")
            return nil
        }
        
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            DDLogError("Failed to convert JSON data to string for \(self)")
            return nil
        }
        
        return jsonString
    }
    
    /// Converts a JSON string to an object.
    /// - Parameter jsonString: JSON string.
    /// - Returns: Returns an object created from a JSON string, or nil if the conversion failed.
    public static func from(jsonString: String) -> Self? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            DDLogError("Failed to convert string to data: \(jsonString)")
            return nil
        }
        
        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData),
              let json = jsonObject as? JSONType else {
            DDLogError("Failed to deserialize JSON data from string: \(jsonString)")
            return nil
        }
        
        guard let object = parse(json: json) else {
            DDLogError("Failed to parse JSON object: \(json)")
            return nil
        }
        
        return object
    }
}
