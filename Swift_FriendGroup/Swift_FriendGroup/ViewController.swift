//
//  ViewController.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit
import HandyJSON
import YYKit

class ViewController: UIViewController {

    let identifier = "cell"
    
    private lazy var customTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width:kScreenW , height: kScreenH)
        tableView.register(TbCustomTableViewCell.self, forCellReuseIdentifier: identifier)
        
//        let headerBgView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 185))
//        let headerView = LSNewMineHeaderView.initNewMineHeaderView()
//        headerView.frame = headerBgView.bounds
//        headerBgView.addSubview(headerView)
//        tableView.tableHeaderView = headerBgView
        
        return tableView
    }()
    var listDataModels : [DataModel] = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        customTableView.backgroundColor = .clear
        self.view.addSubview(customTableView)
        
        loadData()
    }
    
    func loadData(){
        let data = readFile(fileName: "dada")
        let dataModels = JSONDeserializer<DataResultModel>.deserializeFrom(json: data)
        listDataModels = dataModels?.data ?? []
        self.customTableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return listDataModels.count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TbCustomTableViewCell
        let model = self.listDataModels[indexPath.section]
        cell.model = model
        print(cell)
       
        return cell
    }
}

extension ViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.listDataModels[indexPath.section]
        
        return model.photoViewSize.height + model.commentTextHeight + CGFloat(90)  + 15
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


