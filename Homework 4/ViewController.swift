//
//  ViewController.swift
//  Homework 4
//
//  Created by Beavean on 01.07.2022.
//

import UIKit
import Alamofire
import SDWebImage


class ViewController: UIViewController {
    @IBOutlet weak var fakeInstaTableView: UITableView!
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        fakeInstaTableView.dataSource = self
        fakeInstaTableView.delegate = self
        
        fakeInstaTableView.register(UINib(nibName: "fakeInstaCell", bundle: nil), forCellReuseIdentifier: "fakeInstaCell")
        
        let decodingParameters: [String: Any] = [
            "token": "q7xeBuGPz0y8d1UJf4zeSw",
            "data": [
                "nickname": "personNickname",
                "numberOfLikes": "numberInt",
                "numberOfComments":  "numberInt",
                "postedTimeAgo": "numberInt",
                "postCommentary": "stringShort",
                "postImage": "https://picsum.photos/500",
                "_repeat": 30
            ]
        ]
    
        let url = "https://app.fakejson.com/q"
        AF.request(url, method: .post, parameters: decodingParameters,encoding: JSONEncoding.default).responseJSON { response in
            do {
                let parsedData = try JSONDecoder().decode([ServerResponse].self, from: response.data!)
                print(parsedData.last!)
            } catch {
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 562
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post =  tableView.dequeueReusableCell(withIdentifier: "fakeInstaCell", for: indexPath) as? fakeInstaCell else { return UITableViewCell() }
        post.selectionStyle = .none
        return post
    }
}

