//
//  DetailReplyCell.swift
//  DetailPage
//
//  Created by Sangchul Park on 2022/07/01.
//

import Foundation
import UIKit

final class DetailReplyCell : UITableViewCell {
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    } ()
    
    private let nicknameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "익명"
        label.numberOfLines = 1
        return label
    }()
    
    public let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "댓글입니다"
        label.numberOfLines = 0
        return label
    }()
    
    private let nicknameContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.addSubview(self.container)
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.addArrangedSubview(self.nicknameLabel)
        self.container.addArrangedSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6),
            self.container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

