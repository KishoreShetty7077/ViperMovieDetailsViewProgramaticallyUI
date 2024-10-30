//
//  Presenter.swift
//  MovieDetailsViewProgramaticallyUI
//
//  Created by Kishore B on 10/30/24.
//

import Foundation

class FruitListPresenter: FruitListPresenterProtocol, FruitListOutputInteractorProtocol {

    weak var view: FruitListViewProtocol?
    var interactor: FruitListInputInteractorProtocol?
    var router: FruitListRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchFruitList()
    }

    // FruitListOutputInteractorProtocol
    func didFetchFruitList(_ images: [CarouselImage]) {
        view?.displayCarouselImages(images)
    }
}
