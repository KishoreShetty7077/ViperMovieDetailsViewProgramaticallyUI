//
//  Router.swift
//  MovieDetailsViewProgramaticallyUI
//
//  Created by Kishore B on 10/30/24.
//

import Foundation
import UIKit

class FruitListRouter: FruitListRouterProtocol {
    
    static func createModule() -> UIViewController {
        // Instantiate VIPER components
        let view = ViewController()
        let presenter: FruitListPresenterProtocol & FruitListOutputInteractorProtocol = FruitListPresenter()
        let interactor: FruitListInputInteractorProtocol = FruitListInteractor()
        let router = FruitListRouter()

        // Connect VIPER components
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}

