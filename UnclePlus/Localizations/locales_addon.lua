local _, UnclePlus = ...

UnclePlus.L = {}
local L = UnclePlus.L

-- enUS
L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
  "A reload of the interface is required for this change to take effect.\n\nReload now?"
L["Author: "] = "Author: "
L["Version:"] = "Version:"
L["Media"] = "Media"
L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
  "UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."
L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
  "Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."
L["Select font for element "] = "Select font for element "
L["Select status bar texture for element "] = "Select status bar texture for element "
L["Profiles"] = "Profiles"

local locale = GAME_LOCALE or GetLocale()

-- deDE
if locale == "deDE" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "Ein Neuladen der Benutzeroberfläche ist erforderlich, damit diese Änderung wirksam wird.\n\nJetzt neu laden?"
  L["Author: "] = "Autor: "
  L["Version:"] = "Version:"
  L["Media"] = "Medien"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus stellt benutzerdefinierte Schriftarten, Texturen und Hilfsprogramme bereit, die WeakAuras und andere UncleBone-UI-Komponenten erweitern oder unterstützen."
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "Ändere die primären Schriftarten und Statusleisten-Texturen der UncleBone-Funktionen. Ein UI-Neuladen ist erforderlich."
  L["Select font for element "] = "Schriftart auswählen für Element "
  L["Select status bar texture for element "] = "Statusleisten-Textur auswählen für Element "
  L["Profiles"] = "Profile"

-- frFR
elseif locale == "frFR" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "Un rechargement de l’interface est requis pour que ce changement prenne effet.\n\nRecharger maintenant ?"
  L["Author: "] = "Auteur : "
  L["Version:"] = "Version :"
  L["Media"] = "Médias"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus fournit des polices, textures et utilitaires personnalisés pour améliorer ou compléter WeakAuras et d’autres composants de l’interface UncleBone."
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "Modifier les polices principales et les textures de barres d’état utilisées par les fonctionnalités UncleBone. Un rechargement de l’interface est requis."
  L["Select font for element "] = "Sélectionner la police pour l’élément "
  L["Select status bar texture for element "] = "Sélectionner la texture de barre d’état pour l’élément "
  L["Profiles"] = "Profils"

-- ruRU
elseif locale == "ruRU" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "Для применения этого изменения требуется перезагрузка интерфейса.\n\nПерезагрузить сейчас?"
  L["Author: "] = "Автор: "
  L["Version:"] = "Версия:"
  L["Media"] = "Медиа"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus предоставляет пользовательские шрифты, текстуры и утилиты для улучшения или поддержки WeakAuras и других компонентов интерфейса UncleBone."
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "Измените основные шрифты и текстуры полос состояния. Требуется перезагрузка интерфейса."
  L["Select font for element "] = "Выберите шрифт для элемента "
  L["Select status bar texture for element "] =
    "Выберите текстуру полосы состояния для элемента "
  L["Profiles"] = "Профили"

-- koKR
elseif locale == "koKR" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "이 변경 사항을 적용하려면 인터페이스를 다시 불러와야 합니다.\n\n지금 다시 불러오시겠습니까?"
  L["Author: "] = "제작자: "
  L["Version:"] = "버전:"
  L["Media"] = "미디어"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus는 사용자 정의 글꼴, 텍스처 및 유틸리티를 제공합니다."
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "기본 글꼴 및 상태 표시줄 텍스처를 변경합니다. UI 재시작 필요."
  L["Select font for element "] = "요소 글꼴 선택 "
  L["Select status bar texture for element "] = "상태바 텍스처 선택 "
  L["Profiles"] = "프로필"

-- zhTW
elseif locale == "zhTW" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "需要重新載入介面才能使此變更生效。\n\n現在重新載入？"
  L["Author: "] = "作者："
  L["Version:"] = "版本："
  L["Media"] = "媒體"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus 提供自訂字型、材質與工具。"
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "變更主要字型與狀態列材質，需要重新載入介面。"
  L["Select font for element "] = "選擇字型 "
  L["Select status bar texture for element "] = "選擇材質 "
  L["Profiles"] = "設定檔"

-- zhCN
elseif locale == "zhCN" then
  L["A reload of the interface is required for this change to take effect.\n\nReload now?"] =
    "需要重新加载界面才能使此更改生效。\n\n现在重新加载？"
  L["Author: "] = "作者："
  L["Version:"] = "版本："
  L["Media"] = "媒体"
  L["UnclePlus provides custom fonts, textures, and utilities that enhance or support WeakAuras and other UncleBone UI components."] =
    "UnclePlus 提供自定义字体、材质和工具。"
  L["Change primary fonts and status bar textures used by UncleBone features. A UI reload is required."] =
    "更改字体和状态条材质，需要重新加载界面。"
  L["Select font for element "] = "选择字体 "
  L["Select status bar texture for element "] = "选择材质 "
  L["Profiles"] = "配置文件"
end

-- Make missing translations available
setmetatable(UnclePlus.L, {
  __index = function(self, key)
    self[key] = key or ""
    return key
  end,
})
