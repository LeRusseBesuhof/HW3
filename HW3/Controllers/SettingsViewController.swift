import UIKit

class SettingsViewController: UIViewController {

    lazy var labelFrameWidthWithOffsets = view.frame.width - 84
    lazy var defaultFrameWidthWithOffsets = view.frame.width - 60
    lazy var textViewDefaultBackgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    
    lazy var nameLabel = createTextLabel(withOrigin: CGRect(x: 42, y: 19, width: labelFrameWidthWithOffsets, height: 19), text: "Имя")
    
    lazy var nameTextViewOriginY = nameLabel.frame.maxY + 5
    lazy var nameTextView = createTextView(
        withOrigin: CGRect(x: 30, y: nameTextViewOriginY, width: defaultFrameWidthWithOffsets, height: 51),
        backgroundColor: textViewDefaultBackgroundColor)
    
    lazy var surnameLabelOriginY = nameTextView.frame.maxY + 22
    lazy var surnameLabel = createTextLabel(withOrigin: CGRect(x: 42, y: surnameLabelOriginY, width: labelFrameWidthWithOffsets, height: 19), text: "Фамилия")
    
    lazy var surnameTextViewOriginY = surnameLabel.frame.maxY + 5
    lazy var surnameTextView = createTextView(
        withOrigin: CGRect(x: 30, y: surnameTextViewOriginY, width: defaultFrameWidthWithOffsets, height: 51),
        backgroundColor: textViewDefaultBackgroundColor)
    
    lazy var descriptionLabelOriginY = surnameTextView.frame.maxY + 22
    lazy var descriptionLabel = createTextLabel(withOrigin: CGRect(x: 42, y: descriptionLabelOriginY, width: labelFrameWidthWithOffsets, height: 19), text: "Описание")
    
    lazy var descriptionTextViewOriginY = descriptionLabel.frame.maxY + 5
    lazy var descriptionTextView = createTextView(withOrigin: CGRect(x: 30, y: descriptionTextViewOriginY, width: defaultFrameWidthWithOffsets, height: 144), backgroundColor: textViewDefaultBackgroundColor)
    
    lazy var saveButtonOriginY = descriptionTextView.frame.maxY + 340
    lazy var saveButton : UIButton = {
        $0.backgroundColor = UIColor(red: 0/255, green: 87/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 30
        $0.setTitle("Сохранить", for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: 30, y: saveButtonOriginY, width: defaultFrameWidthWithOffsets, height: 60)))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [nameLabel, nameTextView, surnameLabel, surnameTextView, descriptionLabel, descriptionTextView, saveButton].forEach { view.addSubview($0) }
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
        return textView
    }
}
