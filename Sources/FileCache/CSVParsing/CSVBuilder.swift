//
//  JSONBuilder 2.swift
//  DailyDeeds
//
//  Created by Дмитрий Корчагин on 6/17/24.
//

import Foundation

@resultBuilder
public struct CSVBuilder {
    public static func buildBlock(_ components: String...) -> String {
        return components.joined(separator: ",")
    }
    
    public static func buildExpression(_ expression: String) -> String {
        return expression.escapeSpecialCharacters(",")
    }
    
    public static func buildExpression(_ expression: String?) -> String {
        if let str = expression {
            return str.escapeSpecialCharacters(",")
        } else {
            return ""
        }
    }
    
    public static func buildExpression(_ expression: Date?) -> String {
        return expression.toString()
    }
    
    public static func buildExpression(_ expression: Bool) -> String {
        return expression.description
    }
}
