//
//  ViewController.swift
//  Kwangflix
//
//  Created by 사공광열 on 2023/04/01.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow// 배경색 노란색
        
        // 4개의 텝 바 를 만든다
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        //uinaviagtioncontroller는 Navigation Controller 는 1개 이상의 자식 View Controller 를 관리하는 컨테이너 View Controller 입니다.
        let vc2 = UINavigationController(rootViewController: UpcommingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        //네비게이션 컨틀롤러를 사용하는 이유는 위에 네비게이션 콘틀롤러가 있는데 어떤 콘텐츠를 클릭시 다른 콘틀러로 간다
        //현재 컨틀롤러에 푸쉬가 될거다 그래서 사용된다 그래서 각각의 네비게이션 컨틀롤러를 작성
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")// 텝바에 이미지 삽입
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        //제목을 붙여줌
        vc1.title = "Home"
        vc2.title = "Comming Soon"
        vc3.title = "Top Searches"
        vc4.title = "Downloads"
        
        // 텝바 색 바꾸기
        tabBar.tintColor = .label
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        //네비게이션 컨트롤러를 스택을 활용해서 탭바를 클릭시 전환
    }


}

