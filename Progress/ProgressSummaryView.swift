//
//  ProgressSummaryView.swift
//  Progress
//
//  Created by Ihar Katkavets on 15/06/2025.
//

import SwiftUI

struct ProgressSummaryView: View {
    let solvedCount: Int
    let totalCount: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                Text("\(formattedNumber(solvedCount))")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white)
                Text("/\(formattedNumber(totalCount))")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundStyle(.white)
            }
            Text("Solved")
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ProgressSummaryView(solvedCount: 980, totalCount: 3586)
    }
}


