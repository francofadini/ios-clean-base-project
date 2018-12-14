import Foundation
import UIKit

public protocol ListOrganismCell {
  associatedtype ViewDataType
  static var cellIdentifier: String {get set}
  static var cellHeight: CGFloat {get set}
  func bind(with viewData: ViewDataType) -> UITableViewCell
}

public class ListOrganism<Cell: UITableViewCell & ListOrganismCell>: UITableViewController {
  var data = [Cell.ViewDataType]()

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }

  public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Cell.cellHeight
  }

  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as? Cell {
      let data = self.data[indexPath.row]
      return cell.bind(with: data)
    }
    return UITableViewCell()
  }

  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

  public func reload(with data: [Cell.ViewDataType]) {
    self.data = data
    self.tableView.reloadData()
  }
}

public class ListOrganismBuilder<Cell: UITableViewCell & ListOrganismCell> {
  private var data = [Cell.ViewDataType]()

  public func build() -> ListOrganism<Cell> {
    let list = ListOrganism<Cell>()
    list.data = self.data
    return list
  }
}
