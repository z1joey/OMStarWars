//
//  ViewController.swift
//  OMStarWars
//
//  Created by Adamas Zhu on 28/3/17.
//  Copyright © 2017 Outware Mobile. All rights reserved.
//

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createGetFilmProducer() -> SignalProducer<Array<Film>, AnyError> {
        let signal = Signal<Array<Film>, AnyError>.pipe()
        let producer = SignalProducer<Array<Film>, AnyError>()
    }


}

import ReactiveCocoa
import ReactiveSwift
import Result
import UIKit

