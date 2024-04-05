import UIKit

class SettingsViewController: UIViewController {
    
    weak var delegate : ViewControllerDelegate?
    
    lazy var nameLabel = createTextLabel(withOrigin: CGRect(x: 42, y: 130, width: view.frame.width - 84, height: 19), text: "Имя")
    
    lazy var nameTextField = createTextField(
        withOrigin: CGRect(x: 30, y: nameLabel.frame.maxY + 5, width: view.frame.width - 60, height: 51),
        backgroundColor: UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1))
    
    lazy var surnameLabel = createTextLabel(withOrigin: CGRect(x: 42, y: nameTextField.frame.maxY + 22, width: view.frame.width - 84, height: 19), text: "Фамилия")
    
    lazy var surnameTextField = createTextField(
        withOrigin: CGRect(x: 30, y: surnameLabel.frame.maxY + 5, width: view.frame.width - 60, height: 51),
        backgroundColor: UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1))
    
    lazy var descriptionLabel = createTextLabel(withOrigin: CGRect(x: 42, y: surnameTextField.frame.maxY + 22, width: view.frame.width - 84, height: 19), text: "Описание")
    
    lazy var descriptionTextView = createTextView(withOrigin: CGRect(x: 30, y: descriptionLabel.frame.maxY + 5, width: view.frame.width - 60, height: 144), backgroundColor: UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1))
    
    lazy var saveButton : UIButton = {
        $0.frame = CGRect(x: 30, y: view.frame.height - 100, width: view.frame.width - 60, height: 60)
        $0.backgroundColor = UIColor(red: 0/255, green: 87/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 30
        $0.setTitle("Сохранить", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton(primaryAction: saveAction))
    
    lazy var saveAction = UIAction { [weak self] _ in
        self?.delegate?.setUserData(name: self?.nameTextField.text ?? "Имя", surname: self?.surnameTextField.text ?? "Фамилия", description: self?.descriptionTextView.text ?? "")
        self?.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"

        [nameLabel, nameTextField, surnameLabel, surnameTextField, descriptionLabel, descriptionTextView, saveButton].forEach { view.addSubview($0) }
    }
    
    func createTextLabel(withOrigin rect: CGRect, text: String) -> UILabel {
        let label = UILabel(frame: rect)
        label.text = text
        return label
    }
    
    func createTextView(withOrigin rect: CGRect, backgroundColor: UIColor, cornerRadius: CGFloat = 15) -> UITextView {
        let textView = UITextView(frame: rect)
        textView.backgroundColor = backgroundColor
        textView.layer.cornerRadius = cornerRadius
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }
    
    func createTextField(withOrigin rect: CGRect, backgroundColor: UIColor, cornerRadius: CGFloat = 15) -> UITextField {
        let textField = UITextField(frame: rect)
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        return textField
    }
}
