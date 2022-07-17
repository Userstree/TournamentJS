//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

import paper_onboarding

class OnboardingController: UIViewController, OnboardingView {
    var onFinish: (() -> Void)?
    private var onBoardingItems = [OnboardingItemInfo(informationImage: UIImage(named: "teamIcon")!,
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

    private lazy var paperOnboarding: PaperOnboarding = {
        let view = PaperOnboarding()
        view.dataSource = self
        view.delegate = self
        return view
    }()

    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureSkipButton() {

    }

    private func configureViews() {
        view.addSubview(paperOnboarding)
        makeConstraints()
    }

    private func makeConstraints() {
        paperOnboarding.snp.makeConstraints {
            $0.edges.equalTo(view.snp.edges)
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
        26
    }

    func onboardingPageItemColor(at index: Int) -> UIColor {
        onboardingIndicatorColors[index]
    }
}

extension OnboardingController: PaperOnboardingDelegate {
    public func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        item.imageView?.contentMode = .scaleAspectFill
    }

    public var enableTapsOnPageControl: Bool {
        true
    }
}
