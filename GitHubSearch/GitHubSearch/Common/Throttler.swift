//
//  Throttler.swift
//  GitHubSearch
//
//  Created by Rehan tariq on 15/12/2022.
//

import Foundation

class Throttler {
    private var task: DispatchWorkItem?
    private var throttlerTime: Double = 0.5
    
    init(){}
    init(throttlerTime: Double){
        self.throttlerTime = throttlerTime
    }
 
    deinit {
        print("Throttler object deiniantialized")
    }
    func throttle( block: @escaping () -> Void) {
           task?.cancel()
       let task = DispatchWorkItem {
           block()
        }
        self.task = task
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + throttlerTime, execute: task)
    }
}
