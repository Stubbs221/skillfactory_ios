//
//  ViewController.swift
//  38.1 REST Poject
//
//  Created by MAC on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
// MARK: Properties
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=")
    
    lazy var textFieldID: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont(name: "Helvetica Neue", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 2
        return textField
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 2
        textView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    lazy var buttonConfirm: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm ID", for: .normal)
//        button.titleLabel?.text = "confirm iD"
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        return button
    }()

// MARK: Actions
    
    @objc func buttonPressed() {
        let id = Int(textFieldID.text ?? "")!
        let array = Array(1...100)
        guard array.contains(id) else {
            self.textView.text = "invalid id"
            return
            
        }
        
        posts(String(id))
    }
    
    func posts(_ id: String) {
        let currentURL = URL(string: (url?.absoluteString ?? "") + id)
        guard let requestURL = currentURL else { return }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let data = data, let dataString = String(data: data, encoding: .utf8), (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            DispatchQueue.main.async {
                self.textView.text = dataString
            }
            
        }
        
        task.resume()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        view.addSubview(textFieldID)
        view.addSubview(textView)
        view.addSubview(buttonConfirm)
        
        NSLayoutConstraint.activate([
            textFieldID.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldID.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            textFieldID.heightAnchor.constraint(equalToConstant: 50),
            textFieldID.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            buttonConfirm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonConfirm.heightAnchor.constraint(equalToConstant: 50),
            buttonConfirm.widthAnchor.constraint(equalToConstant: 150),
            buttonConfirm.topAnchor.constraint(equalTo: textFieldID.bottomAnchor, constant: 50)])
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 400),
            textView.widthAnchor.constraint(equalToConstant: 300),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: buttonConfirm.bottomAnchor, constant: 50),
        ])
    }
}

// MARK: JSON struct

struct Comments: Codable {
    var postID: Int
    var iD: Int
    var name: String
    var email: String
    var body: String
}
