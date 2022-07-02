//
//  DetailViewController.swift
//  DetailPage
//
//  Created by Sangchul Park on 2022/07/01.
//

import Foundation
import UIKit

final class DetailViewController : UIViewController {
    
    var postId : Int = 0
    var PostDetail : getPostInfo?
    var Comments : [getCommentsInfo] = []
    
    
    //전체 테이블뷰
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    //댓글 달기
    private let replyTextView = ReplyTextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailDataManager().getPostDetail(self, postId)

        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.replyTextView )
        self.replyTextView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(DetailReplyCell.self, forCellReuseIdentifier: "DetailReplyCell")
        self.tableView.register(DetailContentView.self, forHeaderFooterViewReuseIdentifier: "DetailContentView")
        
        //테이블뷰 오토레이아웃 - 꽉 차게
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.replyTextView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor),
            self.replyTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            self.replyTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            self.replyTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            self.replyTextView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
        
        // 키보드 사라지게 하는거
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    // 키보드 사라지게 하는거
    @objc func viewDidTap(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReplyCell") as? DetailReplyCell else { return  UITableViewCell() }
        
        cell.titleLabel.text = Comments[indexPath.row].content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DetailContentView") as? DetailContentView else { return UITableViewCell() }
        view.titleLabel.text = PostDetail?.title
        view.contentLabel.text = PostDetail?.content
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

extension DetailViewController {
    func successAPI (_ result : DetailModel) {
        PostDetail = result.result
        Comments = result.result?.comments ?? []
        tableView.reloadData()
    }
}
