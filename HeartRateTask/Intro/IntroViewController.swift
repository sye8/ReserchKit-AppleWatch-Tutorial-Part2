//
//  IntroViewController.swift
//  ResearchKitConsent
//
//  Created by 叶思帆 on 20/07/2018.
//  Copyright © 2018 Sifan Ye. All rights reserved.
//

import UIKit

import ResearchKit

class IntroViewController: UIViewController {
    
    var contentHidden = false {
        didSet {
            guard contentHidden != oldValue && isViewLoaded else { return }
            childViewControllers.first?.view.isHidden = contentHidden
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Branch off into different views
        if ORKPasscodeViewController.isPasscodeStoredInKeychain(){
            toTasks()
        }else{
            toConsent()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToTasks(_ segue: UIStoryboardSegue){
        toTasks()
    }
    
    func toConsent(){
        performSegue(withIdentifier: "toConsent", sender: self)
    }
    
    func toTasks(){
        performSegue(withIdentifier: "toTasks", sender: self)
    }
}
