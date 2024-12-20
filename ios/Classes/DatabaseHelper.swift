//
// Copyright 2015 - 2017 Anton Tananaev (anton@traccar.org)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import CoreData
import UIKit

public class DatabaseHelper: NSObject {
    
    let managedObjectContext: NSManagedObjectContext
    
    convenience override init() {
        self.init(managedObjectContext: TraccarController.shared.managedObjectContext!)
    }
    
    public init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        super.init()
    }
    
    public func selectPosition() -> Position? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Position")
        if let fetchedObjects = try? managedObjectContext.fetch(fetchRequest) {
            if fetchedObjects.count > 0 {
                return fetchedObjects[0] as? Position
            }
        }
        return nil
    }
    
    public func delete(position: Position) {
        managedObjectContext.delete(position)
    }

}
