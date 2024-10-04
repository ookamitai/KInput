//
//  AnimateCalc.swift
//  KInput
//
//  Created by ookamitai on 10/4/24.
//

import Foundation

class AnimateCalc {
    private static func sigmoid(x: Double) -> Double {
        return 1 / (1 + expl(-x))
    }
    
    private static func summation(input: [Double]) -> Double {
        var sum: Double = 0
        for i in input {
            sum += i
        }
        return sum
    }
    
    static func normalize(input: [Double]) -> [Double] {
        let sum: Double = summation(input: input)
        let unit = 1 / sum;
        var result: [Double] = []
        for i in input {
            result.append(i * unit)
        }
        return result
    }
    
    static func generate(neighbor: Double, splits: Int) -> [Double] {
        let from = -neighbor
        let to = neighbor
        let step = (to - from) / Double(splits)
        var result: [Double] = []
        for i in 0...splits {
            result.append(sigmoid(x: from + step * Double(i)))
        }
        return normalize(input: result)
    }
}
