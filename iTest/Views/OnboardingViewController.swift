//
//  OnboardingViewController.swift
//  HabitusFINAL
//
//  Created by Nadia on 16.02.2022.
//

import UIKit


final class OnboardingViewController: UIViewController {
    
    //MARK: - Image
    private let myImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Label
    lazy var titleLabel = UILabel.makeForTitle()
    lazy var textLabel = UILabel.makeForText()
    
    //MARK: - init
    init(imageWith: OnBoardingViewModel) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.black
        myImage.image = imageWith.image
        titleLabel.text = imageWith.makeForTitle
        textLabel.text = imageWith.makeForText
    }
    
    //MARK: - Enum of constraints
    enum Constraints {
        static let myImageTop: CGFloat = 94
        static let myImageHeigh: CGFloat = 343
        static let myImageWidth: CGFloat = 343
        static let firstLabelTop: CGFloat = 50
        static let secondLabelTop: CGFloat = 12
        static let centerX: CGFloat = 0
        static let firstLabelHeigh: CGFloat = 39
        static let firstLabelWidth: CGFloat = 311
        static let secondLabelHeigh: CGFloat = 66
        static let secondLabelWidth: CGFloat = 311
        
    }
    
    override func viewDidLoad() {
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(myImage)
    }
    
    override func viewWillLayoutSubviews() {
        self.setImageviewConstraints()
        self.firstLabelConstraints()
        self.secondLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setImageviewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: myImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.myImageHeigh),
            NSLayoutConstraint(item: myImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.myImageWidth),
            NSLayoutConstraint(item: myImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: Constraints.myImageTop),
            NSLayoutConstraint(item: myImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX)
        ])
    }
    
    private func firstLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: myImage, attribute: .bottom, multiplier: 1, constant: Constraints.firstLabelTop),
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX),
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.firstLabelHeigh),
            NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.firstLabelWidth)])
    }
    
    private func secondLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: textLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: Constraints.secondLabelTop),
            NSLayoutConstraint(item: textLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX),
            NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.secondLabelHeigh),
            NSLayoutConstraint(item: textLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.secondLabelWidth)])
    }
}

extension UILabel {
    static func makeForTitle() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        
        return label
    }
    
    static func makeForText() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }
}


