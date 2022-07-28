//
//  QuestionBank.swift
//  iTest
//
//  Created by Nadia on 13.07.2022.
//

import Foundation

var userAnswers: [String] = []

let q1 = QuizQuestionsModel(question: "Яка програма використовується для Swift?", answers:  ["Visual studio","Xamarin Studio", "Atom", "Будь-яка IDE підійде", "Xcode"], rightAnswer: "Xcode", count: "1/10")
let q2 = QuizQuestionsModel(question: "Чим відрізняються оператори break і countinue?", answers: ["У них немає різниці","Вони використовуються в різних циклах", "Break - пропускає ітерацію, countinue - виходить із циклу", "Countinue - пропускає ітерацію, break - виходить із циклу"], rightAnswer: "Countinue - пропускає ітерацію, break - виходить із циклу", count: "2/10")
let q3 = QuizQuestionsModel(question: "Скільки циклів існує в Swift?", answers:  ["1","2", "3", "4", "5"], rightAnswer: "3", count: "3/10")
let q4 = QuizQuestionsModel(question: "Де правильно створено змінну?", answers: ["var x = 2.56: Float","var Float: x = 2.56", "x = 2.56", "var x: Float = 2.56"], rightAnswer: "var x: Float = 2.56", count: "4/10")
let q5 = QuizQuestionsModel(question: "Яка біблотека потрібна для створення користувальницького інтерфейсу?", answers: ["SpriteKit","GameplayKit", "UI", "UIKit"], rightAnswer: "UIKit", count: "5/10")
let q6 = QuizQuestionsModel(question: "Яка бібліотека використовується для створення ігор?", answers: ["SpriteKit","GameplayKit","UIKit","Не потребується додаткова бібліотека","GameplayKit і SpriteKit"], rightAnswer: "GameplayKit і SpriteKit", count: "6/10")
let q7 = QuizQuestionsModel(question: "Який тип буде у змінної var x: Float = 10?", answers: ["Double","Float","String","Int"], rightAnswer: "Float", count: "7/10")
let q8 = QuizQuestionsModel(question: "Чи можливо у розширенні додати ініціалізатор?", answers: ["Ні","Так","Так, але лише допоміжний"], rightAnswer: "Так", count: "8/10")
let q9 = QuizQuestionsModel(question: "Чи можливо створити екземпляр протокола?", answers: ["Так","Ні"], rightAnswer: "Ні", count: "9/10")
let q10 = QuizQuestionsModel(question: "Чи дозволяють розширення добавляти вкладені типи?", answers: ["Так","Ні"], rightAnswer: "Так",count: "10/10")
