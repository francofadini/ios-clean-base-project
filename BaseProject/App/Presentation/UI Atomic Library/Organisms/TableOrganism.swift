import Foundation
import UIKit

struct Section {
  let title: String?
  let rows: [Row]
}

public class Row: UIView {
  var tableView: UITableView?
  var indexPath: IndexPath?
  var height: CGFloat = 44
  var accesoryType: UITableViewCell.AccessoryType = .none
  var selecctionStyle: UITableViewCell.SelectionStyle = .none
  var didTapHandler: (() -> Void)?

  func reload() {
    guard let indexPath = self.indexPath else {
      return
    }

    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
  }
}

public class TableOrganism: UITableViewController {
  private var sections = [Section]()

  init() {
    super.init(style: .grouped)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView()
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }

  public func appendSection(title: String? = nil, inputs: [Row]) {
    let section = Section(title: title, rows: inputs)
    self.sections.append(section)
  }

  public override func numberOfSections(in tableView: UITableView) -> Int {
    return self.sections.count
  }

  public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return self.sections[indexPath.section].rows[indexPath.row].height
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sections[section].rows.count
  }

  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let row = self.sections[indexPath.section].rows[indexPath.row]
    row.tableView = tableView
    row.indexPath = indexPath
    cell.accessoryType = row.accesoryType
    cell.selectionStyle = row.selecctionStyle
    cell.contentView.addAutorisizingSubview(view: row)
    return cell
  }

  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let row = self.sections[indexPath.section].rows[indexPath.row]
    row.didTapHandler?()
  }
}
