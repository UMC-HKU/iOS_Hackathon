//
//  ViewController.swift
//  UMC_Hackathon
//
//  Created by Jong on 2022/07/01.
//

import UIKit

final class PostUploadViewController: UIViewController {
    static let identifier = "PostUploadViewController"
    
    private let titleView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.tintColor = .black
        textView.backgroundColor = .clear
        return textView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.text = "제목"
        return label
    }()
    
    private let titleSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private let bodySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.text = "본문"
        return label
    }()
    
    private let bodyView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.tintColor = .black
        textView.backgroundColor = .clear
        return textView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.titleSeparator)
        self.view.addSubview(self.bodyView)
        self.view.addSubview(self.bodyLabel)
        self.view.addSubview(self.bodySeparator)
        self.view.addSubview(self.loginButton)
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            self.titleView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.titleView.heightAnchor.constraint(equalToConstant: 24),
            
            self.titleSeparator.heightAnchor.constraint(equalToConstant: 1),
            self.titleSeparator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleSeparator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.titleSeparator.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5),
            
            self.bodyLabel.topAnchor.constraint(equalTo: self.titleSeparator.bottomAnchor, constant: 10),
            self.bodyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.bodyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            self.bodyView.topAnchor.constraint(equalTo: self.bodyLabel.bottomAnchor, constant: 10),
            self.bodyView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.bodyView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.bodyView.heightAnchor.constraint(equalToConstant: 250),
            
            self.bodySeparator.heightAnchor.constraint(equalToConstant: 1),
            self.bodySeparator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.bodySeparator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.bodySeparator.topAnchor.constraint(equalTo: self.bodyView.bottomAnchor, constant: 10),
            
            self.loginButton.topAnchor.constraint(equalTo: self.bodySeparator.bottomAnchor, constant: 50),
            self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
        ])
        
        self.loginButton.addTarget(self, action: #selector(onPressLoginButton), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewDidTap(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc func onPressLoginButton(sender: Any) {
        let title = titleView.text as NSString
        let body = bodyView.text as NSString
        
        if (title.length > 2 && body.length > 2) {
            // API Call
            let input = PostUploadInput(title: titleView.text, content: bodyView.text)
            PostUploadDataManager().posts(self, input)
            
            // Show List View
//            let postListViewController = PostListViewController()
//            postListViewController.modalPresentationStyle = .fullScreen
//            present(postListViewController, animated: true)
            
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            Output_Alert(title: "앗!", message: "제목과 본문을 더 채워주세요 :)", text: "네")
        }
    }
    
    func Output_Alert(title : String, message : String, text : String) {
        let alertController = UIAlertController(
            title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(
            title: text, style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okButton)
        return self.present(alertController, animated: true, completion: nil)
    }
}

