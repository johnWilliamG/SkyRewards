//
//  SRSubscriptionsTableView_Tests.swift
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import XCTest

class SRSubscriptionsTableView_Tests:XCTestCase {
    
    override func setUp() {
        var deviceStorage = Dictionary<String,Any>()
        deviceStorage["SPORTS"] = "Selected"
        deviceStorage["MUSIC"] = "Unselected"
        UserDefaults.standard.removeObject(forKey: SRAppKey)
        UserDefaults.standard.set(deviceStorage, forKey: SRAppKey)
        UserDefaults.standard.synchronize()
    }
    
    func testNumberOfRowsInSections() {
        
        //GIVEN I have CustomerInputViewController and a SRSubscriptionsTableView
        let viewController = SRCustomerInputViewController()
        let tableView = SRSubscriptionsTableView()
        viewController.subscriptionsTableView = tableView
        
        //WHEN the view controller is loaded
        viewController.viewDidLoad()
        
        //THEN the number of rows in section is the same as number of objects in Defaults
        XCTAssert(tableView.numberOfRows(inSection: 0) == 2, "expected 2 got \(tableView.numberOfRows(inSection: 0))")
    }
    
    func testDidSelectRowAtSelectAtIndexPath() {
        
        //GIVEN I have CustomerInputViewController and a SRSubscriptionsTableView
        let viewController = SRCustomerInputViewController()
        let tableView = SRSubscriptionsTableView()
        
        viewController.subscriptionsTableView = tableView
        
        //WHEN the view controller is loaded cell is selected
        viewController.viewDidLoad()
        let indexPath = IndexPath.init(row: 0, section: 0)
        tableView.tableView(tableView, didSelectRowAt: indexPath)
        
        //THEN the userDefaults are updated 
        guard let appDefaults = UserDefaults.standard.object(forKey: SRAppKey) as? NSDictionary! else {
            fatalError()
        }
        guard let sportsObject =  appDefaults.object(forKey: "SPORTS") as? String! else {
            fatalError()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            XCTAssert(sportsObject == SRChannelUnselected, "expected \(sportsObject) to be Unselected")
        })
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: SRAppKey)
    }
}
