//
//  ViewController.swift
//  ExMemoryLeak
//
//  Created by 김종권 on 2024/02/07.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        present(VC2(), animated: true)
    }
}

class VC2: UIViewController {
    var main: MyDispatchQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
//        createMemoryLeak()
        
        // retain cycle
        self.main = MyDispatchQueue.main
        
        MyDispatchQueue.main.async { [weak self] in
            print("\(self)")
        }
    }
    
    deinit { print("DEINIT: VC2") }
}

