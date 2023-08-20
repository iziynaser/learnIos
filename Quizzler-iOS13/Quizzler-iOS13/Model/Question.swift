//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by IZIY on 3/1/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, answer: Bool) {
        self.questionText = text
        self.answer = answer
    }
    
}
