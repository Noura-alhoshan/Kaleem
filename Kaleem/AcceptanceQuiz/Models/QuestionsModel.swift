//
//  QuestionsModel.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//

import Foundation

struct QuizModel  {
    var id: UUID {
        UUID()
    }
    var question: String?
    var correctAnswer: String?
    var incorrectAnswers: [String]
var answers: [Answer]
}

//final quiz is an array of quizmodel\
var myQuiz1 : [QuizModel] =
[

    QuizModel(
 
        question: "ContentView().a[0].name",
        correctAnswer: "q1",
        incorrectAnswers: ["ans1","ans2","ans4 correct"],
        answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false),Answer(text: "q1", isCorrect: true),Answer(text: "q1", isCorrect: true)]
   ),
    
    QuizModel(

        question: "q1",
        correctAnswer: "q1",
        incorrectAnswers: ["ans1","ans2","ans4 correct"],
        answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
   ),
    
    QuizModel(

        question: "q1",
        correctAnswer: "q1",
        incorrectAnswers: ["ans1","ans2","ans4 correct"],
        answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
   ),
    QuizModel(
     
        question: "q1",
        correctAnswer: "q1",
        incorrectAnswers: ["ans1","ans2","ans4 correct"],
        answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
   ),
    
    QuizModel(

        question: "q1",
        correctAnswer: "q1",
        incorrectAnswers: ["ans1","ans2","ans4 correct"],
        answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
   ),

]
