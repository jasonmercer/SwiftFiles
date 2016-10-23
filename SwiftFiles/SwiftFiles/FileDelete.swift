//
//  Created by Anthony Levings on 25/06/2014.

//

import Foundation


public struct FileDelete {
    
    public static func deleteFile(path:String, directory:FileManager.SearchPathDirectory,  subdirectory:String?) throws
    {
        let deletePath = buildPath(path: path, inDirectory: directory, subdirectory: subdirectory)
        
        // Delete the file and see if it was successful

        try FileManager.default.removeItem(atPath: deletePath)
        
        
        
    }
    
    
    public static func deleteFileFromTemporaryDirectory(path:String, subdirectory:String?) throws
    {
        let deletePath = buildPathToTemporaryDirectory(path: path, subdirectory: subdirectory)
        
        // Delete the file and see if it was successful

        try FileManager.default.removeItem(atPath: deletePath)
        
        
    }
    
    
    // Delete folders
    
    public static func deleteSubDirectory(directory:FileManager.SearchPathDirectory, subdirectory:String) throws
    {
        // Remove unnecessary slash if need
        let subDir = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: subdirectory)
        
        // Create generic beginning to file delete path
        var deletePath = ""
        
        if let direct = FileDirectory.applicationDirectory(directory: directory),
            let path = direct.path {
                deletePath = path + "/"
        }
        
        
        deletePath += subDir
        deletePath += "/"
        
        
        var dir:ObjCBool = true
        let dirExists = FileManager.default.fileExists(atPath: deletePath, isDirectory:&dir)
        if dir.boolValue == false {
            // FIXME: return error here
            return
        }
        if dirExists == false {
            // FIXME: return error here
            return
        }
        
        
        // Delete the file and see if it was successful

        try FileManager.default.removeItem(atPath: deletePath)
        
        
        
    }
    
    
    
    
    public static func deleteSubDirectoryFromTemporaryDirectory(subdirectory:String) throws
    {
        // Remove unnecessary slash if need
        let subDir = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: subdirectory)
        
        // Create generic beginning to file delete path
        var deletePath = ""
        
        if let direct = FileDirectory.applicationTemporaryDirectory(),
            let path = direct.path {
                deletePath = path + "/"
        }
        
        
        deletePath += subDir
        deletePath += "/"
        
        
        var dir:ObjCBool = true
        let dirExists = FileManager.default.fileExists(atPath: deletePath, isDirectory:&dir)
        if dir.boolValue == false {
            // FIXME: throw error
            return
        }
        if dirExists == false {
            // FIXME: throw error
            return
        }
        
        // Delete the file and see if it was successful

        try FileManager.default.removeItem(atPath: deletePath)
        
    }
    
    // private methods
    
    private static func buildPath(path:String, inDirectory directory:FileManager.SearchPathDirectory, subdirectory:String?) -> String  {
        // Remove unnecessary slash if need
        let newPath = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: path)
        var subDir:String?
        if let sub = subdirectory {
            subDir = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: sub)
        }
        
        // Create generic beginning to file load path
        var loadPath = ""
        
        if let direct = FileDirectory.applicationDirectory(directory: directory),
            let path = direct.path {
                loadPath = path + "/"
        }
        
        if let sub = subDir {
            loadPath += sub
            loadPath += "/"
        }
        
        // Add requested load path
        loadPath += newPath
        return loadPath
    }
    
    public static func buildPathToTemporaryDirectory(path:String, subdirectory:String?) -> String {
        // Remove unnecessary slash if need
        let newPath = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: path)
        var subDir:String?
        if let sub = subdirectory {
            subDir = FileHelper.stripSlashIfNeeded(stringWithPossibleSlash: sub)
        }
        
        // Create generic beginning to file load path
        var loadPath = ""
        
        if let direct = FileDirectory.applicationTemporaryDirectory(),
            let path = direct.path {
                loadPath = path + "/"
        }
        
        if let sub = subDir {
            loadPath += sub
            loadPath += "/"
        }
        
        // Add requested save path
        loadPath += newPath
        return loadPath
    }
    
}
