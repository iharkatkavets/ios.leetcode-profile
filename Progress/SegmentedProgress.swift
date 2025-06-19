//
//  SegmentedProgress.swift
//  Progress
//
//  Created by Ihar Katkavets on 14/06/2025.
//

import SwiftUI
import CoreGraphics

struct SegmentedProgress: View {
    var easyTotalProgress: Double
    var easyCompletedProgress: Double
    var midTotalProgress: Double
    var midCompletedProgress: Double
    var hardCompletedProgress: Double
    var attemptsCount: Int

    private let totalAngle: CGFloat = 270
    private let absAngle: CGFloat = 270-2*8
    private let linesSpacing: CGFloat = 8
    private let lineWidth: CGFloat = 6

    var body: some View {
        ZStack {
            ZStack {
                easyProgressLine
                midProgressLine
                hardProgressLine
            }
            .rotationEffect(.degrees(90.0+(360.0-totalAngle)/2.0))
            VStack() {
                Spacer()
                Text("\(attemptsCount) Attempting")
                    .font(Font.system(size: 14, weight: .regular))
                    .foregroundStyle(Color(red: 168/255, green: 168/255, blue: 168/255))
            }
            .offset(y: -16)
        }
        .padding(lineWidth/2)
        .aspectRatio(1, contentMode: .fit)
    }
    
    @ViewBuilder
    private var easyProgressLine: some View {
        line(
            .degrees(0),
            .degrees(easyTotalProgress*absAngle),
            easyCompletedProgress,
            Color.easy
        )
    }
    
    @ViewBuilder
    private var midProgressLine: some View {
        line(
            .degrees(easyTotalProgress*absAngle+linesSpacing),
            .degrees(midTotalProgress*absAngle),
            midCompletedProgress,
            Color.mid
        )
    }
    
    @ViewBuilder
    private var hardProgressLine: some View {
        line(
            .degrees((easyTotalProgress+midTotalProgress)*absAngle+2*linesSpacing),
            .degrees((1-easyTotalProgress-midTotalProgress)*absAngle),
            hardCompletedProgress,
            Color.hard
        )
    }
    
    @ViewBuilder
    private func line(_ startAngle: Angle, _ offset: Angle, _ progress: CGFloat, _ color: Color) -> some View {
        ArcLine(
            startAngle: startAngle,
            endAngle: startAngle+offset)
        .stroke(color.opacity(0.3), style: strokeStyle)
        
        ArcLine(
            startAngle: startAngle,
            endAngle: startAngle+offset*progress)
        .stroke(color, style: strokeStyle)
    }

    private var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: lineWidth, lineCap: .round)
    }
    
    private struct ArcLine: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool = false
        
        var animatableData: AnimatablePair<Double, Double> {
            get { AnimatablePair(startAngle.radians, endAngle.radians) }
            set {
                startAngle = .radians(newValue.first)
                endAngle = .radians(newValue.second)
            }
        }

        func path(in rect: CGRect) -> Path {
            var path = Path()

            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2

            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise
            )

            return path
        }
    }
}



#Preview {
    ZStack {
        Color.black
        SegmentedProgress(
            easyTotalProgress: 0.33,
            easyCompletedProgress: 0.1,
            midTotalProgress: 0.33,
            midCompletedProgress: 0.1,
            hardCompletedProgress: 0.1,
            attemptsCount: 4
        )
    }
    .padding(16)
}
