//
//  ViewController.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/26/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var userListTableView: UITableView!
    
    var presenter : UserListPresenter?
    var dataSource = [UserListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userListTableView.rowHeight = UITableViewAutomaticDimension
        userListTableView.estimatedRowHeight = 120
        
        presenter?.viewDidLoad();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UserListViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSource.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserListTableViewCell;
    
        cell.nameLabel.text = self.dataSource[indexPath.row].name;
        cell.usernameLabel.text = self.dataSource[indexPath.row].username;
        cell.emailLabel.text = self.dataSource[indexPath.row].email;
        cell.addressLabel.text = self.dataSource[indexPath.row].address;
        
        cell.layoutIfNeeded()
        
        return cell;
    }
}

extension UserListViewController : UserListPresenterOutput
{
    func updateUserList(userArray: [UserListModel])
    {
        //reload the datasource and tableview
        self.dataSource = userArray;
        DispatchQueue.main.async { 
            self.userListTableView.reloadData()
        }
    }
    
    func didFailToFetchUserList(message  :String)
    {
        print(message);
    }
}


