//
//  CharacteristicModelProtocol.swift
//  Pods
//
//  Created by Jesse Curry on 10/24/15.
//
//

import Foundation

protocol CharacteristicModel {
  init(fromData data:Data)
  
  func updatePerformanceMonitor(performanceMonitor:PerformanceMonitor)
}
