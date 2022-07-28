//
//  QuizViewController.swift
//  HabitusFINAL
//
//  Created by Nadia on 02.05.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    private var viewModel: QuizViewModel?
    var reuseIdentifier = "Cell"
    
    lazy var pageCountlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = q1.count
        label.font = .boldSystemFont(ofSize: 17)
        label.backgroundColor = UIColor(named: "quizLabel")
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        
        return label
    }()
    
    lazy var questionlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = q1.question
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.halfTextColorChange(fullText: q1.question)
        
        return label
    }()
    
    lazy var buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.backgroundColor   = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonResult: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor   = UIColor.purple
        button.setTitle("Дізнатись результат", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.isHidden = true
        
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        view.addSubview(pageCountlabel)
        view.addSubview(buttonBack)
        view.addSubview(buttonResult)
        view.addSubview(questionlabel)
        
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        viewModel = QuizViewModel()
        collectionView.backgroundColor = UIColor.black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        self.collectionViewConstraints()
        self.pageCountLabelConstraints()
        self.buttonNextConstraints()
        self.buttonBackConstraints()
        self.questionLabelConstraints()
    }
    
    @objc func backButtonPressed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) { [self] in
            viewModel?.currentQuestionIndex -= 1
            self.questionlabel.halfTextColorChange(fullText: (viewModel?.currentQuestion().question)!)
            self.pageCountlabel.text = viewModel?.currentQuestion().count
            if (viewModel?.currentQuestionIndex)! <= viewModel!.maxQuestionIndex {
                collectionView.reloadData()
            } else {
                collectionView.allowsMultipleSelection = true
                buttonResult.isHidden = false
            }
        }
    }
    
    @objc func nextButtonPressed() {
        self.navigationController?.pushViewController(ResultViewController(), animated: true)
    }
    
    func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 226),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72)])
    }
    
    func pageCountLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: pageCountlabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: pageCountlabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -14),
            NSLayoutConstraint(item: pageCountlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: pageCountlabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 77)])
    }
    
    func buttonBackConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: buttonBack, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: buttonBack, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: buttonBack, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38),
            NSLayoutConstraint(item: buttonBack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38)])
    }
    
    func buttonNextConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: buttonResult, attribute: .top, relatedBy: .equal, toItem: collectionView, attribute: .bottom, multiplier: 1, constant: -72),
            NSLayoutConstraint(item: buttonResult, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonResult, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 56),
            NSLayoutConstraint(item: buttonResult, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 343)])
    }
    
    func questionLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: questionlabel, attribute: .top, relatedBy: .equal, toItem: pageCountlabel, attribute: .bottom, multiplier: 1, constant: 34),
            NSLayoutConstraint(item: questionlabel, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 24),
            NSLayoutConstraint(item: questionlabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: questionlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 88),
            NSLayoutConstraint(item: questionlabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
}

extension QuizViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let question = viewModel?.currentQuestion() else { return 0 }
        
        return question.answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let question = viewModel?.currentQuestion() else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? QuizCollectionViewCell else { return QuizCollectionViewCell()}
        cell.setup(with: question.answers[indexPath.row])
        cell.textLabel.lineBreakMode = .byWordWrapping
        
        return cell
    }
}

extension QuizViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let question = viewModel?.currentQuestion() else { return }
        if question.answers[indexPath.row] == question.rightAnswer {
           userAnswers.append(question.answers[indexPath.row])
        }
        viewModel?.nextQuestionIndex()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [self] in
            self.questionlabel.text  = viewModel?.currentQuestion().question
            self.questionlabel.halfTextColorChange(fullText: questionlabel.text!)
            self.pageCountlabel.text = viewModel?.currentQuestion().count
            if (viewModel?.currentQuestionIndex)! <= viewModel!.maxQuestionIndex {
                collectionView.reloadData()
            } else {
                buttonResult.isHidden = false
            }
        }
    }
}

extension QuizViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 32, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension UILabel {
    func halfTextColorChange(fullText: String) {
        let lastWord = fullText.components(separatedBy: " ").last
        
        let range = NSString(string: fullText).range(of: lastWord!)
        let attribute = NSMutableAttributedString(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple , range: range)
        self.attributedText = attribute
    }
}
