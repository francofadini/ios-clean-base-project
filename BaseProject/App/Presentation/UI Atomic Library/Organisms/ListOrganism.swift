import Foundation
import UIKit

public protocol ListOrganismCell {
  associatedtype ViewDataType
  static var cellIdentifier: String {get set}
  static var nibName: String? {get set}
  func bind(with viewData: ViewDataType) -> UITableViewCell
}

public class ListOrganism<Cell: UITableViewCell & ListOrganismCell>: UITableViewController {
  var data = [Cell.ViewDataType]()
  var cellHeight: CGFloat = 44.0
  
  private var editActions = [UITableViewRowAction]()

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView()
    self.tableView.dataSource = self
    self.tableView.delegate = self

    if let nibName = Cell.nibName {
      self.tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: Cell.cellIdentifier)
    } else {
      self.tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
    }
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }

  public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return cellHeight
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
  
  public override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return editActions.count > 0
  }
  
  public override func tableView(_ tableView: UITableView,
                                 editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    return editActions
  }

  public func reload(with data: [Cell.ViewDataType]) {
    self.data = data
    self.tableView.reloadData()
  }
  
  public func addEditAction(action: UITableViewRowAction) {
    self.editActions.append(action)
  }
}
