//
//  TasksViewController.swift
//  ResearchKitConsent
//
//  Created by 叶思帆 on 20/07/2018.
//  Copyright © 2018 Sifan Ye. All rights reserved.
//

import UIKit

import ResearchKit

class TasksViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func consentButtonTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: consentPDFViewerTask(), taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func leaveButtonTapped(_ sender: UIButton) {
        ORKPasscodeViewController.removePasscodeFromKeychain()
        performSegue(withIdentifier: "returnToConsent", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func consentPDFViewerTask() -> ORKOrderedTask{
        var docURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last
        docURL = docURL?.appendingPathComponent("consent.pdf")
        let PDFViewerStep = ORKPDFViewerStep.init(identifier: "ConsentPDFViewer", pdfURL: docURL)
        PDFViewerStep.title = "Consent"
        return ORKOrderedTask(identifier: String("ConsentPDF"), steps: [PDFViewerStep])
    }
    
}

extension TasksViewController: ORKTaskViewControllerDelegate{
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
