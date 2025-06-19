//
//  ContentViewModel.swift
//  Progress
//
//  Created by Ihar Katkavets on 19/06/2025.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var attemptsCount: Int = 4
    @Published var easySolved: Double = 0
    @Published var easyTotal: Int = 882
    @Published var midSolved: Double = 0
    @Published var midTotal: Int = 1861
    @Published var hardSolved: Double = 0
    @Published var hardTotal: Int = 843

    func viewDidTriggerOnAppear() {
        easySolved = 292
        midSolved = 568
        hardSolved = 121
    }
}
