//
//  ViewController.swift
//  MVVM_test
//  
//  Testing MVVM based on
//  http://rasic.info/from-mvc-to-mvvm-in-swift/
//
//  I only tested latest xcode7.0.1
//  Do customize as your own risk.
//
//  Created by HasegawaYasuo on 2015/10/06.
//  Copyright © 2015年 HasegawaYasuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bodyTextLabel: UILabel!
    var titleLabel: UILabel!
    var dateLabel: UILabel!
    
    var viewModel: MVVMTestViewViewModel! {
        didSet {
            viewModel.title.bindAndFire {
                [unowned self] in self.titleLabel.text = $0
            }
            
            viewModel.date.bindAndFire {
                [unowned self] in self.dateLabel.text = $0
            }
            
            viewModel.body.bindAndFire {
                [unowned self] in self.bodyTextLabel.text = $0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUI()
        
        let testData: MVVMTestData = MVVMTestData()
        
        // set up default value
        testData.title = "1"
        testData.body = "2"
        testData.date = NSDate()
        
        let viewModel = MVVMTestViewViewModelFromMVVMTest(testData)
        self.viewModel = viewModel
    }
    
    func addUI() {
        self.titleLabel = UILabel(frame: CGRectMake(0, 50, 300, 20));
        self.titleLabel.text = "";
        self.view.addSubview(self.titleLabel);
        
        self.dateLabel = UILabel(frame: CGRectMake(0, 100, 300, 20));
        self.dateLabel.text = "";
        self.view.addSubview(self.dateLabel);
        
        self.bodyTextLabel = UILabel(frame: CGRectMake(0, 150, 300, 20));
        self.bodyTextLabel.text = "";
        self.view.addSubview(self.bodyTextLabel);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

