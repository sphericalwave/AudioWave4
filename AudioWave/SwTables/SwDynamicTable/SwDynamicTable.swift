//
//  SwDynamicTable.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-08-23.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

//import UIKit
//import CoreData
//
//class SwDynamicTable<T:NSFetchRequestResult>: UITableViewController {
//    
//    //MARK: - Properties
//    let data: SwDynamicTableData<T>
//    let cellId = "MenuTableDataCell"
//    //let date: Date
//    
//    //MARK: - Construction
//    required init?(coder aDecoder: NSCoder) { fatalError() }
//    
//    init(data: SwDynamicTableData<T>, style: UITableView.Style) {
//        self.data = data
//        super.init(style: style)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//        data.fetch()
//        //data.resultControl.delegate = self
//    }
//    
//    //MARK: - Public
//    func fetch(predicate: NSPredicate, sort: [NSSortDescriptor]) {
//        data.fetch(predicate: predicate, sort: sort)
//        self.tableView.reloadData()
//    }
//    
//    //MARK: - Table Delegate
////    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        fatalError("Override in Concrete Subclass")
////    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let detailScreen = data.detailScreen(at: indexPath)
//        navigationController?.pushViewController(detailScreen, animated: true)
//    }
//    
//    //MARK: - Table Datasource
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return data.numberOfSections()
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count = data.numberOfRows(in: section)
//        if count == 0{
//            tableView.setEmptyView(title: "SwDyanmicTable - No Data!",
//                                   message: "Your Data will be in here.")
//        }
//        else { tableView.restore() }
//        return count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        configureCell(cell, at: indexPath)
//        return cell
//    }
//    
//    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
//        let swCell = data.cellForRow(at: indexPath)
//        self.addChild(swCell)
//        let newView = setupViewLayoutConstraints(viewController: swCell, rect: cell.contentView.frame)
//        cell.contentView.addSubview(newView)
//        swCell.didMove(toParent: self)
//        cell.selectionStyle = swCell.selectionStyle
//        cell.accessoryType = swCell.accessoryType
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return data.heightForRow(at: indexPath)
//    }
//    
////    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        return data.heightForHeaderInSection(section: section)
////    }
////
////    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        return nil
////    }
//
//}
//
////extension SwDynamicTable<T:NSManagedObject>: NSFetchedResultsControllerDelegate {
////
////    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
////        self.tableView.beginUpdates()
////    }
////
////    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//////        switch type {
//////        case .insert:
//////            tableView.insertRows(at: [newIndexPath!], with: .fade)
//////        case .delete:
//////            tableView.deleteRows(at: [indexPath!], with: .fade)
//////        case .update:
//////            guard let cell = tableView.cellForRow(at: indexPath!) else { fatalError() }
//////            configureCell(cell, at: indexPath!)
//////        case .move:
//////            print("Maybe Later")
//////        }
////    }
////
////    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
////        self.tableView.endUpdates()
////    }
////}
