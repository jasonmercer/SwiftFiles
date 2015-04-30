//: Playground - noun: a place where people can play

import UIKit
import Foundation


FileSave.saveStringToTemporaryDirectory("hello World", path: "myString.txt", subdirectory: "")

FileSave.saveString("hello world", directory: NSSearchPathDirectory.DocumentDirectory, path: "myString.txt", subdirectory: "MyFiles")
FileLoad.loadString("myString.txt", directory: NSSearchPathDirectory.DocumentDirectory, subdirectory: "MyFiles", encoding: NSUTF8StringEncoding)
//FileDelete.deleteFile("myString.txt", directory: NSSearchPathDirectory.DocumentDirectory, subdirectory: "MyFiles")
FileLoad.loadString("myString.txt", directory: NSSearchPathDirectory.DocumentDirectory, subdirectory: "MyFiles", encoding: NSUTF8StringEncoding) // returns nil file is deleted

let data = "Hello Swift My Friend!".dataUsingEncoding(NSUTF8StringEncoding)!
FileSave.saveData(data, directory: NSSearchPathDirectory.CachesDirectory, path: "myFile.txt", subdirectory: "Data")
FileLoad.loadData("myFile.txt", directory: NSSearchPathDirectory.CachesDirectory, subdirectory: "Data") == data // true

// find out the location of your files to use in Finder -> Go -> Go to Directory dialogue box
FileDirectory.applicationDirectory(NSSearchPathDirectory.DocumentDirectory)
FileDirectory.applicationTemporaryDirectory()

for files in FileList.allFilesAndFolders(inDirectory: NSSearchPathDirectory.CachesDirectory, subdirectory: "Data")! {
    files
}

for files in FileList.allFilesAndFoldersInTemporaryDirectory(nil)! {
    files
}
