import UIKit

class OpenedProfileViewController: UIViewController {

    lazy var dataLabelText = ""
    lazy var profileDescription = ""
    
    lazy var profilePicture : UIImageView = {
        $0.image = .profilePict
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: 178, y: 125, width: 75, height: 75)))
    
    lazy var dataLabel = createLabel(withOrigin: CGRect(x: 30, y: profilePicture.frame.maxY + 23, width: view.frame.width - 60, height: 19), text: dataLabelText, isCentered: true)
    
    lazy var aboutUserLabel = createLabel(withOrigin: CGRect(x: 42, y: dataLabel.frame.maxY + 33, width: view.frame.width - 84, height: 19), text: "О себе", alpha: 0.5)
    
    lazy var descriptionTextView : UITextView = {
        $0.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        $0.text = profileDescription
        $0.layer.cornerRadius = 15
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UITextView(frame: CGRect(x: 30, y: aboutUserLabel.frame.maxY + 9, width: view.frame.width - 60, height: 158)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Мой профиль"
        
        [profilePicture, dataLabel, aboutUserLabel, descriptionTextView].forEach { view.addSubview($0) }
    }
    
    func createLabel(withOrigin rect: CGRect, text: String, isCentered: Bool = false, alpha: CGFloat = 1) -> UILabel {
        let label = UILabel(frame: rect)
        label.text = text
        label.alpha = alpha
        if isCentered == true { label.textAlignment = .center }
        return label
    }
}
