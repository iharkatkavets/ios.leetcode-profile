//
//  Core.swift
//  Progress
//
//  Created by Ihar Katkavets on 15/06/2025.
//

import Foundation

func formattedNumber(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ""
    let result = formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    return result
}
