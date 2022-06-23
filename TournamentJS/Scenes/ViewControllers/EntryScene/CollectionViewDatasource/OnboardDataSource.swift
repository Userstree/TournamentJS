//
// Created by Dossymkhan Zhulamanov on 23.06.2022.
//

import UIKit


class OnboardDataSource: NSObject, UICollectionViewDataSource {

    let dataSource = AnimationsStore()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.allPages().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.identifier,
                for: indexPath) as! OnboardCollectionViewCell
        cell.configure(dataSource: dataSource.allPages()[indexPath.item])
        return cell
    }
}
