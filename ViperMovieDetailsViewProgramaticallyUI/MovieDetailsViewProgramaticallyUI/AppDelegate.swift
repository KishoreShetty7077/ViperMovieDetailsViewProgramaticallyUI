//
//  AppDelegate.swift
//  MovieDetailsViewProgramaticallyUI
//
//  Created by Kishore B on 10/29/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

       func application(
           _ application: UIApplication,
           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
       ) -> Bool {
           window = UIWindow(frame: UIScreen.main.bounds)
           
           // Initialize the VIPER module via Router
           let fruitListModule = FruitListRouter.createModule()
           
           // Embed the module in a UINavigationController
           let navigationController = UINavigationController(rootViewController: fruitListModule)
           window?.rootViewController = navigationController
           window?.makeKeyAndVisible()
           
           return true
       }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
  

}



/*
 class ViewController: UIViewController {
     
     // MARK: - UI Components
     private let scrollView = UIScrollView()
     private let contentView = UIView()
     private let pageControl = UIPageControl()
     private var countdownTimer: Timer?
     private var countdownSeconds = 86400

     private let carouselImages: [UIImage] = [ UIImage(named: "icons8")!, UIImage(named: "icons8")!, UIImage(named: "icons8")!]
     private let horizontalImages: [UIImage] = [ UIImage(named: "icons8")!, UIImage(named: "icons8")!, UIImage(named: "icons8")!]
         
     private let carouselCollectionView: UICollectionView = createCollectionView(scrollDirection: .horizontal, isPagingEnabled: true)
     private let horizontalCollectionView: UICollectionView = createCollectionView(scrollDirection: .horizontal, isPagingEnabled: false)
     
     private let grayLineView: UIView = createLineView(color: .lightGray)
     private let lineView: UIView = createLineView(color: .systemPink)
     private let underlineView: UIView = createLineView(color: .systemPink)
     private let countdownStackView: UIStackView = createStackView(axis: .horizontal, distribution: .fillEqually, spacing: 8)

     private let segmentControl: UISegmentedControl = createSegmentedControl(
         items: ["About", "Cast", "Timings", "Locations", "Pro"],
         selectedIndex: 0,
         backgroundColor: .white,
         selectedTintColor: .systemPink
     )

     private let sectionTitleLabel = createLabel(text: "Section title", fontSize: 20, weight: .bold)
     private let specialTagLabel = createLabel(text: "SPECIAL TAG - BLOCKBUSTER", fontSize: 14, weight: .semibold, color: .systemPink)
     private let titleLabel = createLabel(text: "Title - Mad Max saga : Fury Road", fontSize: 18, weight: .bold)
     private let bodyTextLabel = createLabel(text: "Body text - When the world is taken by darkness, A hero will rise.", fontSize: 16)
     private let locationLabel = createLabel(text: "📍 Cinephile, Bangalore", fontSize: 16, color: .gray)
     private let dateTimeLabel = createLabel(text: "🗓 8:30 PM, 28th July, Wednesday", fontSize: 16, color: .gray)
     private let bookingCountdownLabel = createLabel(text: "Booking will close in:", fontSize: 16)
     private let productDetailLabel: UILabel = createLabel(text: "A modern-day avatar of Vishnu, a Hindu god, who is believed to have descended to earth to protect the world from evil forces.", fontSize: 16)
     
     // MARK: - View Lifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         setupScrollView()
         setupUI()
         setupCountdown()
         setupCarouselCollectionView()
         setUpPageController()
         setupHorizontalCollectionView()
     }
     
     private func setupScrollView() {
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         contentView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(scrollView)
         scrollView.addSubview(contentView)
         
         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
         ])
     }
     
     private func setupUI() {
         // Add and layout UI components in contentView
         [sectionTitleLabel, grayLineView, carouselCollectionView, pageControl, specialTagLabel, lineView, titleLabel, bodyTextLabel, locationLabel, dateTimeLabel, bookingCountdownLabel, countdownStackView, horizontalCollectionView,segmentControl, underlineView, productDetailLabel].forEach { contentView.addSubview($0) }
         
         sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
         grayLineView.translatesAutoresizingMaskIntoConstraints = false
         carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
         pageControl.translatesAutoresizingMaskIntoConstraints = false
         specialTagLabel.translatesAutoresizingMaskIntoConstraints = false
         lineView.translatesAutoresizingMaskIntoConstraints = false
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         bodyTextLabel.translatesAutoresizingMaskIntoConstraints = false
         locationLabel.translatesAutoresizingMaskIntoConstraints = false
         dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
         bookingCountdownLabel.translatesAutoresizingMaskIntoConstraints = false
         countdownStackView.translatesAutoresizingMaskIntoConstraints = false
         horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
         segmentControl.translatesAutoresizingMaskIntoConstraints = false
         underlineView.translatesAutoresizingMaskIntoConstraints = false
         productDetailLabel.translatesAutoresizingMaskIntoConstraints = false
         
         // Layout constraints
         NSLayoutConstraint.activate([
             sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
             sectionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             
             grayLineView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 8),
             grayLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             grayLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             grayLineView.heightAnchor.constraint(equalToConstant: 1), // Adjust thickness as needed
             
             carouselCollectionView.topAnchor.constraint(equalTo: grayLineView.bottomAnchor, constant: 16),
             carouselCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             carouselCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             carouselCollectionView.heightAnchor.constraint(equalToConstant: 200),
             
             pageControl.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: 8),
             pageControl.centerXAnchor.constraint(equalTo: carouselCollectionView.centerXAnchor),

             specialTagLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
             specialTagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             
             lineView.topAnchor.constraint(equalTo: specialTagLabel.bottomAnchor, constant: 8),
             lineView.leadingAnchor.constraint(equalTo: specialTagLabel.leadingAnchor),
             lineView.trailingAnchor.constraint(equalTo: specialTagLabel.trailingAnchor),
             lineView.heightAnchor.constraint(equalToConstant: 1), // Adjust thickness as needed
             
             titleLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 8),
             titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             
             bodyTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
             bodyTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             bodyTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             
             locationLabel.topAnchor.constraint(equalTo: bodyTextLabel.bottomAnchor, constant: 8),
             locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             
             dateTimeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
             dateTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             
             bookingCountdownLabel.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor, constant: 16),
             bookingCountdownLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             
             countdownStackView.topAnchor.constraint(equalTo: bookingCountdownLabel.bottomAnchor, constant: 8),
             countdownStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             countdownStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             countdownStackView.heightAnchor.constraint(equalToConstant: 50),
             
             horizontalCollectionView.topAnchor.constraint(equalTo: countdownStackView.bottomAnchor, constant: 16),
             horizontalCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             horizontalCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             horizontalCollectionView.heightAnchor.constraint(equalToConstant: 80),
             
             segmentControl.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 20),
             segmentControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             segmentControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             
 //            // Underline view for the selected segment
             underlineView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 2),
             underlineView.heightAnchor.constraint(equalToConstant: 2),
             underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             underlineView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0 / CGFloat(segmentControl.numberOfSegments)),
             
             productDetailLabel.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 16),
             productDetailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             productDetailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             productDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
         ])
     }

     private func setupCountdown() {
         let countdownComponents = ["Days", "Hours", "Mins", "Sec"]
            
            countdownComponents.forEach { component in
                let label = UILabel()
                label.text = "00 \(component)"
                label.textAlignment = .center
                label.textColor = .systemPink
                label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                label.layer.borderColor = UIColor.clear.cgColor
                label.layer.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).cgColor
                label.layer.borderWidth = 1
                label.layer.cornerRadius = 8
                label.clipsToBounds = true
                countdownStackView.addArrangedSubview(label)
            }
            startCountdownTimer() // Start the timer
     }
     
     private func startCountdownTimer() {
         countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
     }

     @objc private func updateCountdown() {
         if countdownSeconds > 0 {
             countdownSeconds -= 1
             let days = countdownSeconds / 86400
             let hours = (countdownSeconds % 86400) / 3600
             let minutes = (countdownSeconds % 3600) / 60
             let seconds = countdownSeconds % 60

             // Update labels
             if let labels = countdownStackView.arrangedSubviews as? [UILabel] {
                 labels[0].text = String(format: "%02d Days", days)
                 labels[1].text = String(format: "%02d Hours", hours)
                 labels[2].text = String(format: "%02d Mins", minutes)
                 labels[3].text = String(format: "%02d Sec", seconds)
             }
         } else {
             countdownTimer?.invalidate()
             countdownTimer = nil
             // Optionally, handle countdown end (e.g., show an alert)
         }
     }
     
     private func setupCarouselCollectionView() {
         carouselCollectionView.delegate = self
         carouselCollectionView.dataSource = self
         carouselCollectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")

     }
     
     private func setUpPageController() {
         pageControl.numberOfPages = 3
         pageControl.currentPageIndicatorTintColor = .systemPink
         pageControl.pageIndicatorTintColor = .lightGray
     }
     
     private func setupHorizontalCollectionView() {
         horizontalCollectionView.delegate = self
         horizontalCollectionView.dataSource = self
         horizontalCollectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: "HorizontalCell")
     }
     
     @objc private func segmentChanged(_ sender: UISegmentedControl) {
         let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
         let underlinePosition = CGFloat(sender.selectedSegmentIndex) * segmentWidth
         
         UIView.animate(withDuration: 0.3) {
             self.underlineView.frame.origin.x = underlinePosition
         }
         
         switch sender.selectedSegmentIndex {
         case 0:
             productDetailLabel.text = "A modern-day avatar of Vishnu, a Hindu god, who is believed to have descended to earth to protect the world from evil forces"
         case 1:
             productDetailLabel.text = "Cast information will go here."
         case 2:
             productDetailLabel.text = "Timings information will go here."
         case 3:
             productDetailLabel.text = "Locations information will go here."
         case 4:
             productDetailLabel.text = "Pro information will go here."
         default:
             productDetailLabel.text = ""
         }
     }
     
     private static func createSegmentedControl(items: [String], selectedIndex: Int, backgroundColor: UIColor, selectedTintColor: UIColor) -> UISegmentedControl {
         let segmentedControl = UISegmentedControl(items: items)
         segmentedControl.selectedSegmentIndex = selectedIndex
         segmentedControl.backgroundColor = backgroundColor
         segmentedControl.selectedSegmentTintColor = selectedTintColor
         segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
         return segmentedControl
     }

     private static func createLabel(text: String, fontSize: CGFloat, weight: UIFont.Weight = .regular, color: UIColor = .black) -> UILabel {
         let label = UILabel()
         label.text = text
         label.font = .systemFont(ofSize: fontSize, weight: weight)
         label.textColor = color
         label.numberOfLines = 0
         return label
     }
     private static func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
         let stack = UIStackView()
         stack.axis = axis
         stack.distribution = distribution
         stack.spacing = spacing
         return stack
     }

     private static func createLineView(color: UIColor) -> UIView {
         let view = UIView()
         view.backgroundColor = color
         return view
     }
     
     private static func createCollectionView(scrollDirection: UICollectionView.ScrollDirection, isPagingEnabled: Bool) -> UICollectionView {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = scrollDirection
         layout.minimumLineSpacing = 10
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.isPagingEnabled = isPagingEnabled
         collectionView.showsHorizontalScrollIndicator = false
         collectionView.backgroundColor = .clear
         return collectionView
     }

 }

     // MARK: - UICollectionViewDelegate & UICollectionViewDataSource
 extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == carouselCollectionView {
             carouselImages.count
         } else {
             carouselImages.count
         }
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if collectionView == carouselCollectionView {
             
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCell else {
                 return UICollectionViewCell()
             }
             cell.imageView.image = carouselImages[indexPath.item]
             cell.imageView.layer.cornerRadius = 20
             cell.backgroundColor = .blue
             return cell
         } else {
             
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCell", for: indexPath) as? HorizontalCell else {
                 return UICollectionViewCell()
             }
             cell.imageView.image = carouselImages[indexPath.item]
             return cell
         }
     }
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         
         guard scrollView == carouselCollectionView else { return }
         
         // Calculate current page based on scroll position
         let pageWidth = scrollView.frame.width
         let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
         
         // Update the page control
         pageControl.currentPage = currentPage
     }
 }

     // MARK: - UICollectionViewDelegateFlowLayout
 extension ViewController: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if collectionView == carouselCollectionView {
             return CGSize(width: collectionView.frame.width / 1.1, height: collectionView.frame.height)
         } else {
             return CGSize(width: 60, height: 60)
         }
     }
 }

 */

