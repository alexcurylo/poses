// @copyright Trollwerks Inc.

import CoreData

extension NSManagedObjectContext {

    /// Return entity count
    /// - Parameters:
    ///   - name: Template name
    ///   - subs: Template substitutions
    ///   - sort: Placeholder for actual returnage
    func count(template name: String,
               subs: [String: Any] = [:],
               sort: NSSortDescriptor? = nil) -> Int {
        guard let mom = persistentStoreCoordinator?.managedObjectModel else {
            return 0
        }

        let template: NSFetchRequest<NSFetchRequestResult>?
        if subs.isEmpty {
            template = mom.fetchRequestTemplate(forName: name)
        } else {
            template = mom.fetchRequestFromTemplate(withName: name,
                                                    substitutionVariables: subs)
        }
        guard let request = template else { return 0 }

        request.resultType = NSFetchRequestResultType.countResultType
        if let sort = sort { request.sortDescriptors = [sort] }
        do {
            let visible = try count(for: request)
            return visible
        } catch {
            let nserror = error as NSError
            print("count error \(nserror), \(nserror.userInfo)")
            return 0
        }
    }

    /// Returns whether count > 0 for fetch
    /// - Parameters:
    ///   - name: Template name
    ///   - subs: Template substitutions
    func exists(template name: String,
                subs: [String: Any] = [:]) -> Bool {
        count(template: name, subs: subs) > 0
    }
}
