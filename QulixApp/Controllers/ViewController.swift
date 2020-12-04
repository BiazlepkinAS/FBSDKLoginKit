
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @objc func loginViewPresent() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else {
            return
        }
        present(controller, animated: true, completion: nil)
    }
}
