//
//  ViewController.swift
//  ReactSample
//
//  Created by Brian Thomas on 5/14/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
  
  var action: Action<Int, Int, NoError>?
  var cocoaAction: CocoaAction?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    action = Action<Int, Int, NoError> { _ in
      return SignalProducer<Int, NoError> { observer, disposable in
        sendNext(observer, 30)
      }
    }
    
    cocoaAction = CocoaAction(action!, input: 0)
    
    var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    button.frame = CGRectMake(90, 90, 200, 100)
    self.view.addSubview(button)
    button.addTarget(cocoaAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

