//
//  HeroHeaderUIView.swift
//  Kwangflix
//
//  Created by 사공광열 on 2023/04/03.
//

import UIKit

class HeroHeaderUIView: UIView {
    
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
    
//ui image view 와 두개의 버튼(다운로드 버튼과 플레이버튼)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heromImageView)
        addGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heromImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
