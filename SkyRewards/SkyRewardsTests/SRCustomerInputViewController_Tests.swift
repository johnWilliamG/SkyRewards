//
//  SRCustomerInputViewController_Tests.swift
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import XCTest

class SRCustomerInputViewController_Tests: XCTestCase {
    
    func testViewDidLoad() {
        
        //GIVEN I have a view controller
        let viewController = SRCustomerInputViewController()
        viewController.subscriptionsTableView = SRSubscriptionsTableView()
        
        //And the TableView's DataSource and Delegate are nil
        XCTAssertNil(viewController.subscriptionsTableView.delegate, "expected delegate to be nil")
        XCTAssertNil(viewController.subscriptionsTableView.dataSource, "epected datasource to be nil")
        
        //WHEN viewDidLoad is called
        viewController.viewDidLoad()
        
        //THEN the View Controller's TableView's Delegate and DataSource is assigned
        XCTAssertNotNil(viewController.subscriptionsTableView.dataSource, "expected datasource to be assigned")
        XCTAssertNotNil(viewController.subscriptionsTableView.delegate, "expected delegate to be assigned")
    }
    
    func testPropertyGetters () {
        
        //GIVEN I have a view controller
        let viewController = SRCustomerInputViewController()
        
        //and userDefaults are injected
        setUserDefaultsUpWithTestData()
        
        //THEN rewards service is assigned
        XCTAssert(viewController.rewardsService.isKind(of: SRRewardsService.self), "Expected view controller rewards service to not be nil")
        
        //Userdefaults are the standard User Defaults
        XCTAssert(viewController.userDefaults == UserDefaults.standard, "view controller defualts should be standard user defaults")
        
        //Only Selected Channels are in subscriptions
        XCTAssert(viewController.subscriptions == ["SPORTS"], "expected ['SPORTS'] got \(viewController.subscriptions)")
    }
    
    override func tearDown() {
         UserDefaults.standard.removeObject(forKey: SRAppKey)
    }
    
    //MARK: - User Default Helpers
    func setUserDefaultsUpWithTestData() {
        
        var deviceStorage = Dictionary<String,Any>()
        deviceStorage["SPORTS"] = "Selected"
        deviceStorage["MUSIC"] = "Unselected"
        UserDefaults.standard.removeObject(forKey: SRAppKey)
        UserDefaults.standard.set(deviceStorage, forKey: SRAppKey)
        UserDefaults.standard.synchronize()
    }
}
