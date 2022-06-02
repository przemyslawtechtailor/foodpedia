//
//  FoodItemScene.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//
import SwiftUI

// Simple arhitecture and data flow for simple applications in SwiftUI 

struct FoodItemsScene: View {
    @StateObject var interactor: FoodItemSceneInteractor
    @ObservedObject var router = DependencyContainer.instance.router

    var body: some View {
        ZStack {
            contentView()
            if interactor.showShakeInstruction {
                ShakeToBeginView()
            }
            if let errorMessage = interactor.errorMessage {
                ErrorView(message: errorMessage) {
                    interactor.retryLoadingData()
                } closeCallback: {
                    interactor.cancelRetry()
                }
            }

        }.sheet(isPresented: $router.isDetailsPageActive) {
            debugPrint("More info dismissed")
        } content: {
            // TODO: try to experiment with reducer like approach, to not pass parameter here.
            // Trigger navigation form interactor by setting params requred by details screen in router
            router.createFoodItemDetails(foodItem: interactor.loadedItem!)
        }
        .onShake {
            interactor.shakeDetected()
        }
        .task {
            // TODO: Temp
//            interactor.shakeDetected()
        }
    }

    @ViewBuilder
    func contentView() -> some View {
        VStack(alignment: .center) {
            CircleInfo(
                foodName: interactor.foodName,
                calories: interactor.calories,
                isInLoadingState: $interactor.isLoading
            )
            .padding(.bottom, 35)

            HStack {
                Design.Legend(title: "CARBS", value: interactor.carbsValueText)
                Design.Legend(title: "PROTEIN", value: interactor.proteinValueText)
                Design.Legend(title: "FAT", value: interactor.fatValueText)
            }
            .padding(.bottom, 90)

            Button {
                interactor.openDetails()
            } label: {
                Design.CustomButton(text: "MORE INFO", isDisabled: $interactor.isMoreButtonDisabled)
            }
        }
    }
}

struct FoodItemScene_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemsScene(interactor: FoodItemSceneInteractor())
    }
}
