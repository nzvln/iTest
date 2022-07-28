//
//  QuestionViewModel.swift
//  HabitusFINAL
//
//  Created by Nadia on 02.05.2022.
//

import Foundation



class QuizViewModel {
    
    var questions: [QuizQuestionsModel] = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
    var currentQuestionIndex = 0
    var maxQuestionIndex = 9
   
    func currentQuestion() -> QuizQuestionsModel {
        if currentQuestionIndex > questions.count - 1 {
            return questions[questions.count - 1]
        } else {
            return questions[currentQuestionIndex]
        }
    }
    
    func nextQuestionIndex() {
        currentQuestionIndex += 1
    }
}






