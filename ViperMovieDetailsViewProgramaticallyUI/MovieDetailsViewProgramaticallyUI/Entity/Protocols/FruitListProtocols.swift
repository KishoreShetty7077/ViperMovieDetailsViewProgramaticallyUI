//
//  FruitListProtocols.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

// MARK: - View Protocol
protocol FruitListViewProtocol: AnyObject {
    func displayCarouselImages(_ images: [CarouselImage])
    func displayHorizontalImages(_ images: [HorizontalImage])
}

// MARK: - Presenter Protocol
protocol FruitListPresenterProtocol: AnyObject {
    var view: FruitListViewProtocol? { get set }
    var interactor: FruitListInputInteractorProtocol? { get set }
    var router: FruitListRouterProtocol? { get set }
    func viewDidLoad()
}

// MARK: - Interactor Protocols
protocol FruitListInputInteractorProtocol: AnyObject {
    var presenter: FruitListOutputInteractorProtocol? { get set }
    func fetchFruitList()
}

protocol FruitListOutputInteractorProtocol: AnyObject {
    func didFetchFruitList(_ images: [CarouselImage])
}

// MARK: - Router Protocol
protocol FruitListRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
