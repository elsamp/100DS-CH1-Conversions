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

struct Convertor {
    
    static func convert(_ startingValue: Double, startingUnit: Unit, to convertedValue: Double, convertedUnit: Unit) -> Double {
        
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
            fallthrough
        case .miles:
            fallthrough
        case .feet:
            fallthrough
        case .yards:
            break
        }
        
        return 0.0
    }
    
    private static func metersTo(_ number: Double, unit: Unit) -> Double{
        switch unit {
        case .meters:
            return number
        case .kilometers:
            fallthrough
        case .miles:
            fallthrough
        case .feet:
            fallthrough
        case .yards:
            break
        }
        
        return 0.0
    }
}
