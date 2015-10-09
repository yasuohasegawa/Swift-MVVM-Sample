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
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        self.date = Dynamic(dateFormatter.stringFromDate(data.date))
        
        var delay = 3.0 * Double(NSEC_PER_SEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.title.value = "test"
        })
        
        delay = 4.0 * Double(NSEC_PER_SEC)
        time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
            self.date.value = dateFormatter.stringFromDate(data.date)
        })
        
        delay = 5.0 * Double(NSEC_PER_SEC)
        time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.body.value = "body test"
        })
    }
}