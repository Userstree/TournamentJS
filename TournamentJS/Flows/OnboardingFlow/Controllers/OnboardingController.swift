//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

import paper_onboarding

class OnboardingController: UIViewController, OnboardingView {
    var onFinish: (() -> Void)?
    private var onBoardingItems = [
        OnboardingItemInfo(informationImage: UIImage(named: "teamIcon")!,
                title: "Oversee",
                description: "Manage tornaments. ",
                pageIcon: UIImage(systemName: "person.badge.plus")!,
                color: .systemIndigo,
                titleColor: .white,
                descriptionColor: .white,
                titleFont: UIFont.systemFont(ofSize: 38, weight: .bold),
                descriptionFont: UIFont.systemFont(ofSize: 16, weight: .light)),

        OnboardingItemInfo(informationImage: UIImage(named: "playStationController")!,
                title: "Play",
                description: "Invite friends to play games. Share the best moments",
                pageIcon: UIImage(systemName: "gamecontroller")!,
                color: .systemTeal,
                titleColor: .white,
                descriptionColor: .white,
                titleFont: UIFont.systemFont(ofSize: 38, weight: .semibold),
                descriptionFont: UIFont.systemFont(ofSize: 16, weight: .light)),
        OnboardingItemInfo(informationImage: UIImage(named: "teamHappy")!,
                title: "Communicate",
                description: "Win the prizes. Make friends. Talk. Relax",
                pageIcon: UIImage(systemName: "person.3.sequence.fill")!,
                color: .systemPurple,
                titleColor: .white,
                descriptionColor: .white,
                titleFont: UIFont.systemFont(ofSize: 38, weight: .semibold),
                descriptionFont: UIFont.systemFont(ofSize: 16, weight: .light)),
    ]
    private var onboardingIndicatorColors = [
        UIColor.white,
        UIColor.white,
        UIColor.white,
    ]

    private var pageIndex = 0 {
        didSet {
            if pageIndex == onBoardingItems.count - 1 {
                getStartedButton.isHidden = false
            } else {
                getStartedButton.isHidden = true
            }
        }
    }

    private lazy var paperOnboarding: PaperOnboarding = {
        let view = PaperOnboarding()
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET STARTED", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 22
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 26, bottom: 10, right: 26)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        makeButtonGradient()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSkipButton()
        hideButton()
    }

    private func makeButtonGradient() {
        getStartedButton.frame = getStartedButton.bounds
        getStartedButton.applyGradient(colours: [ButtonGradientColors.leftColor, ButtonGradientColors.rightColor], locations: [0.0, 1.0])
    }

    private func hideButton() {
        getStartedButton.isHidden = true
    }

    private func configureSkipButton() {
        let skipNavBarItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonTapped))
        navigationItem.rightBarButtonItem = skipNavBarItem
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    @objc private func skipButtonTapped() {
        onFinish?()
    }

    private func configureViews() {
        [paperOnboarding, getStartedButton].forEach(view.addSubview)
        makeConstraints()
    }
    private func makeConstraints() {
        paperOnboarding.snp.makeConstraints {
            $0.edges.equalTo(view.snp.edges)
        }
        getStartedButton.snp.makeConstraints{
            $0.bottom.equalTo(view.snp.bottom).offset(-140)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
}

extension OnboardingController: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        onBoardingItems.count
    }

    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let item = onBoardingItems[index]
        item.pageIcon.withTintColor(.green)
        return item
    }

    public func onboardingPageItemSelectedRadius() -> CGFloat {
        24
    }

    func onboardingPageItemColor(at index: Int) -> UIColor {
        onboardingIndicatorColors[index]
    }
}

extension OnboardingController: PaperOnboardingDelegate {
    public func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        pageIndex = index
        item.imageView?.contentMode = .scaleAspectFill
    }

    public var enableTapsOnPageControl: Bool {
        true
    }
}
