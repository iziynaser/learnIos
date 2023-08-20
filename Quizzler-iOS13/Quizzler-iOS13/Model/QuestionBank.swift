//
//  QuestionBank.swift
//  Quizzler-iOS13
//
//  Created by IZIY on 3/1/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init(){
        let question1 = Question(text: "quiz1", answer: false)
        list.append(question1)
        
        list.append(Question(text: "quiz2", answer: false))
        list.append(Question(text: "quiz3", answer: true))
        list.append(Question(text: "quiz4", answer: false))
        list.append(Question(text: "quiz5", answer: true))
        list.append(Question(text: "quiz6", answer: false))
        list.append(Question(text: "quiz7", answer: true))
        list.append(Question(text: "quiz8", answer: false))
        list.append(Question(text: "quiz9", answer: true))
        list.append(Question(text: "quiz10", answer: false))
        list.append(Question(text: "quiz11", answer: true))
        list.append(Question(text: "quiz12", answer: false))
        list.append(Question(text: "quiz13", answer: true))
    }
}
