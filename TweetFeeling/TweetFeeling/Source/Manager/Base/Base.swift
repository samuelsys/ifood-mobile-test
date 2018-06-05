//
//  Base.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 31/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

//
//  BaseManager.swift
//  Example
//
//  Created by SalmoJunior on 6/24/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

import Foundation

open class BaseManager {
    //MARK: Properties
    
    var operations: OperationQueue
    
    //MARK: Initializers
    
    /**
     Initialize an BaseManager subclass.
     
     - returns: an instance of BaseManager subclass.
     */
    init() {
        operations = OperationQueue()
    }
    
    /**
     Initialize an BaseManager subclass.
     
     - parameter maxConcurrentOperationCount: maximun number of concurrent operations.
     
     - returns: an instance of BaseManager subclass.
     */
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        
        operations.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
    //MARK: Deinitalizers
    
    deinit {
        operations.cancelAllOperations()
    }
}
