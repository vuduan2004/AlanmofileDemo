//
//  ConversationsTableViewController.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import UIKit
import Kingfisher
class ConversationsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var ConversationsData : [ConversationResponseModel] = []
    var filterConversationsData : [ConversationResponseModel] = []
    @IBOutlet weak var tblConversations: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblConversations.dataSource = self
        tblConversations.delegate = self
        searchBar.delegate = self
        tblConversations.register(UINib(nibName: "ConversationssTableViewCell", bundle: nil), forCellReuseIdentifier: "ConversationsIdentifier")
        callAPIConversations()
 
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterConversationsData = ConversationsData
        } else {
            filterConversationsData.removeAll()
            filterConversationsData = ConversationsData.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
            tblConversations.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        filterConversationsData.remove(at: indexPath.row)
        tblConversations.reloadData()
    }
    func callAPIConversations() {
        APIHandler.init().getConversations {
            ConversationResponseData in
            self.ConversationsData = ConversationResponseData
            self.filterConversationsData = ConversationResponseData
            self.tblConversations.reloadData()
        }
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return filterConversationsData.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tblConversations.dequeueReusableCell(withIdentifier: "ConversationsIdentifier") as! ConversationssTableViewCell
         cell.lblName.text = filterConversationsData[indexPath.row].name
         let urlAvata = URL(string: filterConversationsData[indexPath.row].avatar)
         cell.imgAvatar.kf.setImage(with:urlAvata)
         cell.lblIDConversation.text = filterConversationsData[indexPath.row].id
         cell.lblCreateAt.text = filterConversationsData[indexPath.row].createdAt
         return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
