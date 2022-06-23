//
//  ViewController.swift
//  OffIce
//
//  Created by Dossymkhan Zhulamanov on 20.06.2022.
//
//

import UIKit
import Lottie
import SnapKit

class EntryPageViewController: UIViewController {

    let dataStore = OnboardDataSource()
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init?(coder: NSCoder) hasn't been implemented")
//    }

    private lazy var onboardCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(OnboardCollectionViewCell.self, forCellWithReuseIdentifier: OnboardCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = dataStore
        collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)

        collectionView.backgroundColor = .systemPink
        return collectionView
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .touchUpInside)
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get started", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        button.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        button.setContentHuggingPriority(.defaultLow, for: .vertical)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.backgroundColor = .systemGray3
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    @objc private func pageChanged(_ sender: Any) {
        let control = sender as! UIPageControl

        onboardCollectionView.scrollToItem(at: IndexPath(item: control.currentPage, section: 0),
                                            at: .centeredHorizontally, animated: true)
    }

    private func configureViews() {
        view.backgroundColor = .systemBackground
        [onboardCollectionView, pageControl, getStartedButton].forEach(view.addSubview)

        makeConstraints()
    }

    private func makeConstraints() {

        onboardCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.size.equalTo(CGSize(width: view.frame.width, height: view.frame.height * 0.77))
//            $0.centerX.equalTo(view.snp.centerX)
        }

        pageControl.snp.makeConstraints {
            $0.top.equalTo(onboardCollectionView.snp.bottom).offset(10)
            $0.height.equalTo(20)
            $0.centerX.equalTo(view.snp.centerX)
        }

        getStartedButton.snp.makeConstraints {
            $0.top.equalTo(pageControl.snp.bottom).offset(10)
            $0.height.equalTo(40)
            $0.width.equalTo(view.snp.width).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension EntryPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: onboardCollectionView.frame.width, height: onboardCollectionView.frame.height)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = collectionView.indexPathsForVisibleItems[0].item
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        pageControl.currentPage = pageNumber
    }
}
