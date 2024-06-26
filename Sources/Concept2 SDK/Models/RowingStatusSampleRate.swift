//
//  RowingStatusSampleRate.swift
//  Pods
//
//  Created by Jesse Curry on 10/27/15.
//
//

import Foundation

struct RowingStatusSampleRate: CharacteristicModel, CustomDebugStringConvertible {
  let DataLength = 1
  
  /*

  */
  
  var sampleRate:RowingStatusSampleRateType?
  
  init(fromData data: Data) {
      var arr = [UInt8](repeating: 0, count: DataLength)
    (data as NSData).getBytes(&arr, length: DataLength)
    
    sampleRate = RowingStatusSampleRateType(rawValue: arr[0])
  }
  
  // MARK: PerformanceMonitor
  func updatePerformanceMonitor(performanceMonitor:PerformanceMonitor) {
    performanceMonitor.sampleRate.value = sampleRate
  }
  
  // MARK: -
  var debugDescription:String {
      return "[RowingStatusSampleRate]\n\tsampleRate: \(String(describing: sampleRate))"
  }
}

/*
  NSData extension to allow writing of this value
 */
extension NSData {
  convenience init(rowingStatusSampleRate:RowingStatusSampleRateType) {
    let arr:[UInt8] = [rowingStatusSampleRate.rawValue];
    
    self.init(bytes: arr, length: arr.count * MemoryLayout<UInt8>.size)
  }
}
