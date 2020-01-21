// @copyright Trollwerks Inc.

import CoreData

extension NSManagedObjectContext {

    /// Return a string for entity count display
    /// - Parameters:
    ///   - name: Template name
    ///   - subs: Template substitutions
    ///   - sort: Placeholder for actual returnage
    func count(template name: String,
               subs: [String: Any] = [:],
               sort: NSSortDescriptor? = nil) -> String {
        guard let request = persistentStoreCoordinator?
            .managedObjectModel
            .fetchRequestFromTemplate(
                withName: name,
                substitutionVariables: subs) else { return "" }

        request.resultType = NSFetchRequestResultType.countResultType
        if let sort = sort { request.sortDescriptors = [sort] }
        do {
            let visible = try count(for: request)
            return String(visible)
        } catch {
            let nserror = error as NSError
            print("visible error \(nserror), \(nserror.userInfo)")
            return ""
        }
    }
}
