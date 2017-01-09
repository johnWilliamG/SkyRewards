//
//  SRDefaultsUtils_Tests.swift
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 08/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import XCTest

class SRDefaultsUtils_Tests:XCTestCase {
    
    override func setUp() {
        var deviceStorage = Dictionary<String,Any>()
        deviceStorage["SPORTS"] = "Selected"
        deviceStorage["MUSIC"] = "Unselected"
        UserDefaults.standard.removeObject(forKey: SRAppKey)
        UserDefaults.standard.set(deviceStorage, forKey: SRAppKey)
        UserDefaults.standard.synchronize()
    }
    
    func testUpdateDefaultsWithChannelAndSelected() {
        
        var compeltionHandlerCalled: Bool = false
        
        //GIVEN I have default utilites
        //WHEN updatedefaults is called
        SRDefaultsUtils.updateDefaults(with: "SPORTS", selected: false, withCompletionHandler: {
            
            compeltionHandlerCalled = true
        })
        
        //THEN the userdefaults are updated appropriately
        guard let appDefaults = UserDefaults.standard.object(forKey: SRAppKey) as? NSDictionary! else {
            fatalError()
        }
        guard let sportsObject =  appDefaults.object(forKey: "SPORTS") as? String! else {
            fatalError()
        }
        
        XCTAssert(sportsObject == SRChannelUnselected, "expected \(sportsObject) to be Unselected")
        
        //and the completion handler is called
        XCTAssert(compeltionHandlerCalled)
        
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: SRAppKey)
    }
}
