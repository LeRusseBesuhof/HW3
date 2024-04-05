import UIKit

protocol ViewControllerDelegate : AnyObject {
    func setUserData(name: String, surname: String, description: String)
}

class ViewController: UIViewController {

    lazy var profileDescription = ""
    
    lazy var viewField : UIView = {
        $0.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        $0.layer.cornerRadius = 30
        return $0
    }(UIView(frame: CGRect(x: 30, y: 130, width: view.frame.width - 60, height: 110)))
    
    lazy var profilePicture : UIImageView = {
        $0.layer.cornerRadius = 20
        $0.image = .profilePict
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: viewField.frame.origin.x + 17, y: viewField.frame.origin.y + 18, width: 75, height: 75)))
    
    lazy var dataLabelWidthWithOffsets = viewField.frame.width - profilePicture.frame.width - 51
    lazy var dataLabel : UILabel = {
        $0.text = "Имя Фамилия"
        $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        return $0
    }(UILabel(frame: CGRect(x: profilePicture.frame.maxX + 12, y: viewField.frame.origin.y + 29, width: dataLabelWidthWithOffsets, height: 19)))
    
    lazy var editButton = createButton(
        withOrigin: CGRect(x: profilePicture.frame.maxX + 12, y: dataLabel.frame.maxY + 7, width: dataLabelWidthWithOffsets - 68, height: 30),
        backgroundColor: UIColor(red: 0/255, green: 87/255, blue: 255/255, alpha: 1),
        action: editAction,
        cornerRadius: 10,
        title: "Редактировать")
    
    lazy var editAction = UIAction { [weak self] _ in
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        
        self?.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    lazy var openProfileAction = UIAction { [weak self] _ in
        let openedProfileVC = OpenedProfileViewController()
        openedProfileVC.dataLabelText = self?.dataLabel.text ?? "Имя Фамилия"
        openedProfileVC.profileDescription = self?.profileDescription ?? ""
        
        self?.navigationController?.pushViewController(openedProfileVC, animated: true)
    }
    
    lazy var nextButton = createButton(
        withOrigin: CGRect(x: viewField.frame.maxX - 51, y: viewField.frame.origin.y, width: viewField.frame.width - 319, height: viewField.frame.height),
        backgroundColor: UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1),
        action: openProfileAction,
        cornerRadius: 30, image: UIImage(systemName: "chevron.forward"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Главная"
        
        [viewField, profilePicture, dataLabel, editButton, nextButton].forEach{ view.addSubview($0)}
    }
    
    func createButton(withOrigin rect: CGRect, backgroundColor: UIColor, action: UIAction, cornerRadius: CGFloat = 0, title: String? = "", image: UIImage? = nil) -> UIButton {
        let button = UIButton(primaryAction: action)
        button.frame = rect
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        if let _ = image { button.setImage(image, for: .normal) }
        return button
    }
}

extension ViewController : ViewControllerDelegate {
    func setUserData(name: String, surname: String, description: String) {
        dataLabel.text = "\(name) \(surname)"
        profileDescription = description
    }
}
