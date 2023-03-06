//
//  MainViewController.swift
//  SparrowCodeE2
//
//  Created by Коцур Тарас Сергійович on 05.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
  
  // MARK: - Properties
  
  lazy var firstButton: UIButton = makeActionButton("First", imageName: "arrow.forward.circle.fill")
  lazy var secondButton: UIButton = makeActionButton("Second", imageName: "arrow.forward.circle.fill")
  lazy var thirdButton: UIButton = {
    let button = makeActionButton("Third", imageName: "arrow.forward.circle.fill")
    button.addTarget(self, action: #selector(didSelectThirdAction), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Initializers
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    configureView()
    configureLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle methods
  
  
  // MARK: - Configuration methods
  
  private func configureView() {
    view.backgroundColor = .systemBackground
  }
  
  private func configureLayout() {
    view.addSubview(firstButton)
    firstButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      firstButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      firstButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
      firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    view.addSubview(secondButton)
    secondButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 24),
      secondButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      secondButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
      secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  
    view.addSubview(thirdButton)
    thirdButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 24),
      thirdButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      thirdButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
      thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  // MARK: - Actions
  
  @objc
  private func didSelectThirdAction() {
    let detailedViewController = UIViewController()
    detailedViewController.view.backgroundColor = .systemBackground
    present(detailedViewController, animated: true)
  }
}

extension MainViewController {
  
  private func makeActionButton(_ title: String, imageName: String) -> UIButton {
    var configuration = UIButton.Configuration.filled()
    configuration.title = title
    configuration.image = .init(systemName: imageName)
    configuration.imagePlacement = Appearance.Button.Icon.alignment
    configuration.imagePadding = Appearance.Button.padding
    configuration.contentInsets = Appearance.Button.contentInsets
    
    let button = SpringButton()
    button.configuration = configuration
    return button
  }
}

extension MainViewController {
  enum Appearance {
    enum Button {
      static let padding: CGFloat = 8
      static let contentInsets: NSDirectionalEdgeInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
      
      enum Icon {
        static let alignment: NSDirectionalRectEdge = .trailing
      }
    }
  }
}
