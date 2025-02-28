//
//  MainViewControllerTab.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit

class MainViewControllerTab: UITabBarController,  UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.viewControllerBackgroundColor
        self.delegate = self

        navigationItem.hidesBackButton = true
        // Instantiate the three view controllers
        let mainVC = MainScreenController()
        let historyVC = TutorialController(gameType: "")
        let profileVC = ProfileController()

        // Create Navigation Controllers for each (optional for navigation stack)
        let main = UINavigationController(rootViewController: mainVC)
        let history = UINavigationController(rootViewController: historyVC)
        let profile = UINavigationController(rootViewController: profileVC)

        main.navigationBar.isHidden = true
        history.navigationBar.isHidden = true
        profile.navigationBar.isHidden = true

        // Configure tab bar items
        main.tabBarItem = UITabBarItem(
            title: "main",
            image: resizeImage(
                named: "main", size: CGSize(width: 30 * Constraint.xCoeff, height: 30 * Constraint.yCoeff)
            ),
            tag: 0
        )
        history.tabBarItem = UITabBarItem(
            title: "my tutorials",
            image: resizeImage(named: "tutorial", size: CGSize(width: 30 * Constraint.xCoeff, height: 30 * Constraint.yCoeff)),
            tag: 1
        )
        profile.tabBarItem = UITabBarItem(
            title: "my profile",
            image: resizeImage(named: "profile", size: CGSize(width: 30 * Constraint.xCoeff, height: 30 * Constraint.yCoeff)),
            tag: 2
        )

        // Assign view controllers to the Tab Bar
        viewControllers = [main, history, profile]

        main.tabBarItem.imageInsets = UIEdgeInsets(
            top: 0 * Constraint.yCoeff,
            left: 0 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            right: 0 * Constraint.xCoeff
        )
        history.tabBarItem.imageInsets = UIEdgeInsets(
            top: 0 * Constraint.yCoeff,
            left: 0,
            bottom: 0 * Constraint.yCoeff,
            right: 0
        )
        profile.tabBarItem.imageInsets = UIEdgeInsets(
            top: 0 * Constraint.yCoeff,
            left: 0 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            right: 0 * Constraint.xCoeff
        )

        // Style the Tab Bar (optional)
        tabBar.tintColor = .signInButtonBackgroundColor
        tabBar.unselectedItemTintColor = .whiteColor.withAlphaComponent(0.4)
        tabBar.barTintColor = UIColor.titlesBlack
        tabBar.isTranslucent = false
    }

    private func resizeImage(named: String, size: CGSize) -> UIImage? {
        guard let image = UIImage(named: named) else { return nil }
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

