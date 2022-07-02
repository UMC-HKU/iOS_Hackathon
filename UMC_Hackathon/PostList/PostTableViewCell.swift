//
//  PostTableViewCell.swift
//  UMC iOS - 글목록
//
//  Created by 강현우 on 2022/07/01.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // Make the CellReuseIdentifier as a string variable in order to prevent typo
    static let identifier = "PostTableViewCell"
    
    public let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "제목입니다. 제목입니다."
        label.numberOfLines = 1
        return label
    }()
    
    public let subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "내용 첫번째 줄 입니다. 내용 첫번째 줄 입니다. 내용이 정말 깁니다. 정말 길어요. 이렇게 깁니다."
        label.numberOfLines = 1
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        // MARK: Adding Subviews
        self.contentView.addSubview(self.mainLabel)
        self.contentView.addSubview(self.subLabel)
        self.contentView.addSubview(self.separator)
        
        // MARK: Remove Auto-resizing
        self.mainLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subLabel.translatesAutoresizingMaskIntoConstraints = false
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Setting Constraints
        NSLayoutConstraint.activate([
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            self.mainLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            
            self.subLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 10),
            self.subLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            self.subLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            self.subLabel.bottomAnchor.constraint(equalTo: self.separator.topAnchor, constant: -5),
            
            self.separator.heightAnchor.constraint(equalToConstant: 1),
            self.separator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.separator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
