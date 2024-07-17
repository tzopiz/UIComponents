//
//  JSONBuilder.swift
//  FileCache
//
//  Created by Дмитрий Корчагин on 6/17/24.
//

import Foundation

@resultBuilder
public struct JSONBuilder {
    public static func buildBlock(_ components: JSONDictionary...) -> JSONDictionary {
        components.reduce(into: JSONDictionary()) { result, dictionary in
            for (key, value) in dictionary {
                result[key] = value
            }
        }
    }
    
    public static func buildExpression(_ expression: (key: String, value: String)) -> JSONDictionary {
        return [expression.key: expression.value]
    }
    
    public static func buildExpression(_ expression: (key: String, value: String?)) -> JSONDictionary {
        if let str = expression.value {
            return [expression.key: str]
        } else {
            return [:]
        }
    }
    
    public static func buildExpression(_ expression: (key: String, value: Date?)) -> JSONDictionary {
        guard let value = expression.value?.timeIntervalSince1970 else {
            return [:]
        }
        return [expression.key: value]
    }
    
    public static func buildExpression(_ expression: (key: String, value: Bool)) -> JSONDictionary {
        return [expression.key: expression.value]
    }
}
