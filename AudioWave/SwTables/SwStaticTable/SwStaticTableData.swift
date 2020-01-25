//
//  SwStaticTableData.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-07-03.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit
import CoreData

class SwStaticTableData {
    
    let sections: [[SwCell]]
    
    init(sections: [[SwCell]]) {
        self.sections = sections
    }
    
    func numberOfSections() -> Int { return sections.count }
    
    func numberOfRows(in section: Int) -> Int {
        let section = sections[section]
        return section.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> SwCell {
        let section = sections[indexPath.section]
        return section[indexPath.row]
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        let height = section[indexPath.row].height()
        return height
    }
}
