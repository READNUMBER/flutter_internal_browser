import Flutter
import UIKit
import SafariServices

public class SwiftInternalBrowserPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "internal_browser", binaryMessenger: registrar.messenger())
    let instance = SwiftInternalBrowserPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "open" {
      guard let url = URL(string: call.arguments as! String) else { return }
      var viewController = UIApplication.shared.delegate?.window??.rootViewController
      if viewController?.presentedViewController != nil && viewController?.presentedViewController?.isBeingDismissed == nil {
          viewController = viewController?.presentedViewController
      }

      let sfvc = SFSafariViewController(url: url)
      viewController?.present(sfvc, animated: true)
      result(nil)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
