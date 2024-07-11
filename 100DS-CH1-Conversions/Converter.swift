//
//  Convertor.swift
//  100DS-CH1-Conversions
//
//  Created by Erica Sampson on 2024-07-11.
//

import Foundation

enum Unit {
    case kilometers
    case meters
    case miles
    case feet
    case yards
}

enum UnitError: Error {
    case unsupportedUnit
}

struct Converter {
    
    static func unitFor(string: String) throws -> Unit {
        
        let cleanString = string.lowercased().trimmingCharacters(in: .whitespaces)
        
        switch cleanString {
        case "meters":
            return .meters
        case "kilometers":
            return .kilometers
        case "miles":
            return .miles
        case "feet":
            return .feet
        case "yards":
            return .yards
        default:
            throw UnitError.unsupportedUnit
        }
        
    }
    
    static func convert(_ startingValue: Double, startingUnit: Unit, to convertedUnit: Unit) -> Double {
        
        let valueInMeters: Double
        
        switch startingUnit {
        case .meters:
            valueInMeters = startingValue
        case .kilometers:
            fallthrough
        case .miles:
            fallthrough
        case .feet:
            fallthrough
        case .yards:
            valueInMeters = toMeters(startingValue, unit: startingUnit)
        }
        
        return metersTo(valueInMeters, unit: convertedUnit)
    }
    
    private static func toMeters(_ number: Double, unit: Unit) -> Double{
        
        switch unit {
        case .meters:
            return number
        case .kilometers:
            return number * 1000
        case .miles:
            return number * 1_609.344
        case .feet:
            return number / 3.28084
        case .yards:
            return number / 1.0936
        }
        
    }
    
    private static func metersTo(_ number: Double, unit: Unit) -> Double{
        
        switch unit {
        case .meters:
            return number
        case .kilometers:
            return number / 1000
        case .miles:
            return number / 1_609.344
        case .feet:
            return number * 3.28084
        case .yards:
            return number * 1.0936
        }

    }
    
}
