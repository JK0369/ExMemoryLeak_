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
    var storedSomeFuncClass: SomeFuncClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // retain cycle1
//        createMemoryLeak()
        
        // retain cycle2
//        self.main = MyDispatchQueue.main
//        MyDispatchQueue.main.async {
//            print("\(self)")
//        }
        
        // retain cycle3
        storedSomeFuncClass = SomeFuncClass()
        storedSomeFuncClass?.someFunc {
            print("\(self)")
        }
        
        // retain cycle x
        let c = SomeFuncClass()
        c.someFunc {
            print("\(self)")
        }
    }
    
    deinit { print("DEINIT: VC2") }
}

class SomeFuncClass {
    var closure: (() -> ())?
    
    func someFunc(_ closure: @escaping () -> ()) {
        self.closure = closure
    }
}
