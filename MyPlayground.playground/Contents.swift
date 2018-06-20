// mock, dependency injection, interfaces
import UIKit

protocol UserAPI {
    func createUser(name: String, complete: @escaping (_ error: Error?) -> Void)
}

class UserProductionAPI: UserAPIProtocol {
    func createUser(name: String, complete: @escaping (_ error: Error?) -> Void) {
        //network operation that takes 1s
        complete(nil)
    }
}

class MockUserAPI: UserAPIProtocol {
    var shouldFail = false
    
    func createUser(name: String, complete: @escaping (_ error: Error?) -> Void) {
        if shouldFail  {
            complete(MyErrors.error1)
        } else {
            complete(nil)
        }
        
    }
}

enum MyErrors: Error {
    case error1
}



class UserService {
    let api: UserAPIProtocol
    
    init(api: UserAPIProtocol) {
        self.api = api
    }
    
    func registerAUser(username: String, complete: @escaping (_ success: Bool) -> Void) {
        api.createUser(name: username) { error in
            if let err = error  {
                print(err)
                complete(false)
                return
            }
            //send notification somewhere
            
            complete(true)
        }
    }
}

//----- unit test code
//test 1 - failing
let mock = MockUserAPI()
mock.shouldFail = true
let userService = UserService(api: mock)

userService.registerAUser("asdasdas") { success in
    success == false //this should be false
}


//test 1 - failing
let mock = MockUserAPI()
mock.shouldFail = false
let userService = UserService(api: mock)

userService.registerAUser("asdasdas") { success in
    success == true //this should be true !!!!
}
