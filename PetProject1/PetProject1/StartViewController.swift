//
//  ViewController.swift
//  PetProject1
//
//  Created by User on 03.11.2022.
//

import UIKit

final class StartViewController: UIViewController {
    
    private var nameLabel = UILabel()
    private var resultLabel = UILabel()
    private let startButton = UIButton(type: .system)
    private let sumButton = UIButton(type: .system)
    private let checkNumberButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    @objc func showStartAlert() {
        let alert = UIAlertController(title: "Ваше имя", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введите свое имя..."
        })
         
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
         
            if let name = alert.textFields?.first?.text {
                self.nameLabel.text = name
            }
        }))
         
        present(alert, animated: true)
    }
    
    @objc func showCheckNumber() {
        let numsArray = ["1", "2", "3", "4", "5"]
        let nums = numsArray.randomElement()
        self.resultLabel.text = nil
        let alert = UIAlertController(title: "Проверь свою интуицию", message: "Введите число от 1 до 5", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ваше число..."
        })
      
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { action in
         
            guard let myNumber = alert.textFields?.first!.text else { return }
            if myNumber == nums {
                self.resultLabel.text = "Ура! Вы угадали! Берите билеты в Вегас"
            } else {
                self.resultLabel.text = "Вы не угадали! Попробуйте еще раз!"
            }
          
        }))
         
        present(alert, animated: true)
    }
    
    @objc func showSumAlert() {
        let alert = UIAlertController(title: "Сложение чисел", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
         
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введите первое число..."
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введите второе число..."
        })
         
        alert.addAction(UIAlertAction(title: "Посчитать", style: .default, handler: { action in
         
            guard let firstNumber = alert.textFields?.first!.text else { return }
            guard let secondNumber = alert.textFields?.last!.text else { return }
            let first = Int(firstNumber)!
            let second = Int(secondNumber)!
            let sum = String(first + second)
            self.resultLabel.text = "Ваш результат: \(String(sum))"
        }))
         
        present(alert, animated: true)
    }
    
}

//MARK: - SetupUI

extension StartViewController {
    
    private func setupUI() {
        setupNameLabel()
        setupButtons()
        showStartAlert()
        setupResultLabel()
        setupStartButton()
    }
    
    private func setupStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(showStartAlert), for: .touchUpInside)
        startButton.setTitle("Старт", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .yellow
        startButton.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: checkNumberButton.topAnchor, constant: -20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 120),
            startButton.heightAnchor.constraint(equalToConstant: 45)
        ])
       
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .lightGray
        nameLabel.alpha = 0.7
        nameLabel.textColor = .black
        nameLabel.layer.cornerRadius = 8
        nameLabel.clipsToBounds = true
        if nameLabel.text == nil {
            nameLabel.isHidden = false
        }
        nameLabel.text = ""
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Avenir-Bold", size: 25)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.backgroundColor = .lightGray
        resultLabel.alpha = 0.7
        resultLabel.textColor = .black
        resultLabel.layer.cornerRadius = 8
        resultLabel.clipsToBounds = true
        if resultLabel.text == nil {
            resultLabel.isHidden = false
        }
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont(name: "Avenir-Bold", size: 25)
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            resultLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupButtons() {
        let stack = UIStackView(arrangedSubviews: [sumButton, checkNumberButton])
        view.addSubview(stack)
        stack.axis = .horizontal
        stack.spacing = 25
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        sumButton.addTarget(self, action: #selector(showSumAlert), for: .touchUpInside)
        sumButton.setTitle("Сложение", for: .normal)
        sumButton.setTitleColor(.black, for: .normal)
        sumButton.backgroundColor = .systemOrange
        sumButton.layer.cornerRadius = 8

        checkNumberButton.addTarget(self, action: #selector(showCheckNumber), for: .touchUpInside)
        checkNumberButton.setTitle("Угадай число", for: .normal)
        checkNumberButton.setTitleColor(.black, for: .normal)
        checkNumberButton.backgroundColor = .systemOrange
        checkNumberButton.layer.cornerRadius = 8

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 50),
            sumButton.widthAnchor.constraint(equalTo: checkNumberButton.widthAnchor.self),
            checkNumberButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
