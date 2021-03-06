//
//  AppDelegate.swift
//  MyMemory
//
//  Created by 이동영 on 18/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var memoList = [MemoData]()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(1)
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = UIColor.white
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


    /**=============================================================
     - Note:     앱이 종료될때 호출
     ===============================================================**/
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        self.saveContext()
    }
    
    
    
    // - MARK: - 코어데이터 반입시 추가 구현부
    /**=============================================================
     - Note:     앱이 종료될때 호출
     ===============================================================**/
    
    lazy var persistentContainer : NSPersistentContainer = {
        
        /// - Note: 영구 컨테이너객체 생성 -- 'DataModel'파일을 바탕으로 생성
        let container = NSPersistentContainer(name: "MyMemory")
        
        /// - Note: 영구 저장소 정보를 읽어서 변수 초기화
        container.loadPersistentStores{
            if let error = $1 as NSError?{
                fatalError("Unsolved error \(error), \(error.userInfo) ")
            }
        }
        
        return container
    }()
    
    
    func saveContext(){
        let context = persistentContainer.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
                
            }catch let error as NSError{
                fatalError("Unsolved error \(error), \(error.userInfo) ")
            }
        }
    }

}

