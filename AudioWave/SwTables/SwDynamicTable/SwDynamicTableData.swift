//
//  SwDynamicTableData.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-08-23.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

//import CoreData
//import UIKit
//
//class SwDynamicTableData<T:NSFetchRequestResult>: NSObject {
//    
//    //MARK: - Properties
//    let frc: NSFetchedResultsController<T>
//    
//    //MARK: - Construction
//    
//    init(frc: NSFetchedResultsController<T>)
//    {
//        self.frc = frc
//        super.init()
//    }
//    
//    required init?(coder aDecoder: NSCoder) { fatalError() }
//    
//    //MARK: - Public
//    func fetch()
//    {
//        do { try self.frc.performFetch() }
//        catch {
//            let fetchError = error as NSError
//            print("Unable to Perform Fetch Request")
//            print("\(fetchError), \(fetchError.localizedDescription)")
//        }
//    }
//    
//    func fetch(predicate: NSPredicate, sort: [NSSortDescriptor])
//    {
//        frc.fetchRequest.predicate = predicate
//        frc.fetchRequest.sortDescriptors = sort
//        //FIXME: Fix Cache Name
//        NSFetchedResultsController<CDEntry>.deleteCache(withName:"localFoods") //MARK: This should be set
//        self.fetch()
//    }
//    
//    func object(at indexPath: IndexPath) -> T {
//        let foodEntry = frc.object(at: indexPath)
//        return foodEntry
//    }
//    
//    //MARK: - CRUD
//    func delete(managedObject: NSManagedObject) {
//        frc.managedObjectContext.delete(managedObject)
//    }
//    
//    //MARK: - DataSource
//    func numberOfSections() -> Int {
//        guard let sectionCount = frc.sections?.count else { fatalError() }
//        return sectionCount
//    }
//    
//    func numberOfRows(in section: Int) -> Int {
//        guard let rowCount = frc.fetchedObjects?.count else { fatalError() }
//        return rowCount
//    }
//    
//    func heightForRow(at indexPath: IndexPath) -> CGFloat {
//        return 64 //FIXME: Make Dynamic
//    }
//    
//    //MARK: - Override
//    func cellForRow(at indexPath: IndexPath) -> SwCell {
//        fatalError("Override in Concrete Subclass")
//    }
//    
//    func detailScreen(at indexPath: IndexPath) -> UIViewController {
//        fatalError("Override in Concrete Subclass")
//    }
//    
//    func heightForHeaderInSection( section: Int) -> CGFloat {
//        return CGFloat.leastNormalMagnitude
//    }
//}
