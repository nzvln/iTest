//
//  ResultViewController.swift
//  iTest
//
//  Created by Nadia on 12.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    enum ConstraintsOfResultPage {
        static let imageUnionHeigh: CGFloat = 200
        static let imageUnionWidth: CGFloat = 200
        static let imageUnionTop: CGFloat = 200
        static let centerX: CGFloat = 0
        static let restartButtonHeigh: CGFloat = 56
        static let restartButtonWidth: CGFloat = 311
        static let restartButtonTop: CGFloat = 228
        static let restartButtonBottom: CGFloat = -50
        static let resultLabelHeigh: CGFloat = 39
        static let resultLabelWidth: CGFloat = 311
        static let resultLabelTop: CGFloat = 50
        static let secondLabelHeigh: CGFloat = 66
        static let secondLabelWidth: CGFloat = 311
        static let secondLabelTop: CGFloat = 10
    }
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Твій результат: \(userAnswers.count)/10"
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Мої вітання, \(rankOfUsers())!"
        label.textAlignment = .center
        
        return label
    }()
    
    private let imageUnion: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "itest")
        view.contentMode = .center
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var buttonRestart: UIButton = {
        let buttonStart = UIButton(type: .system)
        buttonStart.setTitle("Ще раз", for: .normal)
        buttonStart.frame = CGRect(x: 0, y: 0, width: 311, height: 56)
        buttonStart.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonStart.tintColor = UIColor.white
        buttonStart.backgroundColor = UIColor.purple
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.layer.cornerRadius = 16
        buttonStart.addTarget(self, action: #selector(restartButtonPressed), for: .touchUpInside)
        
        return buttonStart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(buttonRestart)
        view.addSubview(imageUnion)
        view.addSubview(resultLabel)
        view.addSubview(secondLabel)
    }
    
    override func viewWillLayoutSubviews() {
        self.imageUnionConstraints()
        self.buttonRestartConstraints()
        self.resultLabelConstraints()
        self.secondLabelConstraints()
    }
    
    @objc func restartButtonPressed() {
        userAnswers.removeAll()
        self.navigationController?.pushViewController(QuizViewController(), animated: true)
    }
    
    func rankOfUsers() -> String {
        let correctAnswers = userAnswers.count
        var rank = ""
        switch correctAnswers {
        case 0...4:
            rank = "Junior"
        case 5...8:
            rank = "Middle"
        case 9...10:
            rank = "Senior"
        default:
            print("error")
            break
        }
        return rank
    }
    
    private func imageUnionConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageUnion, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionHeigh),
            NSLayoutConstraint(item: imageUnion, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionWidth),
            NSLayoutConstraint(item: imageUnion, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionTop),
            NSLayoutConstraint(item: imageUnion, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX)])
    }
    
    private func resultLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: resultLabel, attribute: .top, relatedBy: .equal, toItem: imageUnion, attribute: .bottom, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelTop),
            NSLayoutConstraint(item: resultLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX),
            NSLayoutConstraint(item: resultLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelHeigh),
            NSLayoutConstraint(item: resultLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelWidth)])
    }
    
    private func secondLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: resultLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelTop),
            NSLayoutConstraint(item: secondLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX),
            NSLayoutConstraint(item: secondLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelHeigh),
            NSLayoutConstraint(item: secondLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelWidth)])
    }
    
    func buttonRestartConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: buttonRestart, attribute: .top, relatedBy: .equal, toItem: secondLabel, attribute: .bottom, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: buttonRestart, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonRestart, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 56),
            NSLayoutConstraint(item: buttonRestart, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 343)])
    }
}
