//
//  InterfaceController.swift
//  Text Input WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/7/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var textLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func buttonTapped() {
        self.presentTextInputController(withSuggestions: nil, allowedInputMode: .allowEmoji, completion: { results in
        guard let results = results else { return }
            OperationQueue.main.addOperation {
                self.dismissTextInputController()
                self.textLabel.setText(results[0] as? String)
            }
        
        })
        
    }

}
