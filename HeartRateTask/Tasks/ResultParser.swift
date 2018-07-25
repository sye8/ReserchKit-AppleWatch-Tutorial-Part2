//
//  ResultParser.swift
//  HeartRateTask
//
//  Created by 叶思帆 on 25/07/2018.
//  Copyright © 2018 Sifan Ye. All rights reserved.
//

import ResearchKit

struct TaskResults{
    static var startDate = Date.distantPast
    static var endDate = Date.distantFuture
}

struct ResultParser{
    
    static func getHKData(startDate: Date, endDate: Date){
        let healthStore = HKHealthStore()
        let hrType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortDescriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]
        let hrQuery = HKSampleQuery(sampleType: hrType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: sortDescriptors){
            (query:HKSampleQuery, results:[HKSample]?, error: Error?) -> Void in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    print("Error: \(String(describing: error))")
                    return
                }
                guard let results = results as? [HKQuantitySample] else {
                    print("Data conversion error")
                    return
                }
                if results.count == 0 {
                    print("Empty Results")
                    return
                }
                for result in results{
                    print("HR: \(ORKValueRange(value: result.quantity.doubleValue(for: HKUnit(from: "count/min"))))")
                }
            }
        }
        healthStore.execute(hrQuery)
    }
}
