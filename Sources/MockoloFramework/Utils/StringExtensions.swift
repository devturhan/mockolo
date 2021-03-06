//
//  Copyright (c) 2018. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

extension String {
    static let doneInit = "_doneInit"
    static let `static` = "static"
    static let `import` = "import "
    static public let `class` = "class"
    static let override = "override"
    static let mockType = "protocol"
    static let unknownVal = "Unknown"
    static let any = "Any"
    static let anyObject = "AnyObject"
    static let fatalError = "fatalError"
    static let handlerSuffix = "Handler"
    static let observableVarPrefix = "Observable<"
    static let rxObservableVarPrefix = "RxSwift.Observable<"
    static let rxPublishSubject = "RxSwift.PublishSubject"
    static let publishSubject = "PublishSubject"
    static let behaviorSubject = "BehaviorSubject"
    static let replaySubject = "ReplaySubject"
    static let rx = "Rx"
    static let observableEmpty = "Observable.empty()"
    static let rxObservableEmpty = "RxSwift.Observable.empty()"
    static let `required` = "required"
    static let `throws` = "throws"
    static let `rethrows` = "rethrows"
    static let `try` = "try"
    static let closureArrow = "->"
    static let `typealias` = "typealias"
    static let annotationArgDelimiter = ";"
    static let rxReplaySubject = "RxSwift.ReplaySubject"
    static let replaySubjectAllocSuffix = ".create(bufferSize: 1)"
    static let subjectSuffix = "Subject"
    static let underlyingVarPrefix = "underlying"
    static let setCallCountSuffix = "SetCallCount"
    static let callCountSuffix = "CallCount"
    static let closureVarSuffix = "Handler"
    static let initializerPrefix = "init("
    static let `escaping` = "@escaping"
    static let autoclosure = "@autoclosure"
    static public let mockAnnotation = "@mockable"
    static public let poundIf = "#if "
    static public let poundEndIf = "#endif"
    static public let headerDoc =
    """
    ///
    /// @Generated by Mockolo
    ///
    """

    var isThrowsOrRethrows: Bool {
        return self == .throws || self == .rethrows
    }
}

extension StringProtocol {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var capitlizeFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func shouldParse(with exclusionList: [String]? = nil) -> Bool {
        guard hasSuffix(".swift") else { return false }
        
        if let name = components(separatedBy: ".swift").first, let exlist = exclusionList {
            for ex in exlist {
                if name.hasSuffix(ex) {
                    return false
                }
            }
            return true
        }
        
        return false
    }
    
    var displayableComponents: [String] {
        let ret = self.replacingOccurrences(of: "?", with: "Optional")
        return ret.components(separatedBy: CharacterSet(charactersIn: "<>[] :,()_-.&@#!{}@+\"\'"))
    }

}
