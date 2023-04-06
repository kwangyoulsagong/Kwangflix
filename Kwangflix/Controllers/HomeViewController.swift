//
//  HomeViewController.swift
//  Kwangflix
//
//  Created by 사공광열 on 2023/04/01.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)//테이블 뷰 생성 스크롤 가능 한 목록 또는 섹션과 로우로 구성
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)//기본 쉘등록 cell 이라는 식별자 할당
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)// 부모에게 상속받아서 뷰 생성
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
//        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))//헤더 만들어주기
//
        configureNavBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect (x: 0, y: 0, width: view.bounds.width, height: 450  ))
        homeFeedTable.tableHeaderView = headerView//이미지 사이즈
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "Netflix_2015_N_logo.svg")//logo 추가
        image=image?.withRenderingMode(.alwaysOriginal )//색을 오리지널 색
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white // 색을 하얀색으로 바꾸기
    }
    
    override func viewDidLayoutSubviews() {//라이프 사이클  뷰컨틀롤러 뷰가 서브 뷰 레이아웃 하고 호출
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds // 뷰의 크기 이미 조정
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
       return 20 // 20 개 행
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1// 하나의 테이블
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 // 각 셀에 높이 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 //
    }
    
    //알고리즘 추가
    //top에서 내리면 네브바 위로 올리기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top//영역값 구하기
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
    }
}
