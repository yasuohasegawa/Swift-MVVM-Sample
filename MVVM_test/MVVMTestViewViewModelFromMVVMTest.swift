//
//  MVVMTestViewViewModelFromMVVMTest.swift
//  MVVM_test
//
//  Created by HasegawaYasuo on 2015/10/06.
//  Copyright © 2015年 HasegawaYasuo. All rights reserved.
//

import Foundation
protocol MVVMTestViewViewModel {
    var title: Dynamic<String> { get }
    var body: Dynamic<String> { get }
    var date: Dynamic<String> { get }
}

class MVVMTestViewViewModelFromMVVMTest: MVVMTestViewViewModel {
    var testData: MVVMTestData
    var title: Dynamic<String>
    var body: Dynamic<String>
    var date: Dynamic<String>
    
    init(_ data: MVVMTestData) {
        self.testData = data
        
        self.title = Dynamic(data.title)
        self.body = Dynamic(data.body)
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        self.date = Dynamic(dateFormatter.string(from: data.date as Date))
        
        var delay = 3.0 * Double(NSEC_PER_SEC)
        var time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            self.title.value = "test"
        })
        
        delay = 4.0 * Double(NSEC_PER_SEC)
        time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.full
            self.date.value = dateFormatter.string(from: data.date as Date)
        })
        
        delay = 5.0 * Double(NSEC_PER_SEC)
        time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            self.body.value = "body test"
        })
    }
}
