//
//  CSVParsable.swift
//  FileCache
//
//  Created by Дмитрий Корчагин on 7/8/24.
//

import Foundation

public protocol CSVParsable {
    var csv: String { get }
    static func parse(csv: String) -> Self?
}

extension CSVParsable {
    public static func buildCSV(@CSVBuilder build: () -> String) -> String { build() }
}
