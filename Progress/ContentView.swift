//
//  ContentView.swift
//  Progress
//
//  Created by Ihar Katkavets on 14/06/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack {
                leetCodeCard
                Spacer()
                controlSliders
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 32)
        }
        .background(.black)
        .onAppear(perform: viewModel.viewDidTriggerOnAppear)
    }
    
    @ViewBuilder
    var leetCodeCard: some View {
        LeetCodeCard(
            attemptsCount: viewModel.attemptsCount,
            easySolved: viewModel.easySolved,
            easyTotal: viewModel.easyTotal,
            midSolved: viewModel.midSolved,
            midTotal: viewModel.midTotal,
            hardSolved: viewModel.hardSolved,
            hardTotal: viewModel.hardTotal
        )
    }
    
    private var controlSliders: some View {
        VStack {
            slider("Easy Solved", $viewModel.easySolved, viewModel.easyTotal,  Color.easy)
            slider("Medium Solved", $viewModel.midSolved, viewModel.midTotal, Color.mid)
            slider("Hard Solved", $viewModel.hardSolved, viewModel.hardTotal, Color.hard)
        }
    }
    
    @ViewBuilder
    private func slider(_ text: String, _ value: Binding<Double>, _  mx: Int, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Slider(value: value, in: 0...Double(mx))
                .tint(color)
        }
    }
}

#Preview {
    ContentView()
}
