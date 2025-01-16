//
//  ViewController.swift
//  CGFramingExample
//
//  Created by Tim Oliver on 14/5/2022.
//

import UIKit

// swiftlint:disable cyclomatic_complexity

class ViewController: UITableViewController {

    let headerView = UIView()
    let containerView = UIView()
    let redView = UIView()

    var selectedHorizontal = 0
    var selectedVertical = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create an overarching header view that will be controlled by the table view
        headerView.height = 250
        tableView.tableHeaderView = headerView

        // Make a colored container view to control
        containerView.backgroundColor = .secondarySystemGroupedBackground
        containerView.cornerRadius = 15.0
        headerView.addSubview(containerView)

        // Make a red view we can use experiment
        redView.size = .box(size: 100)
        redView.origin = containerView.topLeft.offsetBy(10)
        redView.applyCornerRadius(relativeTo: containerView)
        redView.backgroundColor = .systemRed
        containerView.addSubview(redView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Set the size of the container view to match the header, but inset by the view controller's margins
        containerView.size = CGSize(width: headerView.width - view.layoutMarginsWidth,
                                    height: 200)
        // Position the container in the middle of the 
        containerView.center = headerView.bounds.center

        // Update the red view's position
        updateRedViewPosition()
    }

    private func updateRedViewPosition(animated: Bool = false) {

        let position = (selectedHorizontal, selectedVertical)

        let animation = { [weak self] in
            guard let redView = self?.redView, let containerView = self?.containerView else {
                return
            }

            switch position {
            case (0, 0): redView.topLeft = containerView.bounds.topLeft.offsetBy(10)
            case (1, 0): redView.topCenter = containerView.bounds.topCenter.offsetBy(dy: 10)
            case (2, 0): redView.topRight = containerView.bounds.topRight.offsetBy(dx: -10, dy: 10)
            case (0, 1): redView.centerLeft = containerView.bounds.centerLeft.offsetBy(dx: 10)
            case (1, 1): redView.center = containerView.bounds.center
            case (2, 1): redView.centerRight = containerView.bounds.centerRight.offsetBy(dx: -10)
            case (0, 2): redView.bottomLeft = containerView.bounds.bottomLeft.offsetBy(dx: 10, dy: -10)
            case (1, 2): redView.bottomCenter = containerView.bounds.bottomCenter.offsetBy(dy: -10)
            case (2, 2): redView.bottomRight = containerView.bounds.bottomRight.offsetBy(-10)
            default: break
            }
        }

        if !animated {
            animation()
            return
        }

        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 5.0,
                       options: [],
                       animations: animation,
                       completion: nil)
    }
}

// MARK: - UITableView -

extension ViewController {

    override func numberOfSections(in tableView: UITableView) -> Int { 2 }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int { 3 }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Vertical Position"
        }

        return "Horizontal Position"
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellIdent"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }

        var text: String!

        // X positions
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: text = "Left"
            case 1: text = "Center"
            case 2: text = "Right"
            default: break
            }

            if indexPath.row == selectedHorizontal {
                cell?.accessoryType = .checkmark
            } else {
                cell?.accessoryType = .none
            }
        }

        // Y positions
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0: text = "Top"
            case 1: text = "Center"
            case 2: text = "Bottom"
            default: break
            }

            if indexPath.row == selectedVertical {
                cell?.accessoryType = .checkmark
            } else {
                cell?.accessoryType = .none
            }
        }

        cell?.textLabel?.text = text

        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        var previousIndex = 0

        if indexPath.section == 0 {
            previousIndex = selectedHorizontal
            selectedHorizontal = indexPath.row
        } else if indexPath.section == 1 {
            previousIndex = selectedVertical
            selectedVertical = indexPath.row
        }

        let previousCell = tableView.cellForRow(at: IndexPath(row: previousIndex, section: indexPath.section))
        previousCell?.accessoryType = .none

        let newCell = tableView.cellForRow(at: indexPath)
        newCell?.accessoryType = .checkmark

        // Update the position
        updateRedViewPosition(animated: true)
    }
}

// swiftlint:enable cyclomatic_complexity
