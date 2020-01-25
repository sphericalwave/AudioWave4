//
//  SwTable.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-07-03.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit
import CoreData

class SwStaticTable: UITableViewController {
    
    fileprivate let data: SwStaticTableData
    let cellId = "SwTableCell"
    
    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(data: SwStaticTableData, hideBottomBar: Bool) {
        self.data = data
        super.init(style: .grouped)
        self.title = "SWTable"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.hidesBottomBarWhenPushed = hideBottomBar
    }
    
    //MARK: - Table Datasource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        let swCell = data.cellForRow(at: indexPath)
        self.addChild(swCell)
        let newView = setupViewLayoutConstraints(viewController: swCell, rect: cell.contentView.frame)
        cell.contentView.addSubview(newView)
        swCell.didMove(toParent: self)
        cell.selectionStyle = swCell.selectionStyle
        cell.accessoryType = swCell.accessoryType
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = data.numberOfRows(in: section)
        if count == 0{
            tableView.setEmptyView(title: "SwTable - No Data.",
                                   message: "Your Data will be in here.")
        }
        else { tableView.restore() }
        return count //data.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data.heightForRow(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 10.0 //CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK: - Table Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let swCell = data.cellForRow(at: indexPath)
        swCell.didSelect()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
