//
//  Task.swift
//  StoreKitRvm
//

import Foundation

/**
  Task around task, exposed to RoboVM allows to be canceled
 */
@objc public class RvmTask: NSObject {
    let task: Task<Any, Error>
    init(task: Task<Any, Error>) {
        self.task = task
    }
    @objc public func cancel() { task.cancel() }
}

extension Task<Any, Error> {
    func toRvm() -> RvmTask { return RvmTask(task: self) }
}
