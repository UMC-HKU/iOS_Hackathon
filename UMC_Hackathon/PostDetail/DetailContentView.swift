//
//  DetailContentView.swift
//  DetailPage
//
//  Created by Sangchul Park on 2022/07/02.
//

import Foundation
import UIKit

final class DetailContentView: UITableViewHeaderFooterView {
    
    
    
    public let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "제목입니다"
        label.numberOfLines = 1
        return label
    }()
    
    public let contentLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다"
        label.numberOfLines = 0
        return label
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    } ()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .white
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.contentLabel)
        
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 26),
            self.contentLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
