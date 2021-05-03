//
//  ViewController.swift
//  SwiftTbSettingProject
//
//  Created by Tb on 2021/5/2.
//

import UIKit
import KakaJSON
import SnapKit

class ViewController: UIViewController {
    
    let identifier = "cell"
    
    private lazy var customTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width:kScreenW , height: kScreenH)
        tableView.register(TbCustomTableViewCell.self, forCellReuseIdentifier: identifier)
        
        let headerBgView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 185))
        let headerView = LSNewMineHeaderView.initNewMineHeaderView()
        headerView.frame = headerBgView.bounds
        headerBgView.addSubview(headerView)
        tableView.tableHeaderView = headerBgView
        
        return tableView
    }()
    
    var mineModelArray : [MineModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        customTableView.backgroundColor = .clear
        self.view.addSubview(customTableView)
        
        let jsonArray = readFile(fileName: "Setting")
        mineModelArray = jsonArray.kj.modelArray(type: MineModel.self) as? [MineModel]
        self.customTableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return mineModelArray?.count ?? 0
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TbCustomTableViewCell
        let model = self.mineModelArray?[indexPath.section]
        cell.mineModel = model
        cell.itemClickBlock = {
            print("click title:\($0.imageTitle)")
        }
        return cell
    }
}

extension ViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let mineModel = self.mineModelArray?[indexPath.section]
        let imageCount = mineModel?.imageDataModel?.count ?? 0
        
        var row = imageCount / 4
        let col = imageCount % 4
        
        if col != 0 {
            row = row + 1
        }
        return CGFloat(row * 90 + 45)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let iv = UIView()
        return iv
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let iv = UIView()
        iv.backgroundColor = .lightGray
        return iv
    }
}


