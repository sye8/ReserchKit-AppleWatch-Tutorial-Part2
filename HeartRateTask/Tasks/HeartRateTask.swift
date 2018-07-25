//
//  HeartRateTask.swift
//  HeartRateTask
//
//  Created by 叶思帆 on 25/07/2018.
//  Copyright © 2018 Sifan Ye. All rights reserved.
//

import ResearchKit

public var HeartRateTask: ORKOrderedTask {

    var steps = [ORKStep]()
    
    //Instruction Step
    let instructionStep = ORKInstructionStep(identifier: "Instruction")
    instructionStep.title = "Heart Rate"
    instructionStep.text = "<Description>"
    steps += [instructionStep]
    
    //Start Prompt Step
    let startPromptStep = ORKActiveStep(identifier: "StartPrompt")
    startPromptStep.title = "Heart Rate"
    startPromptStep.text = "Please open the corresponding app on your watch and press \"Start Recording\"."
    steps += [startPromptStep]
    
    //Heart Rate Step
    let heartrateStep = ORKActiveStep(identifier: "HeartRate")
    heartrateStep.stepDuration = 30
    heartrateStep.shouldShowDefaultTimer = true
    heartrateStep.shouldStartTimerAutomatically = true
    heartrateStep.shouldContinueOnFinish = true
    heartrateStep.title = "Heart Rate"
    heartrateStep.text = "Please <do sth> for 30 seconds."
    steps += [heartrateStep]
    
    //End Prompt Step
    let endPromptStep = ORKActiveStep(identifier: "EndPrompt")
    endPromptStep.title = "Heart Rate"
    endPromptStep.text = "Now you can press \"Stop Recording\" on your watch."
    steps += [endPromptStep]
    
    //Summary Step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you!"
    summaryStep.text = "<text>\nYou can check the results by tapping the results button.\n"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "HeartRateTask", steps: steps)
}
