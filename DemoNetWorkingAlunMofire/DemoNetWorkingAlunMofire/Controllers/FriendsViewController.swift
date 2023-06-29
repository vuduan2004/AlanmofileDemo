//
//  FriendsViewController.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var FriendsData : [FriendsResponseModel] = []
    @IBOutlet weak var tblFriends: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsIdentifier")
        callAPIFriends()
  
    }
    func callAPIFriends() {
        APIHandler.init().getFriends {
            FriendsResponseData in
            self.FriendsData = FriendsResponseData
            self.tblFriends.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "FriendsIdentifier") as!
        FriendsTableViewCell
        cell.lblID.text = FriendsData[indexPath.row].id
        cell.lblfullName.text = FriendsData[indexPath.row].fullname
        let urlAvt = URL(string: FriendsData[indexPath.row].avatar)
        cell.imgAvt.kf.setImage(with: urlAvt)
        return cell
    }
    
   
}
