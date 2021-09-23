//
//  ActivityController.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation
import UIKit

final class ActivityController {

    private let navigator = ActivityControllerNavigator()
    private lazy var codingService = CodingService()

    func writeData<T: Encodable>(_ data: T, withName fileName: String, withExtension fileExtension: String) {
        guard let content = codingService.getJsonString(from: data) else {
            handleError() ; return
        }
        writeFile(content: content, withName: fileName, withExtension: fileExtension)
    }

    func writeFile(content: String, withName fileName: String, withExtension fileExtension: String) {
        guard let directoryURL = getDirectoryURL(for: fileName + "." + fileExtension) else {
            handleError() ; return
        }
        do {
            try content.write(to: directoryURL, atomically: true, encoding: .utf8)
            presentActivityController(with: directoryURL)
        } catch {
            handleError()
            print(error.localizedDescription)
        }
    }
}

// MARK: - Helpers

extension ActivityController {
    private func presentActivityController(with directory: URL) {
        let activityController = UIActivityViewController(activityItems: [directory], applicationActivities: nil)
        guard let viewController = rootViewController else {
            handleError() ; return
        }
        viewController.present(activityController, animated: true)
    }

    private func handleError() {
        navigator.navigate(to: .someErrorOccurred)
    }

    private func getDirectoryURL(for fileName: String) -> URL? {
        NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
    }

    private var rootViewController: UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}
