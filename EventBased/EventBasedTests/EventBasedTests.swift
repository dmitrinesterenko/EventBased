//
//  EventsTests.swift
//  bitfinex
//
//  Created by Dmitri Nesterenko on 12/22/14.
//  Copyright (c) 2014 Dmitri Nesterenko. All rights reserved.
//

import Foundation
import XCTest

class EventsTests : XCTestCase{
    var expectation : XCTestExpectation?
    
//    func testEventRegistration(){
//        //var sample = Sample()
//        //let sampleInvocation = sample.invokeMe
//        let events = Marshall()
//        events.bind(self, action: EventsTests.invokeMe, eventName: "sample.invocation")
//        XCTAssertTrue(events.contains("sample.invocation"))
//        
//    }
    
//    func testEventTriggering(){
//        expectation = self.expectationWithDescription("calling to get active positions")
//        let events = Marshall()
//        events.bind(self, action: EventsTests.invokeMe, eventName: "sample.invocation")
//        events.trigger("sample.invocation")
//        self.waitForExpectationsWithTimeout(10, handler:nil)
//    }
    
    func testEventTriggeringWithParameters(){
        expectation = self.expectationWithDescription("calling to get active positions")
        let events = Marshall()
        var parameters : AnyObject = "hey there" as String
        events.on("sample.invocation", instance: self, method: EventsTests.invokeMeTwo, parameters: parameters)
        events.trigger("sample.invocation", parameters:parameters)
        self.waitForExpectationsWithTimeout(10, handler:nil)
    }
    
    func invokeMe()->(){
        println("Executed Callback!!")
        expectation?.fulfill()
    }
    
    func invokeMeTwo(data: AnyObject)->(){
        println("Invoked with a string \(data as String) parameter")
        expectation?.fulfill()
    }
}
