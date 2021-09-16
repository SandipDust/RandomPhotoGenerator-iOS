//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Sandip Das on 15/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = .white
        return imageview
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
       
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    let colors:[UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemGreen,
        .systemYellow]
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30,
                              y:view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 60, height: 55)
    }

    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600*600"
        let url = URL(string: urlString)!
        guard let data =  try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }

}

