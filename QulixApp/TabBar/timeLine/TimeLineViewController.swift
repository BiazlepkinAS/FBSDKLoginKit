
import UIKit

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APImanager.shared.getPost(id: "post1", imageID: "13") { result1 in
            self.posts.append(result1!) // мы знаем точно что данные есть
            APImanager.shared.getPost(id: "post2", imageID: "14") {result2 in
                self.posts.append(result2!)
                APImanager.shared.getPost(id: "post3", imageID: "15") { result3 in
                    self.posts.append(result3!)
                    APImanager.shared.getPost(id: "post4", imageID: "16") { result4 in
                        self.posts.append(result4!)
                        APImanager.shared.getPost(id: "post5", imageID: "17") { result5 in
                            self.posts.append(result5!)
                            APImanager.shared.getPost(id: "post6", imageID: "18") {result6 in
                                self.posts.append(result6!)
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                    
                }
                
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimeLineTableViewCell
        cell.postNameTitile.text = posts[indexPath.row].name
        cell.postDate.text = posts[indexPath.row].date
        cell.postText.text = posts[indexPath.row].text
        cell.postImageView.image = posts[indexPath.row].image
        
        return cell
    }
}

