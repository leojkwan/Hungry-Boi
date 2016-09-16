import UIKit
import CoreData

let persistentContainer: NSPersistentContainer = {
  let container = NSPersistentContainer(name: "HungryBoi")
  container.loadPersistentStores { storeDescription, error in
    if let error = error as NSError? {
      fatalError("Unresolved error \(error), \(error.userInfo)")
    }
  }
  return container
}()

class FoodDataSource {
  private var recipes: [Recipe]
  
  init(recipes: [Recipe]) {
    self.recipes = recipes
  }
  
  func numberOfRecipes(in section: Int)-> Int {
    // we only have 1 section for now,
    // just return recipes array count.
    return recipes.count
  }
  
  func numberOfSections()-> Int {
    return 1
  }
  
  func removeRecipe(at index:Int)-> Recipe {
    let recipeToRemove = recipes.remove(at: index)
    return recipeToRemove
  }
  
  func titleForRecipe(at indexPath: IndexPath)-> String {
    let recipeAtIndexPath = recipes[indexPath.row]
    return recipeAtIndexPath.name ?? ""
  }
  //
  //  func imageForRecipe(at indexPath: IndexPath)-> UIImage? {
  //    let recipeAtIndexPath = recipes[indexPath.row]
  //    return recipeAtIndexPath.image
  //  }
}

class FoodRecipeViewController: UITableViewController {
  
  var foodDataSource: FoodDataSource!
  var recipes: [Recipe]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateTableViewRecipes()
    setUpTableView()
  }
  
  func delete(at index: Int) {
    let context = persistentContainer.viewContext
    
    let removedRecipe = foodDataSource.removeRecipe(at: index)
    
    context.delete(removedRecipe)
    
    try! context.save()
  }
  
  private func updateTableViewRecipes() {
    Recipe.fetch(from: persistentContainer) { [unowned self] fetchedRecipes in
      self.recipes = fetchedRecipes
      self.foodDataSource = FoodDataSource(recipes: fetchedRecipes)
      self.tableView.reloadSections(IndexSet(integer:0), with: .fade)
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
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if recipes == nil {
      return 0
    }
    return foodDataSource.numberOfRecipes(in: section)
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
    let cell = tableView.dequeueReusableCell(
      withIdentifier: FoodTableViewCell.identifier,
      for: indexPath
      ) as! FoodTableViewCell
    cell.foodNameLabel.text = foodDataSource.titleForRecipe(at: indexPath)
    //    cell.foodImageView.image = foodDataSource.imageForRecipe(at: indexPath)
    return cell
  }
  
}
