import UIKit

class ViewController: UIViewController {

    lazy var frameWidthWithOffsets = view.frame.width - 60
    
    lazy var viewField : UIView = {
        $0.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        $0.layer.cornerRadius = 30
        return $0
    }(UIView(frame: CGRect(x: 30, y: 101, width: frameWidthWithOffsets, height: 110)))
    
    lazy var profilePictureOriginX = viewField.frame.origin.x + 17
    lazy var profilePictureOriginY = viewField.frame.origin.y + 18
    lazy var profilePicture : UIImageView = {
        $0.layer.cornerRadius = 20
        $0.image = .profilePict
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: profilePictureOriginX, y: profilePictureOriginY, width: 75, height: 75)))
    
    lazy var dataLabelOriginX = profilePicture.frame.maxX + 12
    lazy var dataLabelOriginY = viewField.frame.origin.y + 29
    lazy var dataLabelWidthWithOffsets = viewField.frame.width - profilePicture.frame.width - 51
    lazy var dataLabel : UILabel = {
        $0.text = "Имя Фамилия"
        $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
        return $0
    }(UILabel(frame: CGRect(x: dataLabelOriginX, y: dataLabelOriginY, width: dataLabelWidthWithOffsets, height: 19)))
    
    lazy var editButtonOriginY = dataLabel.frame.maxY + 7
    lazy var editButtonWidthWithOffsets = dataLabelWidthWithOffsets - 68
    lazy var editButton = createButton(
        withOrigin: CGRect(x: dataLabelOriginX, y: editButtonOriginY, width: editButtonWidthWithOffsets, height: 30),
        backgroundColor: UIColor(red: 0/255, green: 87/255, blue: 255/255, alpha: 1),
        cornerRadius: 10,
        title: "Редактировать")
    
    lazy var nextButtonOriginX = viewField.frame.maxX - 51
    lazy var nextButtonWidth = viewField.frame.width - 319
    lazy var nextButton = createButton(
        withOrigin: CGRect(x: nextButtonOriginX, y: viewField.frame.origin.y, width: nextButtonWidth, height: viewField.frame.height),
        backgroundColor: UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1),
        cornerRadius: 30, image: UIImage(systemName: "chevron.forward"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [viewField, profilePicture, dataLabel, editButton, nextButton].forEach{ view.addSubview($0)}
    }
    
    func createButton(withOrigin rect: CGRect, backgroundColor: UIColor, cornerRadius: CGFloat = 0, title: String? = "", image: UIImage? = nil) -> UIButton {
        let button = UIButton(frame: rect)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.setTitle(title, for: .normal)
        if let img = image {
            button.setImage(image, for: .normal)
        }
        return button
    }
}

