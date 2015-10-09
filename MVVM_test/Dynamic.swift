//
//  Dynamic.swift
//  MVVM_test
//
//  Created by HasegawaYasuo on 2015/10/06.
//  Copyright © 2015年 HasegawaYasuo. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = T -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}