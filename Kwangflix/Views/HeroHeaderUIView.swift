//
//  HeroHeaderUIView.swift
//  Kwangflix
//
//  Created by 사공광열 on 2023/04/03.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    
//ui image view 와 두개의 버튼(다운로드 버튼과 플레이버튼)
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false // constraints 사용
        return button
    }()
    
    private let playButton: UIButton = {//playbutton 만들기
        
        let button = UIButton()
        button.setTitle("Play", for: .normal )
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false // constraints 사용
        
        return button
    }()
    
    private let heromImageView: UIImageView = {// 이미지 뷰 만들기
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // overflow 막기
        imageView.image = UIImage(named: "image_readtop_2022_57688_16425780784922535")//이미지 불러오기
        return imageView
    }()

    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heromImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    private func applyConstraints(){
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70), //왼쪽 마진 100
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),//밑에서 마진 위로 50
            playButton.widthAnchor.constraint(equalToConstant: 120)//width 120
        ]
        let downloadButtonConstraints=[
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70), //왼쪽 마진 100
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),//밑에서 마진 위로 50
            downloadButton.widthAnchor.constraint(equalToConstant: 120)//width 120
            
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heromImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
