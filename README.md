# <span style="color: #b2c8ff;">🔷 </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #b2c8ff;">| </span> <span style="color: #b2c8ff;">K</span><span style="color: #ffffff;">ingdom </span><span style="color: #b2c8ff;">H</span><span style="color: #ffffff;">earts 3 </span><span style="color: #b2c8ff;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #b2c8ff;">U</span><span style="color: #ffffff;">p</span><span style="color: #b2c8ff;">!</span>

![KH3LU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #b2c8ff;">🎯 Overview</span>

**Kingdom Hearts 3 Level-Up! (KH3LU)** replaces World of Warcraft's configured default level-up sound with a Kingdom Hearts 3-inspired "NEW GAME!" chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Share your heart! Bwwiiiee."</span>

***

## <span style="color: #b2c8ff;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Kingdom Hearts 3 sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #b2c8ff;">✨ Behavior and Features</span>

- Plays the selected Kingdom Hearts 3-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while KH3LU is enabled.
- Persists enablement and sound-variant choices in `KH3LUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.

KH3LU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #b2c8ff;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `KingdomHearts3LevelUp.toc` | `120100` |
| WoW Forever (Beta) | `KingdomHearts3LevelUp_Forever.toc` | `16001` |
| Mists of Pandaria Classic | `KingdomHearts3LevelUp_Mists.toc` | `50504` |
| Cataclysm Classic | `KingdomHearts3LevelUp_Cata.toc` | `40402` |
| Wrath Classic | `KingdomHearts3LevelUp_Wrath.toc` | `38002` |
| Burning Crusade Classic | `KingdomHearts3LevelUp_TBC.toc` | `20506` |
| Classic Era | `KingdomHearts3LevelUp_Vanilla.toc` | `11509` |

These values describe the current release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #b2c8ff;">📥 Installation</span>

1. Download a packaged release of KingdomHearts3LevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `KingdomHearts3LevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Kingdom Hearts 3 Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #b2c8ff;">⌨️ Usage and Configuration</span>

KH3LU works automatically once enabled. It has no graphical configuration panel; use `/kh3lu` commands in chat:

| Command | Result |
|---|---|
| `/kh3lu` or `/kh3lu help` | List available commands. |
| `/kh3lu test` | Play the selected sound variant. |
| `/kh3lu enable` | Enable replacement playback. |
| `/kh3lu disable` | Disable replacement playback. |
| `/kh3lu high` | Select the high-quality file. |
| `/kh3lu med` or `/kh3lu medium` | Select the medium-quality file. |
| `/kh3lu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `KH3LUSettings`.

***

## <span style="color: #b2c8ff;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/kh3lu` command.
- `sounds/kingdom_hearts_3_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, KH3LU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #b2c8ff;">🛠️ Troubleshooting</span>

- If WoW marks KH3LU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/kh3lu test`, then `/kh3lu enable` and select a variant again.
- If the default sound also plays, verify that KH3LU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/KingdomHearts3LevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #b2c8ff;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/KingdomHearts3LevelUp)
- [Releases](https://github.com/RGXMods/KingdomHearts3LevelUp/releases)
- [Issues](https://github.com/RGXMods/KingdomHearts3LevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
