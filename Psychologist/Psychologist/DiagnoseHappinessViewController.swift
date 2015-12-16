//
//  DiagnoseHappinessViewController.swift
//  Psychologist
//
//  Created by WangDa on 12/16/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import UIKit

class DiagnoseHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate{
    
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory : [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private struct History {
        static let Segue = "history"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.Segue:
                if let tvc = segue.destinationViewController as? TextViewController{
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break;
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
