//
//  CoachingSummary.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//

public struct CoachingSummary: Codable {
    
    var activeTodo: Bool = false
    var activeChat: Bool = false
    var numberOfTodoItems: Int = 0
    var numberOfCompletedTodoItems: Int = 0
    var selected: Bool = false
}
