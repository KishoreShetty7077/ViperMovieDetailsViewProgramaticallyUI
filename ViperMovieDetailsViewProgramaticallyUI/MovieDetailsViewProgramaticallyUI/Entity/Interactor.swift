//
//  Interactor.swift
//  MovieDetailsViewProgramaticallyUI
//
//  Created by Kishore B on 10/30/24.
//

import Foundation
import UIKit


class FruitListInteractor: FruitListInputInteractorProtocol {
    
    weak var presenter: FruitListOutputInteractorProtocol?

    func fetchFruitList() {
        let images = [
            CarouselImage(image: "icons8"),
            CarouselImage(image: "icons8"),
            CarouselImage(image: "icons8")
        ]
        presenter?.didFetchFruitList(images)
    }
}
