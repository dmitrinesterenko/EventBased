//
//  EventBased.swift
//
// Dmitri: This is a basterdized version of the control flow example from here
// http://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/ where I had learned quite a lot about one way of doing event messaging

// Updates: 
//  Naming the Marshall methods in a jQuery way
//  Adding an input parameter(s) to the target method
//
import Foundation
// Needs this to prevent the app from crashing when linking with the library and a project that doesn't have UIKit
// (Such as my test project) reference: http://stackoverflow.com/questions/26262262/ios-app-crashed-when-i-try-link-swift-framework-with-objective-c-project
import UIKit
protocol EventBased{
    func invoke(parameters:AnyObject)
}

struct Event<T:AnyObject> : EventBased{
    weak var instance: T?
    //var parameters: AnyObject
    let method: (T) -> (AnyObject) -> ()
    
    func invoke(parameters:AnyObject) -> () {
        if let t = instance {
            method(t)(parameters)
        }
    
    }
}


class Marshall{
    var actions = [String: EventBased]()
  
    func on<T: AnyObject>( eventName: String, instance: T, method: (T) -> (AnyObject) -> (), parameters: AnyObject) {
        actions[eventName] = Event(instance: instance, method: method)
    }
    
    func off(controlEvent: String) {
        actions[controlEvent] = nil
    }
    
    func contains(eventName: String) -> Bool{
        return actions.indexForKey(eventName) != nil
    }
    
    func trigger(controlEvent: String, parameters: AnyObject) {
        actions[controlEvent]?.invoke(parameters)
    }
    
    
}



