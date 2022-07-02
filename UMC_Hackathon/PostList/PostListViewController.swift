// 글 목록
// - 닉네임 없음
// - 글쓰기 버튼 (플로팅)

import UIKit

final class PostListViewController: UIViewController {
    
    var userPosts: [PostListResult] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 60 / 2
        button.backgroundColor = .systemGreen
        button.alpha = 0.7
        
        let image = UIImage(systemName: "pencil", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(floatingButton)
        
        self.tableView.reloadData()
        self.tableView.separatorStyle = .none
        self.tableView.layoutIfNeeded()
        
        self.floatingButton.addTarget(self, action: #selector(onPressFloatingButton), for: .touchUpInside)
        
        PostListDataManager().gets(self)
    }
    
    @objc func pullToRefresh(_ sender: Any) {
        // 새로고침 시 갱신되어야 할 내용들
        self.tableView.reloadData()
    }
    
    @objc func onPressFloatingButton(sender: Any) {
        let postUploadViewController = PostUploadViewController()
        self.navigationController?.pushViewController(postUploadViewController, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        floatingButton.frame = CGRect(x: view.frame.size.width - 80,
                                      y: view.frame.size.height - 100,
                                      width: 60, height: 60)
    }

}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        cell.mainLabel.text = userPosts[indexPath.row].title
        cell.subLabel.text = userPosts[indexPath.row].content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.postId = userPosts[indexPath.row].postIdx
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


// MARK: - API 통신 메소드
extension PostListViewController {
    func successAPI(_ result : PostListModel) {
        userPosts = result.result
        tableView.reloadData()
    }
}
