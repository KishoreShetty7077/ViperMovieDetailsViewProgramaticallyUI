# ViperMovieDetailsViewProgramaticallyUI

VIPER Sample Project
This project demonstrates a simple iOS application that follows the VIPER architecture pattern. The app fetches a list of fruit images and displays them in two collections: a carousel and a horizontal list. This setup includes a modular structure to ensure separation of concerns and testability.

1.Clone the Repository
2.Open the Project --> Open the .xcodeproj file in Xcode:
3. Run the Project on Simulator or Device

# Architecture
This project follows the VIPER architecture to organize the codebase into five main components:

View - Displays the data passed from the Presenter and notifies it of user interactions.
Interactor - Handles the business logic and retrieves data for the Presenter.
Presenter - Acts as a mediator between the View and Interactor, processing data and passing it to the View.
Entity - Defines simple data structures like CarouselImage and HorizontalImage.
Router - Manages navigation between view controllers.
This structure ensures each layer has a single responsibility and improves testability and maintainability.

# VIPER Components
Below is a quick summary of the VIPER components in this project:

1.ViewController (View)
Implements FruitListViewProtocol and displays images in a carousel and horizontal list.
2.FruitListPresenter (Presenter)
Implements FruitListPresenterProtocol and FruitListOutputInteractorProtocol. It loads data through the Interactor and passes it to the View.
3.FruitListInteractor (Interactor)
Implements FruitListInputInteractorProtocol. Fetches mock fruit images and notifies the Presenter.
4.FruitListRouter (Router)
Sets up the VIPER module by connecting View, Presenter, Interactor, and Router.
5.Models (Entity)
Contains simple structs like CarouselImage and HorizontalImage to represent data objects.

Project Flow
AppDelegate calls FruitListRouter.createModule() and sets up the navigation controller with the VIPER module.

Router initializes the View, Presenter, Interactor, and connects dependencies between them.
Presenter calls Interactor.fetchFruitList() in viewDidLoad.
Interactor fetches data and passes it back to the Presenter through FruitListOutputInteractorProtocol.
Presenter formats and sends data to the View.
View displays the images in carousel and horizontal collection views.

