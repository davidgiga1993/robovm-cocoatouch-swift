//
//  Task.swift
//  StoreKitRvm
//

import Foundation

/**
  Task around task, exposed to RoboVM allows to be canceled
 */
@objc
@available(iOS 13.0, *)
public class RvmTask: NSObject {
    let task: Task<Any, Error>
    init(task: Task<Any, Error>) {
        self.task = task
    }
    @objc public func cancel() { task.cancel() }
}

@available(iOS 13.0, *)
extension Task<Any, Error> {
    func toRvm() -> RvmTask { return RvmTask(task: self) }
}
