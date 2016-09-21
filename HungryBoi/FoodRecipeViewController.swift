import UIKit
import HungryBoiCommon
import CoreData
import WatchConnectivity



class FoodDataSource {
  
  internal private(set) var recipes: [Recipe]
  
  init(recipes: [Recipe]) {
    self.recipes = recipes
  }
  
  func numberOfSections()-> Int {
    return 1
  }
  
  func removeRecipe(at index:Int)-> Recipe {
    let recipeToRemove = recipes.remove(at: index)
    return recipeToRemove
  }
  
  func titleForRecipe(at indexPath: IndexPath)-> String {
    let recipeAtIndexPath: Recipe = recipes[indexPath.row]
    return recipeAtIndexPath.name 
  }
}

class FoodRecipeViewController: UITableViewController {
  
  var foodDataSource: FoodDataSource?
  var persistentContainer: NSPersistentContainer!
  var watchService: PhoneToWatchService!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Hungry Boi Snacks"
    updateTableViewRecipes()
    setUpTableView()
  }
  
  func delete(at index: Int) {
    
    guard let foodDataSource = foodDataSource else {
      return
    }
    
    let context = persistentContainer.viewContext
    let removedRecipe = foodDataSource.removeRecipe(at: index)
    context.delete(removedRecipe)
    try! context.save()
    self.watchService.sendRecipesToWatch(recipes: foodDataSource.recipes)
  }
  
  private func updateTableViewRecipes() {
    
    Recipe.fetchAll(from: persistentContainer) { [unowned self] fetchedRecipes in
      self.foodDataSource = FoodDataSource(recipes: fetchedRecipes)
      self.tableView.reloadSections(IndexSet(integer:0), with: .fade)
      self.watchService.sendRecipesToWatch(recipes: fetchedRecipes)
    }
  }
  
  @IBAction func add(_ sender: AnyObject) {
    
    let alertController = UIAlertController(title: "Add recipe", message: "", preferredStyle: .alert)
    
    alertController.addTextField(configurationHandler: nil)
    alertController.addAction(UIAlertAction(title: "Add", style: .default) { [weak self] action in
      let text = alertController.textFields?.first?.text ?? ""
      self?.createNewRecipe(recipeName: text)
      self?.updateTableViewRecipes()
    })
    
    present(alertController, animated: true)
  }
  
  private func createNewRecipe(recipeName: String) {
    let context = persistentContainer.viewContext
    let _ = Recipe(name: recipeName, context: context)
    try! context.save()
  }
  
  private func setUpTableView() {
    
    tableView.register(
      UINib(nibName: FoodTableViewCell.identifier, bundle: nil),
      forCellReuseIdentifier: FoodTableViewCell.identifier
    )
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let foodDataSource = foodDataSource else {
      return 0
    }
    
    return foodDataSource.recipes.count
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .delete:
      delete(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    default:
      break
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let foodDataSource = foodDataSource else {
      fatalError("Did not instantiate food data source")
    }
    
    let cell = tableView.dequeueReusableCell(
      withIdentifier: FoodTableViewCell.identifier,
      for: indexPath
      ) as! FoodTableViewCell
    
    
    cell.foodNameLabel.text = foodDataSource.titleForRecipe(at: indexPath)
    return cell
  }
  
}
