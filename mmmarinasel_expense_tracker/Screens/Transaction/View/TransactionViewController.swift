import UIKit

class TransactionViewController: UIViewController {
    
    private lazy var amountLabel: UILabel = {
        return buildLabel(font: UIFont.systemFont(ofSize: 23, weight: .medium), text: "Amount")
    }()
    
    private lazy var categoryLabel: UILabel = {
        return buildLabel(font: UIFont.systemFont(ofSize: 23, weight: .medium), text: "Category")
    }()
    
    private lazy var amountTextField: UITextField = {
        return buildTextField(fontSize: 15, placeholder: "Enter your transaction")
    }()
    
    private lazy var categoryTextField: UITextField = {
        return buildTextField(fontSize: 15, placeholder: "Select a category")
    }()
    
    private lazy var addTransactionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add transaction", for: .normal)
        button.backgroundColor = .systemGray3
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .cyan
        self.setup()
    }
    
    private func buildTextField(fontSize: CGFloat, placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: fontSize)
        textField.borderStyle = .roundedRect
        return textField
    }
    
    private func buildLabel(font: UIFont, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        return label
    }
    
    private func setup() {
        self.view.addSubview(self.amountLabel)
        self.view.addSubview(self.amountTextField)
        self.view.addSubview(self.categoryLabel)
        self.view.addSubview(self.categoryTextField)
        self.view.addSubview(self.addTransactionButton)
        
        self.amountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.amountTextField.translatesAutoresizingMaskIntoConstraints = false
        self.categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.categoryTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            self.amountLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
                                                      constant: 40),
            self.amountLabel.topAnchor.constraint(equalTo: self.view.topAnchor,
                                                  constant: 20),
            self.amountTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.amountTextField.leadingAnchor.constraint(equalTo: self.amountLabel.leadingAnchor),
            self.amountTextField.topAnchor.constraint(equalTo: self.amountLabel.bottomAnchor,
                                                  constant: 20),
            self.amountTextField.heightAnchor.constraint(equalToConstant: 40),
            self.categoryLabel.leadingAnchor.constraint(equalTo: self.amountLabel.leadingAnchor),
            self.categoryLabel.topAnchor.constraint(equalTo: self.amountTextField.bottomAnchor,
                                                  constant: 40),
            self.categoryTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.categoryTextField.leadingAnchor.constraint(equalTo: self.amountLabel.leadingAnchor),
            self.categoryTextField.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor,
                                                        constant: 20),
            self.categoryTextField.heightAnchor.constraint(equalToConstant: 40),
            self.addTransactionButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.addTransactionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
                                                               constant: 60),
            self.addTransactionButton.topAnchor.constraint(equalTo: self.categoryTextField.bottomAnchor,
                                                           constant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.addTransactionButton.layer.cornerRadius = 8
        self.addTransactionButton.layer.borderWidth = 2
        self.addTransactionButton.layer.borderColor = UIColor.black.cgColor
    }
}
