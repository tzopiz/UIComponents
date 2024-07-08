//
//  FileCache.swift
//  DailyDeeds
//
//  Created by Дмитрий Корчагин on 7/8/24.
//

import Foundation
import CocoaLumberjackSwift

public class FileCache<T: JSONParsable & CSVParsable> {
    public enum FileFormat {
        case json
        case csv
    }
    
    public enum FileError: Error {
        case fileNotFound
        case dataCorrupted
        case parseFailed
        case writeToFileFailed
        case incorrectFileName
        case directoryNotFound
        case loadFromJSONFileFailed
        case loadFromCSVFileFailed
        case fileAlreadyExists
        case unknown
    }
    
    public init() {
        
    }
    
    public func loadFromFile(named fileName: String, format: FileFormat) -> Result<[T], FileError> {
        do {
            let url = try getDocumentsDirectory().appendingPathComponent(fileName)
            guard FileManager.default.fileExists(atPath: url.path) else { return .failure(.fileNotFound) }
            
            let result: Result<[T], FileError>
            switch format {
            case .json: result = loadFromJSONFile(with: url)
            case .csv: result = loadFromCSVFile(with: url)
            }
            return result
        } catch let error as FileError {
            return .failure(error)
        } catch {
            return .failure(.unknown)
        }
    }
    
    private func loadFromJSONFile(with url: URL) -> Result<[T], FileError> {
        do {
            let data = try Data(contentsOf: url)
            guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [JSONDictionary]
            else { return .failure(.dataCorrupted) }
            
            let items = jsonArray.compactMap { T.parse(json: $0) }
            return .success(items)
        } catch {
            DDLogError("Failed to load from JSON file: \(error.localizedDescription)")
            return .failure(.loadFromJSONFileFailed)
        }
    }
    
    private func loadFromCSVFile(with url: URL) -> Result<[T], FileError> {
        do {
            let csvString = try String(contentsOf: url)
            let items = csvString.split(separator: "\n").compactMap { T.parse(csv: String($0)) }
            return .success(items)
        } catch {
            DDLogError("Failed to load from CSV file: \(error.localizedDescription)")
            return .failure(.loadFromCSVFileFailed)
        }
    }
    
    @discardableResult
    public func saveToFile(_ items: [T], named fileName: String, format: FileFormat = .json) -> FileError? {
        do {
            let url = try getDocumentsDirectory().appendingPathComponent(fileName)
            switch format {
            case .json: return saveToJSONFile(with: url, items: items)
            case .csv: return saveToCSVFile(with: url, items: items)
            }
        } catch let error as FileError {
            return error
        } catch {
            return .unknown
        }
    }
    
    private func saveToJSONFile(with url: URL, items: [T]) -> FileError? {
        do {
            let jsonArray = items.map { $0.json }
            let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
            try jsonData.write(to: url)
            return nil
        } catch {
            DDLogError("Failed to save to JSON file: \(error.localizedDescription)")
            return .writeToFileFailed
        }
    }
    
    private func saveToCSVFile(with url: URL, items: [T]) -> FileError? {
        do {
            let csvString = items.map { $0.csv }.joined(separator: "\n")
            try csvString.write(to: url, atomically: true, encoding: .utf8)
            return nil
        } catch {
            DDLogError("Failed to save to CSV file: \(error.localizedDescription)")
            return .writeToFileFailed
        }
    }
    
    private func getDocumentsDirectory() throws -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let first = urls.first else { throw FileError.directoryNotFound }
        return first
    }
}
