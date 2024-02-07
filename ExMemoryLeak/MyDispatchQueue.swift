//
//  MyDispatchQueue.swift
//  ExMemoryLeak
//
//  Created by 김종권 on 2024/02/07.
//

import Foundation

class MyDispatchQueue {
    private var closure: (() -> Void)?
    static let main = MyDispatchQueue()
    
    private init() { print("INIT: MyDispatchQueue") }
    
    func async(_ closure: @escaping () -> ()) {
        self.closure = closure
    }
    
    deinit { print("DEINIT: MyDispatchQueue") }
}
