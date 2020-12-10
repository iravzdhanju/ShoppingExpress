

import UIKit
import CoreData

class SaveShoppingList{
    
    
    
    func saveCart(_ list:[String],_ entity:String,_ key:String)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entity, in: context)
        let newEntity = NSManagedObject(entity:entity!, insertInto: context)
        newEntity.setValue(list , forKey: key)
        do{
            try context.save()
        
        }catch{
            
        }
        
    }
    
    
 
    
    func getCart(_ entity:String,_ key:String)->[String]{
        var list = [""]
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                list = data.value(forKey: key)as![String]
            }
        }catch{
         print("Didnt Work")
        }
        print("Called ")
        return list
    }
    
    
    


}
