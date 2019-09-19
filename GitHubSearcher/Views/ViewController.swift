//
//  ViewController.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/18/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchDisplayDelegate,UISearchResultsUpdating,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource{
    var username:String = ""
    var repos:String = ""
    var avatarImg : UIImage? = nil
    var searchUserText: String = ""
    @IBOutlet weak var userTableView: UITableView!
    
    var gitUserInfo:GitHubUser?
    var userSearchResults:Array<GitHubUser>? = []
    var rowSelected:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func filterContentForSearchText(searchText: String) {
            self.userSearchResults = nil
            return
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchUserText = (searchBar.text?.lowercased())!
      print("search text is : \(self.searchUserText)")
        
        guard let gitUrl = URL(string: "https://api.github.com/users/" + self.searchUserText) else { return }

        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in

            guard let data = data else { return }
            do {

                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHubUser.self, from: data)
                
                print("gitData is \(gitData)")


                DispatchQueue.main.sync {

                    self.userSearchResults?.append(gitData)
                    print("Searched Results array count is \(String(describing: self.userSearchResults?.count))")
                    self.userTableView.reloadData()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       // <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.userSearchResults?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDisplayCell", for: indexPath) as! SearchDisplayCell
        let userInfo:GitHubUser = (self.userSearchResults?[indexPath.row])!
         if let gimage = userInfo.avatarUrl {
                                   let data = try? Data(contentsOf: gimage)
                                    let image: UIImage = UIImage(data: data!)!
                                   self.avatarImg = image
                               }
        if let image = self.avatarImg{
            cell.avatarImageIcon?.image = image
        }
        if let userName = self.userSearchResults?[indexPath.row].name {
            cell.userNameLabel?.text = userName
        }
        
        if let noOfRepo = self.userSearchResults?[indexPath.row].noOfRepos{
            let reponum = (noOfRepo as NSNumber).stringValue
            cell.numberOfRepositoryLabel?.text = "Repo:\(reponum)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row;
        self.gitUserInfo = (self.userSearchResults?[indexPath.row])!
        print("gitUserInfo is \(gitUserInfo)")
        
        performSegue(withIdentifier:"mySegue", sender: self)
//        let vc = UserInfoViewController(userInfo : self.gitUserInfo)
//        //vc.userInfo = self.gitUserInfo
//
//        self.show(vc, sender: (Any).self)
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func resetConstraints(isUserDetailsViewVisible:Bool) {
        if(isUserDetailsViewVisible) {
            //edit table views top constraint
        } else {
            // reset tableViews top constraint
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "mySegue" {
        if segue.destination is UserInfoViewController
        {
            let vc = segue.destination as? UserInfoViewController
            vc?.userInfo = self.gitUserInfo
        }
    }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.userSearchResults = nil
        self.userTableView.reloadData()
    }
}


