//
//  ViewController.swift
//  Hw6
//
//  Created by david david on 11.12.2024.
//

import UIKit

class ViewController: UIViewController {
    let firstTask: FirstTask = FirstTask()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTask.executeArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    }

}
