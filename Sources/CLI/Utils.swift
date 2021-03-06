//
//  Utils.swift
//  Prism
//
//  Created by Shai Mishali on 17/04/2020.
//  Copyright © 2019 Gett. All rights reserved.
//

#if os(Linux)
import Glibc
let os_exit: (Int32) -> Never = Glibc.exit
#elseif os(Windows)
import ucrt
let os_exit: (Int32) -> Never = ucrt.exit
#else
import Darwin
let os_exit: (Int32) -> Never = Darwin.exit
#endif

func terminate(with message: String?) -> Never {
    if let message = message {
        print(message)
    }

    os_exit(1)
}

extension String {
    func droppingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }

    func droppingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
}
