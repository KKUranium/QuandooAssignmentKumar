//
//  UserPostListViewController.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

class UserPostListViewController: UIViewController {

    @IBOutlet weak var userPostListTableView: UITableView!
    
    var presenter : UserPostListPresenter?
    var dataSource = [UserPostListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userPostListTableView.rowHeight = UITableViewAutomaticDimension
        userPostListTableView.estimatedRowHeight = 70
        
        presenter?.viewDidLoad();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UserPostListViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSource.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPostCell", for: indexPath) as! UserPostListTableCell;
        
        cell.titleLabel.text = self.dataSource[indexPath.row].title;
        cell.bodyLabel.text = self.dataSource[indexPath.row].body;
        
        cell.layoutIfNeeded()
        
        return cell;
    }
}

extension UserPostListViewController : UserPostListPresenterOutput
{
    func updateUserPostList(userPostsArray: [UserPostListModel])
    {
        //reload the datasource and tableview
        self.dataSource = userPostsArray;
        DispatchQueue.main.async {
            self.userPostListTableView.reloadData()
        }
    }
    
    func didFailToFetchUserPostList(message  :String)
    {
        DispatchQueue.main.async {
            CustomUIComponent.showAlert("", message: message);
        }
        print(message);
    }
    
    func updateTitle(name : String)
    {
        self.title = name;
    }
}
