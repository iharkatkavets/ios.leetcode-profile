//
//  LeetCodeCard.swift
//  Progress
//
//  Created by Ihar Katkavets on 19/06/2025.
//

import SwiftUI

struct LeetCodeCard: View {
    let attemptsCount: Int
    let easySolved: Double
    let easyTotal: Int
    let midSolved: Double
    let midTotal: Int
    let hardSolved: Double
    let hardTotal: Int

    var body: some View {
        HStack {
            Spacer()
            ZStack() {
                let easyTotalProgress = (Double(easyTotal)/Double(easyTotal+midTotal+hardTotal))
                let easyCompletedProgress = (Double(easySolved)/Double(easyTotal))
                let midTotalProgress = (Double(midTotal)/Double(easyTotal+midTotal+hardTotal))
                let midCompletedProgress = (Double(midSolved)/Double(midTotal))
                let hardCompletedProgress = (Double(hardSolved)/Double(hardTotal))
                
                SegmentedProgress(
                    easyTotalProgress: easyTotalProgress,
                    easyCompletedProgress: easyCompletedProgress,
                    midTotalProgress: midTotalProgress,
                    midCompletedProgress: midCompletedProgress,
                    hardCompletedProgress: hardCompletedProgress,
                    attemptsCount: attemptsCount
                )
                
                ProgressSummaryView(
                    solvedCount: Int(easySolved+midSolved+hardSolved),
                    totalCount: easyTotal+midTotal+hardTotal
                )
            }
            .frame(width: 160, height: 160)
            .offset(y: 8)
            
            Spacer()
            buttons
        }
        .padding(16)
        .background(Color(UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private var buttons: some View {
        VStack {
            button("Easy", Color.easy, easySolved, easyTotal)
            button("Med.", Color.mid, midSolved, midTotal)
            button("Hard", Color.hard, hardSolved, hardTotal)
        }
    }
    
    private func button(_ title: String, _ color: Color, _ completed: Double, _ total: Int) -> some View {
        Button(action: {}) {
            VStack {
                Text(title)
                    .font(Font.system(size: 14, weight: .medium))
                    .foregroundStyle(color)
                Text("\(formattedNumber(Int(completed)))/\(formattedNumber(Int(total)))")
                    .font(Font.system(size: 14, weight: .medium))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width: 90)
            .padding(.vertical, 8)
            .background(Color(UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
