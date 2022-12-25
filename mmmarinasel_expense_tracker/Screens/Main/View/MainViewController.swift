import UIKit

class MainViewController: UIViewController {
    
    private lazy var btcExchangeRateLabel: UILabel = {
        return self.createLabel(font: UIFont.systemFont(ofSize: 17, weight: .semibold), bgColor: .systemPink)
    }()
    
    private lazy var balanceLabel: UILabel = {
        return self.createLabel(font: UIFont.systemFont(ofSize: 30, weight: .semibold), bgColor: .purple)
    }()
    
    private lazy var addIncomeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(addIncome), for: .touchUpInside)
        return button
    }()
    
    private lazy var addTransactionButton: UIButton = {
        var button = UIButton()
        button.setTitle("Add transaction", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(openTransactionVC), for: .touchUpInside)
        return button
    }()
    
    private var tableView = UITableView()
    
    private let rowHeight: CGFloat = 80

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setup()
        self.setupTableView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func presentAlertController() {
        let alert = UIAlertController(title: "Add income", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter the amount"
            textField.keyboardType = .decimalPad
        }
        
        let confirmButton = UIAlertAction(title: "Confirm", style: .default) { [weak alert] _ in
            guard let textFields = alert?.textFields else { return }
            if let amount = textFields[0].text {
                print("amount: \(amount)")
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(confirmButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
    }
    
    private func setupTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.addTransactionButton.bottomAnchor, constant: 15).isActive = true
        
        self.tableView.register(TransactionTableViewCell.self,
                                forCellReuseIdentifier: TransactionTableViewCell.id)
    }

    private func createLabel(font: UIFont, bgColor: UIColor) -> UILabel {
        let label = UILabel()
        label.backgroundColor = bgColor
        label.font = font
        label.text = "5555$"
        return label
    }

    private func setup() {
        
        self.view.addSubview(self.btcExchangeRateLabel)
        self.view.addSubview(self.balanceLabel)
        self.view.addSubview(self.addIncomeButton)
        self.view.addSubview(self.addTransactionButton)
        self.btcExchangeRateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addIncomeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.btcExchangeRateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,
                                                                constant: -25),
            self.btcExchangeRateLabel.topAnchor.constraint(equalTo: self.view.topAnchor,
                                                           constant: 76),
            self.balanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.balanceLabel.topAnchor.constraint(equalTo: self.btcExchangeRateLabel.topAnchor,
                                                   constant: 30),
            self.addIncomeButton.centerYAnchor.constraint(equalTo: self.balanceLabel.bottomAnchor),
            self.addIncomeButton.leadingAnchor.constraint(equalTo: self.balanceLabel.trailingAnchor,
                                                          constant: 40),
            self.addIncomeButton.heightAnchor.constraint(equalToConstant: 40),
            self.addIncomeButton.widthAnchor.constraint(equalToConstant: 40),
            self.addTransactionButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.addTransactionButton.topAnchor.constraint(equalTo: self.addIncomeButton.bottomAnchor,
                                                           constant: 20),
            self.addTransactionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
                                                               constant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
        self.addIncomeButton.layer.cornerRadius = 20
        self.addTransactionButton.layer.cornerRadius = 10
        self.addTransactionButton.layer.borderWidth = 2
        self.addTransactionButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @objc func addIncome(sender: UIButton!) {
        self.presentAlertController()
    }
    
    @objc func openTransactionVC(sender: UIButton!) {
        let vc = TransactionViewController()
        present(vc, animated: true)
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "25 December 2022"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.id) as? TransactionTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .blue
        return cell
    }
    
}
