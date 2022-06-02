//
//  FoodItemDetailsScene.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//

import Combine
import SwiftUI
import SwiftUIPager

// Experiment with incorporating Clean Swift architecture to SwiftUI

struct FoodItemDetailsScene: View {
    @StateObject var presenter: FoodItemDetailsScenePresenter
    var interactor: FoodItemDetailsSceneInteractor

    var body: some View {
        contentView()
            .task {
                interactor.loadData(request: FoodDetailsSceneModels.Pages.Request())
            }
    }

    @ViewBuilder
    func contentView() -> some View {
        if let data = presenter.requestData {
            GeometryReader { geo in
                Pager(page: data.page,
                      data: data.items,
                      id: \.hashValue,
                      content: { viewModel in
                          CardView(
                              title: viewModel.title,
                              subtitle: viewModel.subtitle,
                              progressValue: viewModel.percentage,
                              progressDescription: viewModel.progressBarDescription,
                              colorType: viewModel.colorType
                          )
                      })
                    .preferredItemSize(CGSize(width: geo.size.width - 120, height: geo.size.height))
                    .allowsDragging()
                    .bounces(true)
            }
        }
    }
}
