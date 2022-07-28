//
//  MyPageViewController.swift
//  HabitusFINAL
//
//  Created by Nadia on 16.02.2022.
//

import UIKit

final class MyPageViewController: UIPageViewController {
  
    // MARK: - Constraints
  enum ConstraintsOfPageViewController {
    static let centerX: CGFloat = 0
    static let skipButtonHeight: CGFloat = 30
    static let skipButtonWidth: CGFloat = 100
    static let skipButtonLeft: CGFloat = 32
    static let skipButtonBottom: CGFloat = -33
    static let nextButtonHeight: CGFloat = 56
    static let nextButtonWidth: CGFloat = 56
    static let nextButtonRight: CGFloat = -32
    static let nextButtonBottom: CGFloat = -19
    static let dotsHeigh: CGFloat = 8
    static let dotsWidth: CGFloat = 8
    static let dotsBottom: CGFloat = 74
  }
  
  private var page = [OnBoardingViewModel]()
  private var currentIndex = 0
  
  lazy var buttonSkip: UIButton = {
    let buttonSkip = UIButton(type: .system)
    
    buttonSkip.setTitle("Пропустити", for: .normal)
    buttonSkip.tintColor = UIColor.white
    buttonSkip.translatesAutoresizingMaskIntoConstraints = false
    buttonSkip.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
    return buttonSkip
  }()
  
  lazy var buttonNext: UIButton = {
    let buttonNext = UIButton(type: .system)
    buttonNext.setBackgroundImage(UIImage(named: "btnNext"), for: .normal)
    buttonNext.translatesAutoresizingMaskIntoConstraints = false
    buttonNext.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
    return buttonNext
  }()
  
  lazy var arrayViewController: [UIViewController] = {
    return page.map { OnboardingViewController(imageWith: $0) }
  }()
  
  override init(transitionStyle style: UIPageViewController.TransitionStyle,
                navigationOrientation: UIPageViewController.NavigationOrientation,
                options: [UIPageViewController.OptionsKey : Any]? = nil) {
    super.init(transitionStyle: .scroll,
               navigationOrientation: navigationOrientation,
               options: nil)
    view.backgroundColor = UIColor.black
    dataSource = self
    delegate = self
    setViewControllers([arrayViewController[currentIndex]],
                       direction: .forward,
                       animated: true,
                       completion: nil)
  }
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(buttonSkip)
    view.addSubview(buttonNext)
    setPageControl()
    
    page.append(OnBoardingViewModel(makeForTitle: "Перевір свої знання",
                                    makeForText: "Хто ти? Junior, Middle чи може Senior?",
                                    image: UIImage(named: "book")!))
    page.append(OnBoardingViewModel(makeForTitle: "Змагайся із друзями",
                                    makeForText: "Виріште нарешті, хто кодить крутіше",
                                    image: UIImage(named:"cup")!))
    page.append(OnBoardingViewModel(makeForTitle: "Ділись результатами",
                                    makeForText: "Нехай усі знають, який ти розумний:)",
                                    image: UIImage(named: "victory")!))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewWillLayoutSubviews() {
    self.constraintsOfSkipButton()
    self.constraintsOfNextButton()
  }
  
  private func setPageControl() {
    let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [MyPageViewController.self])
      pageControl.pageIndicatorTintColor = UIColor(named: "gray")
      pageControl.currentPageIndicatorTintColor = UIColor.purple
  }
  
  private func constraintsOfSkipButton() {
    NSLayoutConstraint.activate([
                                  NSLayoutConstraint(item: buttonSkip, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfPageViewController.skipButtonHeight),
                                  NSLayoutConstraint(item: buttonSkip, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfPageViewController.skipButtonWidth),
                                  NSLayoutConstraint(item: buttonSkip, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: ConstraintsOfPageViewController.skipButtonBottom),
                                  NSLayoutConstraint(item: buttonSkip, attribute: .left, relatedBy: .lessThanOrEqual, toItem: view, attribute: .left, multiplier: 1, constant: ConstraintsOfPageViewController.skipButtonLeft)])
  }
  
  private func constraintsOfNextButton() {
    NSLayoutConstraint.activate([
                                  NSLayoutConstraint(item: buttonNext, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfPageViewController.nextButtonHeight),
                                  NSLayoutConstraint(item: buttonNext, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfPageViewController.nextButtonWidth),
                                  NSLayoutConstraint(item: buttonNext, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: ConstraintsOfPageViewController.nextButtonRight),
                                  NSLayoutConstraint(item: buttonNext, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view, attribute: .bottom, multiplier: 1, constant: ConstraintsOfPageViewController.nextButtonBottom)])
  }
  
  //skipButtonPressed
  @objc func skipButtonPressed() {
      self.navigationController?.pushViewController(QuizViewController(), animated: true)
  }
  
  //nextButtonPressed
  @objc func nextButtonPressed(_ sender: UIButton) {
    currentIndex += 1
    if currentIndex > page.count - 1 {
      self.skipButtonPressed()
      return
    }
    setViewControllers([arrayViewController[currentIndex]],
                       direction: .forward,
                       animated: true,
                       completion: nil)
  }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController,
                          didFinishAnimating finished: Bool,
                          previousViewControllers: [UIViewController],
                          transitionCompleted completed: Bool) {
    if completed {
      if let currentViewController = pageViewController.viewControllers?.first,
         let index = arrayViewController.firstIndex(of: currentViewController) {
        currentIndex = index
      }
    }
  }
}

extension MyPageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewController = viewController as? OnboardingViewController else { return nil }
    
    if let index = arrayViewController.firstIndex(of: viewController), index > 0 {
      return arrayViewController[index - 1]
    }
    
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewController = viewController as? OnboardingViewController else { return nil }
    
    if let index = arrayViewController.firstIndex(of: viewController), index < page.count - 1 {
      return arrayViewController[index + 1]
    }
    
    return nil
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return page.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return currentIndex
  }
}




