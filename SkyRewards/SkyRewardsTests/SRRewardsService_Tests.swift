//
//  SRRewardsService_Tests.swift
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 08/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import XCTest

class SRRewardsService_Tests:XCTestCase {
    
    override func setUp() {
        var deviceStorage = Dictionary<String,Any>()
        deviceStorage["SPORTS"] = "Selected"
        deviceStorage["MUSIC"] = "Unselected"
        UserDefaults.standard.removeObject(forKey: SRAppKey)
        UserDefaults.standard.set(deviceStorage, forKey: SRAppKey)
        UserDefaults.standard.synchronize()
    }
    
    
    func testUpdateRewardsWithValidDicitionary () {
        
        //GIVEN I have a rewards service, input view controller
        let viewController = SRCustomerInputViewController()
        let rewardsService = SRRewardsService()
        viewController.rewardsService = rewardsService
        viewController.viewDidLoad()
        
        //WHEN I update rewards with vaild data
        viewController.checkSubscriptionPressed(nil)
        
        //THEN Alert View Controller should be presented with correct title
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            
            let rootViewController = UIApplication.shared.keyWindow?.rootViewController
            
            XCTAssert((rootViewController?.isKind(of: UIAlertController.self))!)
            
            if ((rootViewController?.isKind(of: UIAlertController.self))!) {
                XCTAssert(rootViewController?.title == "Awesome these are your rewards!","expected \(rootViewController?.title) to be Awesome these are your rewards!")
            }
        })
    }
    
    func testUpdateRewardsWithInvalidDicitonary () {
        
        //GIVEN I have a rewards service, input view controller
        let viewController = SRCustomerInputViewController()
        let rewardsService = SRRewardsService()
        viewController.rewardsService = rewardsService
        viewController.viewDidLoad()
        
        //AND I haeve Invalid Data
        UserDefaults.standard.set("Test", forKey: SRAppKey)

        
        //WHEN I update rewards with vaild data
        viewController.checkSubscriptionPressed(nil)
        
        //THEN Alert View Controller should be presented with correct title
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            
            let rootViewController = UIApplication.shared.keyWindow?.rootViewController
            
            XCTAssert((rootViewController?.isKind(of: UIAlertController.self))!)
            
            if ((rootViewController?.isKind(of: UIAlertController.self))!) {
                XCTAssert(rootViewController?.title == "Sorry there was an error!", "expected \(rootViewController?.title) to be Sorry there was an error")
            }
        })
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: SRAppKey)
    }
}
