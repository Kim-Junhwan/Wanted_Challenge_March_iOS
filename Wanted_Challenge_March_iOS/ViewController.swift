//
//  ViewController.swift
//  Wanted_Challenge_March_iOS
//
//  Created by JunHwan Kim on 2023/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var fourthImageView: UIImageView!
    
    
    @IBOutlet weak var fifthImageView: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var fifthButton: UIButton!
    
    @IBOutlet weak var allButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.addTarget(self, action: #selector(getFirstImage), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(getSecondImage), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(getThirdImage), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(getFourthImage), for: .touchUpInside)
        fifthButton.addTarget(self, action: #selector(getFifthImage), for: .touchUpInside)
        allButton.addTarget(self, action: #selector(getAllImage), for: .touchUpInside)
    }
    
    func prepareFetchImage(imageView: UIImageView) {
        DispatchQueue.main.async {
            imageView.image = UIImage(systemName: "sleep")
        }
    }
    
    @objc func getFirstImage() {
        prepareFetchImage(imageView: firstImageView)
        firstImageView.fetchImage(url: URL(string: "https://images.unsplash.com/photo-1676684937076-f211c429902f?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODM1NzB8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzcwNzQ4MjU&ixlib=rb-4.0.3&q=80")!)
    }
    
    @objc func getSecondImage() {
        prepareFetchImage(imageView: secondImageView)
        secondImageView.fetchImage(url: URL(string: "https://images.unsplash.com/photo-1677014067126-5b91eca28f7d?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODM1NzB8MHwxfGFsbHwyfHx8fHx8Mnx8MTY3NzA3NDk3OA&ixlib=rb-4.0.3&q=80")!)
    }
    
    @objc func getThirdImage() {
        prepareFetchImage(imageView: thirdImageView)
        thirdImageView.fetchImage(url: URL(string: "https://images.unsplash.com/photo-1677029907981-e9a44fb7409a?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODM1NzB8MHwxfGFsbHwzfHx8fHx8Mnx8MTY3NzA3NDk3OA&ixlib=rb-4.0.3&q=80")!)
    }
    
    @objc func getFourthImage() {
        prepareFetchImage(imageView: fourthImageView)
        fourthImageView.fetchImage(url: URL(string: "https://images.unsplash.com/photo-1676909432077-dc024f5b1a5a?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODM1NzB8MHwxfGFsbHw0fHx8fHx8Mnx8MTY3NzA3NDk3OA&ixlib=rb-4.0.3&q=80")!)
    }
    
    @objc func getFifthImage() {
        prepareFetchImage(imageView: fifthImageView)
        fifthImageView.fetchImage(url: URL(string: "https://images.unsplash.com/photo-1677011513760-78712eed509b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODM1NzB8MHwxfGFsbHw1fHx8fHx8Mnx8MTY3NzA3NDk3OA&ixlib=rb-4.0.3&q=80")!)
    }
    
    @objc func getAllImage() {
        getFirstImage()
        getSecondImage()
        getThirdImage()
        getFourthImage()
        getFifthImage()
    }


}

extension UIImageView {
    func fetchImage(url: URL) {
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if error != nil {
                    fatalError()
                } else {
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
