//
//  FoodItemSceneInteractor.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Combine
import SwiftUI

class FoodItemSceneInteractor: ObservableObject {
    @Published var showShakeInstruction: Bool = true
    @Published var isLoading: Bool = false
    @Published var isMoreButtonDisabled: Bool = true
    @Published var errorMessage: String? = nil

    @Published var foodName: String = ""
    @Published var calories: String = ""

    @Published var carbsValueText: String = ""
    @Published var proteinValueText: String = ""
    @Published var fatValueText: String = ""
    
    var loadedItem: FoodDetails.Item?

    private let router: Router
    private let foodDetailsUseCase: FoodDetailsUseCase

    var cancellable = Set<AnyCancellable>()

    init(conatiner: DependencyContainer = DependencyContainer.instance) {
        router = conatiner.router
        foodDetailsUseCase = conatiner.foodDetailsUseCase
    }

    func loadData() {
        withAnimation {
            isLoading = true
            resetUIToCleanState()
        }

        foodDetailsUseCase.requestRandomFoodItem()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self = self else { return }
                withAnimation {
                    self.isLoading = false
                }
                switch result {
                case .finished:
                    break
                case let .failure(error):
                    withAnimation {
                        self.errorMessage = error.localizedDescription
                    }
                }
            } receiveValue: { [weak self] item in
                self?.loadedItem = item
                withAnimation {
                    self?.displayFoodDetails(item)
                }
            }.store(in: &cancellable)
    }

    func shakeDetected() {
        if isLoading { return }
        withAnimation {
            showShakeInstruction = false
            loadData()
        }
    }

    func displayFoodDetails(_ item: FoodDetails.Item) {
        foodName = item.title
        calories = "\(formatPercentage(item.calories))"

        carbsValueText = "\(formatPercentage(item.carbs))%"
        proteinValueText = "\(formatPercentage(item.protein))%"
        fatValueText = "\(formatPercentage(item.fat))%"

        isMoreButtonDisabled = false
    }

    func resetUIToCleanState() {
        foodName = ""
        calories = ""

        carbsValueText = "-"
        proteinValueText = "-"
        fatValueText = "-"

        isMoreButtonDisabled = true
    }

    func openDetails() {
        if !isMoreButtonDisabled {
            router.isDetailsPageActive.toggle()
        }
    }

    func cancelRetry() {
        showShakeInstruction = true
        withAnimation {
            errorMessage = nil
        }
    }

    func retryLoadingData() {
        withAnimation {
            errorMessage = nil
        }
        // since loading items is random, i'd be better to not store state of item that errored out, and try new one
        loadData()
    }
    
    func formatPercentage(_ value: Float) -> Int {
        // TODO: Either move data transformation to use case or create use case for formatting
        return Int(value)
    }
}
