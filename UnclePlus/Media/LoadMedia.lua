local _, UnclePlus = ...

local LSM = LibStub("LibSharedMedia-3.0")

local SetMediaName = function(name)
  return "UncleBone: " .. name
end

-- BACKGROUND
LSM:Register(
  "background",
  SetMediaName("Chat Background"),
  [[Interface\AddOns\UnclePlus\Media\background\UncleBoneUI_ChatBackground.tga]]
)
LSM:Register(
  "background",
  SetMediaName("common-icon-checkmark-yellow"),
  [[Interface\AddOns\UnclePlus\Media\textures\common-icon-checkmark-yellow.blp]]
)

-- FONT
function UnclePlus:RegisterFonts()
  local RegisterFont = function(name, filename, locales)
    LSM:Register("font", name, ([[Interface\AddOns\UnclePlus\Media\font\%s]]):format(filename), locales)
  end

  local WEST = LSM.LOCALE_BIT_western
  local RU = LSM.LOCALE_BIT_ruRU
  local ZHCN = LSM.LOCALE_BIT_zhCN
  local ZHTW = LSM.LOCALE_BIT_zhTW

  -- Latin/RU
  RegisterFont("ArchivoNarrow-Bold", "ArchivoNarrow-Bold.ttf", WEST + RU)
  RegisterFont("Expressway", "Expressway.ttf", WEST + RU)
  RegisterFont("HOOGE", "HOOGE.TTF", WEST + RU + ZHCN + ZHTW)
  RegisterFont("SFUIDisplayCondensed-Bold", "SFUIDisplayCondensed-Bold.ttf", WEST + RU)
  RegisterFont("SFUIDisplayCondensed-Semibold", "SFUIDisplayCondensed-Semibold.ttf", WEST + RU)
  RegisterFont("PT Sans Narrow", "PTSansNarrow.ttf", WEST + RU)
  RegisterFont("PT Sans Narrow Bold", "PTSansNarrow-Bold.ttf", WEST + RU)

  -- Chinese-capable
  RegisterFont("CN Merged (SF-Yahee)", "CN Merged (SF-Yahee).ttf", WEST + ZHCN + ZHTW)
end

---- SOUND

-- Alerts
LSM:Register("sound", SetMediaName("Alert Bell"), [[Interface\AddOns\UnclePlus\Media\sound\Alerts\AlertBell.mp3]])
LSM:Register(
  "sound",
  SetMediaName("Important Mechanic"),
  [[Interface\AddOns\UnclePlus\Media\sound\Alerts\Important Mechanic.mp3]]
)
LSM:Register("sound", SetMediaName("Info Beep"), [[Interface\AddOns\UnclePlus\Media\sound\Alerts\Info Beep.mp3]])
LSM:Register("sound", SetMediaName("Level Up"), [[Interface\AddOns\UnclePlus\Media\sound\Alerts\Level Up.mp3]])
LSM:Register("sound", SetMediaName("Soft Alert"), [[Interface\AddOns\UnclePlus\Media\sound\Alerts\Soft Alert.mp3]])
LSM:Register("sound", SetMediaName("Spell On You"), [[Interface\AddOns\UnclePlus\Media\sound\Alerts\Spell On You.mp3]])

-- Class: Paladin
LSM:Register(
  "sound",
  SetMediaName("Beacon Missing"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Paladin\BeaconMissing.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Sacred Shield Missing"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Paladin\SacredShieldMissing.mp3]]
)

-- Class: Warlock
LSM:Register(
  "sound",
  SetMediaName("Decimation"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Warlock\Decimation.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Drain Soul"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Warlock\DrainSoul.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Molten Core"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Warlock\MoltenCore.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("No Life Tap"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Warlock\NoLifeTap.mp3]]
)

-- Class: Hunter
LSM:Register(
  "sound",
  SetMediaName("Use Hunter Mark"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Hunter\UseHunterMark.mp3]]
)

-- Class: DK
LSM:Register(
  "sound",
  SetMediaName("Pestilence Miss"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\DK\PestilenceMiss.mp3]]
)

-- Class: Druid
LSM:Register(
  "sound",
  SetMediaName("Lunar Eclipse"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Druid\Lunar_Eclipse.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Solar Eclipse"),
  [[Interface\AddOns\UnclePlus\Media\sound\Class\Druid\Solar_Eclipse.mp3]]
)

-- Countdowns
LSM:Register("sound", "1", [[Interface\AddOns\UnclePlus\Media\sound\Countdowns\1.mp3]])
LSM:Register("sound", "2", [[Interface\AddOns\UnclePlus\Media\sound\Countdowns\2.mp3]])
LSM:Register("sound", "3", [[Interface\AddOns\UnclePlus\Media\sound\Countdowns\3.mp3]])
LSM:Register("sound", "4", [[Interface\AddOns\UnclePlus\Media\sound\Countdowns\4.mp3]])
LSM:Register("sound", "5", [[Interface\AddOns\UnclePlus\Media\sound\Countdowns\5.mp3]])

-- Other
LSM:Register(
  "sound",
  SetMediaName("Do Not Release"),
  [[Interface\AddOns\UnclePlus\Media\sound\Other\DoNotRelease.wav]]
)
LSM:Register(
  "sound",
  SetMediaName("Take Healhtstone Idiot"),
  [[Interface\AddOns\UnclePlus\Media\sound\Other\TakeHealhtstoneIdiot.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Wrong Action Bar"),
  [[Interface\AddOns\UnclePlus\Media\sound\Other\WrongActionBar.mp3]]
)

-- Positions
LSM:Register(
  "sound",
  SetMediaName("Go To Left Side"),
  [[Interface\AddOns\UnclePlus\Media\sound\Positions\GoToLeftSide.wav]]
)
LSM:Register(
  "sound",
  SetMediaName("Go To Middle Side"),
  [[Interface\AddOns\UnclePlus\Media\sound\Positions\GoToMiddleSide.wav]]
)
LSM:Register(
  "sound",
  SetMediaName("Go To Right Side"),
  [[Interface\AddOns\UnclePlus\Media\sound\Positions\GoToRightSide.wav]]
)
LSM:Register("sound", SetMediaName("Run Out"), [[Interface\AddOns\UnclePlus\Media\sound\Positions\RunOut.wav]])
LSM:Register("sound", SetMediaName("Spread Out"), [[Interface\AddOns\UnclePlus\Media\sound\Positions\SpreadOut.wav]])

-- RotationsWA
LSM:Register(
  "sound",
  SetMediaName("Use Defensive Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\RotationsWA\UseDefensiveSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Use Healthstone Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\RotationsWA\UseHealthstoneSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("You Are Next"),
  [[Interface\AddOns\UnclePlus\Media\sound\RotationsWA\YouAreNext.mp3]]
)

-- Raids: Icecrown Citadel

-- Trash
LSM:Register(
  "sound",
  SetMediaName("Decimate Cast"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Trash\DecimateCast.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Kill Horror"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Trash\KillHorror.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Stop Casting"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Trash\StopCasting.mp3]]
)

-- MGW
LSM:Register(
  "sound",
  SetMediaName("Whirlwind Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\MGW\WhirlwindSoon.mp3]]
)

-- LDW
LSM:Register(
  "sound",
  SetMediaName("Summon Spirits"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LDW\SummonSpirits.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Curse On You"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LDW\CurseOnYou.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Mass Dispel"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LDW\MassDispel.mp3]]
)

-- GSB
LSM:Register(
  "sound",
  SetMediaName("Mage Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\GSB\MageSoon.mp3]]
)

-- DBS
LSM:Register(
  "sound",
  SetMediaName("Summon Adds Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\DBS\SummonAddsSoon.mp3]]
)

-- Festergut
LSM:Register(
  "sound",
  SetMediaName("Explosion"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Festergut\Explosion.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("MalleableGoo"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Festergut\MalleableGoo.mp3]]
)

-- Rotface
LSM:Register(
  "sound",
  SetMediaName("Prepare For Explosion"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Rotface\PrepareForExplosion.mp3]]
)

-- PP
LSM:Register(
  "sound",
  SetMediaName("Red Cast"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\RedCast.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Choking Bomb Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\ChokingBombSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("MalleableGoo"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\MalleableGoo.mp3]]
)
LSM:Register("sound", SetMediaName("Red"), [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\Red.mp3]])
LSM:Register(
  "sound",
  SetMediaName("Green"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\Green.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Bomb Explosion"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\PP\BombExplosion.mp3]]
)

-- BPC
LSM:Register(
  "sound",
  SetMediaName("Target Switch"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\BPC\TargetSwitch.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Target Switch Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\BPC\TargetSwitchSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Empowered Vortex"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\BPC\EmpoweredVortex.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Kinetic Bomb"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\BPC\KineticBomb.mp3]]
)

-- VDW
LSM:Register(
  "sound",
  SetMediaName("Portals Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\VDW\PortalsSoon.mp3]]
)

-- Sindragosa
LSM:Register(
  "sound",
  SetMediaName("Watch Marks"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Sindragosa\WatchMarks.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Unchained Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Sindragosa\UnchainedSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Blistering Cold Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\Sindragosa\BlisteringColdSoon.mp3]]
)

-- LK
LSM:Register(
  "sound",
  SetMediaName("Summon Shambling"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LK\SummonShambling.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Summon Valkyrs"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LK\SummonValkyrs.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Summon Raging"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LK\SummonRaging.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Phasing Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LK\PhasingSoon.mp3]]
)
LSM:Register(
  "sound",
  SetMediaName("Defile Soon"),
  [[Interface\AddOns\UnclePlus\Media\sound\Raids\IcecrownCitadel\LK\DefileSoon.mp3]]
)

-- STATUSBAR
function UnclePlus:RegisterBars()
  LSM:Register("statusbar", "Flatt", [[Interface\Addons\UnclePlus\Media\statusbar\Flatt.blp]])
  LSM:Register("statusbar", "UncleBone Main Texture", [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneTexture.blp]])
  LSM:Register(
    "statusbar",
    "UncleBone Plater Border",
    [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneBorderPlater.tga]]
  )
  LSM:Register(
    "statusbar",
    "UncleBone Plater Border (1px)",
    [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneBorderPlater_1px.tga]]
  )

  LSM:Register("statusbar", "UncleBoneMain", [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneMain.tga]])
  LSM:Register("statusbar", "UncleBoneMainDark", [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneMainDark.tga]])
  LSM:Register("statusbar", "UncleBoneMainLeft", [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneMainLeft.tga]])
  LSM:Register("statusbar", "UncleBoneMainRight", [[Interface\Addons\UnclePlus\Media\statusbar\UncleBoneMainRight.tga]])
end
