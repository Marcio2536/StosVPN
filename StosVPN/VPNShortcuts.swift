import Foundation
import AppIntents

@available(iOS 16.0, *)
struct StartVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Start VPN"
    static var description = IntentDescription("Start the StosVPN connection")

    @MainActor
    func perform() async throws -> some IntentResult {
        TunnelManager.shared.startVPN()
        return .result()
    }
}

@available(iOS 16.0, *)
struct StopVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Stop VPN"
    static var description = IntentDescription("Stop the StosVPN connection")

    @MainActor
    func perform() async throws -> some IntentResult {
        TunnelManager.shared.stopVPN()
        return .result()
    }
}

@available(iOS 16.0, *)
struct ToggleVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle VPN"
    static var description = IntentDescription("Toggle the StosVPN connection")

    @MainActor
    func perform() async throws -> some IntentResult {
        TunnelManager.shared.toggleVPNConnection()
        return .result()
    }
}

@available(iOS 16.0, *)
struct VPNShortcuts: AppShortcutsProvider {
    static var shortcutTileColor: ShortcutTileColor = .teal

    static var appShortcuts: [AppShortcut] {
        [
            AppShortcut(
                intent: StartVPNIntent(),
                phrases: ["Start VPN in \(appname)"]
            ),
            AppShortcut(
                intent: StopVPNIntent(),
                phrases: ["Stop VPN in \(appname)"]
            ),
            AppShortcut(
                intent: ToggleVPNIntent(),
                phrases: ["Toggle VPN in \(appname)"]
            )
        ]
    }
}
