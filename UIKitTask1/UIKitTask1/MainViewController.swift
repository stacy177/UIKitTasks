//
//  ViewController.swift

import UIKit

class MainViewController: UIViewController {
    
    private let startButton = UIButton(type: .system)
    private let wordLabel = UILabel()
    private var titleLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func showStartAlert() {
        let alert = UIAlertController(title: "Ваше слово", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введите слово..."
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            
            if let title = alert.textFields?.first?.text {
            self?.titleLabel = title
            self?.presentWords()
            }
        }))
        
        present(alert, animated: true)
    }
    
    func presentWords() {
        let response = WordModel(title: "hello")
        titleLabel = response.title
        wordLabel.text = titleLabel
    }
    
}

extension MainViewController {
    private func setupUI() {
        view.addSubview(startButton)
        view.addSubview(wordLabel)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.heightAnchor.constraint(equalToConstant: 50),
            wordLabel.widthAnchor.constraint(equalToConstant: 180),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        startButton.addTarget(self, action: #selector(showStartAlert), for: .touchUpInside)
        startButton.setTitle("Старт", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .yellow
        
        wordLabel.backgroundColor = .lightGray
        wordLabel.alpha = 0.7
        wordLabel.textColor = .black
        wordLabel.layer.cornerRadius = 8
        wordLabel.clipsToBounds = true
        wordLabel.text = titleLabel
//        if wordLabel.text == nil {
//            wordLabel.isHidden = false
//        }
        wordLabel.textAlignment = .center
        wordLabel.font = UIFont(name: "Avenir-Bold", size: 25)
    }
}
