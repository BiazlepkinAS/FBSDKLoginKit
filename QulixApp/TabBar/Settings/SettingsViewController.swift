
import UIKit

import FBSDKLoginKit

class SettingsViewController: UIViewController {
    
    var cornerRadius: CGFloat = 0
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 120
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 1, alpha: 1).cgColor
        firstNameLabel.text = "Grag"
        secondNameLabel.text = "Federike"
        
    }
    @IBAction func logOutButton(_ sender: Any) {
        let logout = LoginManager()
        logout.logOut()
        logOutButton.isHidden = false
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else {return}
        present(controller, animated: true, completion: nil)
    }
    
}
