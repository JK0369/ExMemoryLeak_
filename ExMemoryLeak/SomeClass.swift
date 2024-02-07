//
//  SomeClass.swift
//  ExMemoryLeak
//
//  Created by 김종권 on 2024/02/07.
//

import Foundation

class SomeClass {
    var closure: (() -> Void)?
    
    func setupClosure() {
        closure = {
            // retain cycle
            print("SomeClass instance is \(self)")
        }
    }
    
    deinit {
        print("SomeClass instance is being deinitialized.")
    }
    
    func someFunc(_ closure: @escaping (Void) -> Void) {
    }
}

func createMemoryLeak() {
    let object: SomeClass = SomeClass()
    object.setupClosure()
    object.closure?()
}
