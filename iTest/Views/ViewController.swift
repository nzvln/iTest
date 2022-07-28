//
//  ViewController.swift
//  HabitusFINAL
//
//  Created by Nadia on 16.02.2022.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Constraints
    enum ConstraintsofFirstPage {
        static let imageUnionHeigh: CGFloat = 200
        static let imageUnionWidth: CGFloat = 200
        static let imageUnionTop: CGFloat = 200
        static let centerX: CGFloat = 0
        static let startButtonHeigh: CGFloat = 56
        static let startButtonWidth: CGFloat = 311
        static let startButtonTop: CGFloat = 228
        static let startButtonBottom: CGFloat = -50
        static let firstLabelHeigh: CGFloat = 39
        static let firstLabelWidth: CGFloat = 311
        static let firstLabelTop: CGFloat = 50
        static let secondLabelHeigh: CGFloat = 66
        static let secondLabelWidth: CGFloat = 311
        static let secondLabelTop: CGFloat = 10
    }
    
    //MARK: - Images
    private let imageUnion: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "itest")
        view.contentMode = .center
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Labels
    lazy var firstLabel = UILabel.firstLabel()
    lazy var secondLabel = UILabel.secondLabel()
    
    //MARK: - Button
    lazy var buttonStart: UIButton = {
        let buttonStart = UIButton(type: .system)
        buttonStart.setTitle("Почати", for: .normal)
        buttonStart.frame = CGRect(x: 0, y: 0, width: 311, height: 56)
        buttonStart.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonStart.tintColor = UIColor.white
        buttonStart.backgroundColor = UIColor.purple
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.layer.cornerRadius = 16
        buttonStart.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return buttonStart
    }()
    
    @objc func startButtonPressed() {
        self.navigationController?.pushViewController(MyPageViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(buttonStart)
        view.addSubview(imageUnion)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
    }
    
    override func viewWillLayoutSubviews() {
        self.imageUnionConstraints()
        self.startButtonConstraints()
        self.firstLabelConstraints()
        self.secondLabelConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func imageUnionConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageUnion, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.imageUnionHeigh),
            NSLayoutConstraint(item: imageUnion, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.imageUnionWidth),
            NSLayoutConstraint(item: imageUnion, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: ConstraintsofFirstPage.imageUnionTop),
            NSLayoutConstraint(item: imageUnion, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsofFirstPage.centerX)])
    }
    
    private func firstLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: firstLabel, attribute: .top, relatedBy: .equal, toItem: imageUnion, attribute: .bottom, multiplier: 1, constant: ConstraintsofFirstPage.firstLabelTop),
            NSLayoutConstraint(item: firstLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsofFirstPage.centerX),
            NSLayoutConstraint(item: firstLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.firstLabelHeigh),
            NSLayoutConstraint(item: firstLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.firstLabelWidth)])
    }
    
    private func secondLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: firstLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsofFirstPage.secondLabelTop),
            NSLayoutConstraint(item: secondLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsofFirstPage.centerX),
            NSLayoutConstraint(item: secondLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.secondLabelHeigh),
            NSLayoutConstraint(item: secondLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.secondLabelWidth)])
    }
    
    private func startButtonConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: buttonStart, attribute: .top, relatedBy: .equal, toItem: secondLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsofFirstPage.startButtonTop),
            NSLayoutConstraint(item: buttonStart, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsofFirstPage.centerX),
            NSLayoutConstraint(item: buttonStart, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.startButtonHeigh),
            NSLayoutConstraint(item: buttonStart, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsofFirstPage.startButtonWidth),
            NSLayoutConstraint(item: buttonStart, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: ConstraintsofFirstPage.startButtonBottom)
        ])
    }
}

extension UILabel {
    static func firstLabel() -> UILabel {
        let labelOne = UILabel()
        labelOne.textColor = UIColor.white
        labelOne.numberOfLines = 0
        labelOne.font = UIFont.boldSystemFont(ofSize: 30)
        labelOne.text = "Ласкаво просимо!"
        labelOne.textAlignment = .center
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        
        return labelOne
    }
    
    static func secondLabel() -> UILabel {
        let labelTwo = UILabel()
        
        labelTwo.textColor = UIColor.white
        labelTwo.numberOfLines = 0
        labelTwo.font = UIFont.systemFont(ofSize: 17)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.text = "Тут ти можеш перевірити свій рівень знань в Swift"
        labelTwo.textAlignment = .center
        
        return labelTwo
    }
}


