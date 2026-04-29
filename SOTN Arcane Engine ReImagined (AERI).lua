------------------------------------------------------------------------------------------------------------------------
------------------------- Castlevania: Symphony of the Night - Arcane Engine ReImagined (AERI) -------------------------
------------------------------------------------------------------------------------------------------------------------
-- Welcome to Arcane Engine ReImagined!!! Check out the README and Config files for more info and setup options!
-- Please ignore any and all spaghetti code. I am not a programmer, nor do I want to be :)

-- Script by: Justin Krekel




------------------------------------------------------------------------------------------------------------------------
-- SCRIPT START
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------
-- CUSTOM ASSET LOADER
------------------------------------------------------------
gui.clearImageCache()
local splashscreen_img = ".\\Assets\\Splash_Screen.png"
local logo_img = ".\\Assets\\AERI_Logo.png"
local spellframe_img = ".\\Assets\\Spell_Frame.png"
local spellframehanger_img = ".\\Assets\\Spell_Frame_Hanger.png"
local cdglassframe_img = ".\\Assets\\Cooldown_Meter_Frame.png"
local batanim_img = ".\\Assets\\bat_flap_sheet_glow.png"
local wolfanim_img = ".\\Assets\\wolf_dash_sheet.png"
local gravanim_img = ".\\Assets\\nyanucard_sheet.png"
local dashanim_img = ".\\Assets\\shield_dash_sheet.png"
local mp_arrow_img = ".\\Assets\\MP_dagger1.png"
local nomp_arrow_img = ".\\Assets\\MP_dagger2.png"
local mp_arrow_nomana_img = ".\\Assets\\manna_prism.png"
local mannaprism_img = ".\\Assets\\manna_prism.png"
local swordbro_img = ".\\Assets\\sword_bro1.png"
local noswordbro_img = ".\\Assets\\sword_bro2.png"
local librarycard_img = ".\\Assets\\library_card.png"

------------------------------------------------------------
-- ANIMATION SYSTEM INITIALIZATION
------------------------------------------------------------
function CreateAnimation(sprite_path, animframes, sequence, speed)
    local anim = {}

    anim.image = sprite_path
    anim.frames = animframes
    anim.sequence = sequence
    anim.speed = speed

    anim.timer = 0
    anim.index = 1

    return anim
end

function UpdateAnimation(anim)
    anim.timer = anim.timer + 1

    if anim.timer >= anim.speed then
        anim.timer = 0
        anim.index = anim.index + 1

        if anim.index > #anim.sequence then
            anim.index = 1
        end
    end
end

function DrawAnimation(anim, x, y)
    local frame_id = anim.sequence[anim.index]
    local f = anim.frames[frame_id]

    gui.drawImageRegion(
        anim.image,
        f.x, f.y,
        f.w, f.h,
        x, y
    )
end

-- bat anim data
local bat_dimW = 22
local bat_dimH = 25
local bat_frames = {
    [1] = { x = 0,  y = 0, w = bat_dimW, h = bat_dimH },
    [2] = { x = 26, y = 0, w = bat_dimW, h = bat_dimH },
    [3] = { x = 52, y = 0, w = bat_dimW, h = bat_dimH },
    [4] = { x = 78, y = 0, w = bat_dimW, h = bat_dimH },
    [5] = { x = 104, y = 0, w = bat_dimW, h = bat_dimH },
    [6] = { x = 129, y = 0, w = bat_dimW, h = bat_dimH }
}

local bat_sequence = {1,2,3,4,5,6,6,5,4,3,2,1}

local bat_anim = CreateAnimation(
    batanim_img,
    bat_frames,
    bat_sequence,
    8 -- speed
)

-- wolf anim data
local wolf_dimW = 41
local wolf_dimH = 13
local wolf_frames = {
    [1] = { x = 0,  y = 0, w = wolf_dimW, h = wolf_dimH },
    [2] = { x = 44, y = 0, w = wolf_dimW, h = wolf_dimH },
    [3] = { x = 88, y = 0, w = wolf_dimW, h = wolf_dimH },
    [4] = { x = 132, y = 0, w = wolf_dimW, h = wolf_dimH },
    [5] = { x = 176, y = 0, w = wolf_dimW, h = wolf_dimH },
    [6] = { x = 220, y = 0, w = wolf_dimW, h = wolf_dimH },
    [7] = { x = 264, y = 0, w = wolf_dimW, h = wolf_dimH },
    [8] = { x = 308, y = 0, w = wolf_dimW, h = wolf_dimH },
    [9] = { x = 352, y = 0, w = wolf_dimW, h = wolf_dimH },
    [10] = { x = 396, y = 0, w = wolf_dimW, h = wolf_dimH },
    [11] = { x = 440, y = 0, w = wolf_dimW, h = wolf_dimH },
    [12] = { x = 484, y = 0, w = wolf_dimW, h = wolf_dimH },
    [13] = { x = 528, y = 0, w = wolf_dimW, h = wolf_dimH },
    [14] = { x = 572, y = 0, w = wolf_dimW, h = wolf_dimH },
    [15] = { x = 616, y = 0, w = wolf_dimW, h = wolf_dimH },
    [16] = { x = 660, y = 0, w = wolf_dimW, h = wolf_dimH },

}

local wolf_sequence = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}

local wolf_anim = CreateAnimation(
    wolfanim_img,
    wolf_frames,
    wolf_sequence,
    8 -- speed
)
-- gravity anim data
local grav_dimW = 34
local grav_dimH = 13
local grav_frames = {
    [1] = { x = 0,  y = 0, w = grav_dimW, h = grav_dimH },
    [2] = { x = 37, y = 0, w = grav_dimW, h = grav_dimH },
    [3] = { x = 73, y = 0, w = grav_dimW, h = grav_dimH },
}

local grav_sequence = {1,2,3,2}

local grav_anim = CreateAnimation(
    gravanim_img,
    grav_frames,
    grav_sequence,
    8 -- speed
)

-- shield dash anim data
local dash_dimW = 30
local dash_dimH = 31
local dash_frames = {
    [1] = { x = 0,  y = 0, w = dash_dimW, h = dash_dimH },
    [2] = { x = 32, y = 0, w = dash_dimW, h = dash_dimH },
    [3] = { x = 64, y = 0, w = dash_dimW, h = dash_dimH },
    [4] = { x = 96, y = 0, w = dash_dimW, h = dash_dimH },
    [5] = { x = 128, y = 0, w = dash_dimW, h = dash_dimH },
    [6] = { x = 160, y = 0, w = dash_dimW, h = dash_dimH },
    [7] = { x = 192, y = 0, w = dash_dimW, h = dash_dimH },
    [8] = { x = 224, y = 0, w = dash_dimW, h = dash_dimH },
    [9] = { x = 256, y = 0, w = dash_dimW, h = dash_dimH },
    [10] = { x = 288, y = 0, w = dash_dimW, h = dash_dimH },
    [11] = { x = 320,  y = 0, w = dash_dimW, h = dash_dimH },
    [12] = { x = 352, y = 0, w = dash_dimW, h = dash_dimH },
    [13] = { x = 384, y = 0, w = dash_dimW, h = dash_dimH },
    [14] = { x = 416, y = 0, w = dash_dimW, h = dash_dimH },
    [15] = { x = 448, y = 0, w = dash_dimW, h = dash_dimH },
    [16] = { x = 480, y = 0, w = dash_dimW, h = dash_dimH },
    [17] = { x = 512, y = 0, w = dash_dimW, h = dash_dimH },
    [18] = { x = 544, y = 0, w = dash_dimW, h = dash_dimH },
    [19] = { x = 576, y = 0, w = dash_dimW, h = dash_dimH },
    [20] = { x = 608, y = 0, w = dash_dimW, h = dash_dimH }
}

local dash_sequence = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}

local dash_anim = CreateAnimation(
    dashanim_img,
    dash_frames,
    dash_sequence,
    8 -- speed
)

------------------------------------------------------------
-- CORE INITIALIZATION WAIT
------------------------------------------------------------
local REQUIRED_SYSTEM = "PSX"  -- adjust if needed
function WaitForCorrectCore()
    while emu.getsystemid() ~= REQUIRED_SYSTEM do
        gui.clearGraphics()
        gui.drawImage(splashscreen_img, 0, 0)
        gui.pixelText(157, 183, "Waiting for PSX core...", "white", 0x80000000, 1)
        emu.frameadvance()
    end
end
WaitForCorrectCore()

------------------------------------------------------------
-- GAME START WAIT
------------------------------------------------------------
function WaitForGameStart()
    while memory.read_u16_le(0x097BA4) == 0 or memory.read_u16_le(0x097BA4) > 2000 or memory.read_u16_le(0x097BB4) == 0 or memory.read_u16_le(0x097BB4) > 2000 do
        gui.clearGraphics()
        emu.frameadvance()
    end
end
WaitForGameStart()

------------------------------------------------------------
-- CONFIG FILE PARSER
------------------------------------------------------------
function split(str)
    local t = {}
    for v in str:gmatch("([^,]+)") do
        v = v:gsub("^%s+", ""):gsub("%s+$", "")
        table.insert(t, v)
    end
    return t
end

function loadBindings(path)
    local file = io.open(path, "r")

    if not file then
        console.log("FAILED TO OPEN FILE")
        console.log(path)
        console.log("ENSURE 'SOTN AERI.config' IS IN THE SAME DIRECTORY AS THIS LUA")
        return {}, {}
    end

    local data = file:read("*all")
    file:close()

    local config = {}
    local order = {}

    for line in data:gmatch("[^\r\n]+") do
        local key, value = line:match("([^:]+):%s*\"(.-)\"")

        if key and value then
            key = key:gsub("^%s+", ""):gsub("%s+$", "")

            -- preserve file order
            if not config[key] then
                table.insert(order, key)
            end

            config[key] = split(value)
        end
    end

    return config, order
end

function StringToNumber(v)
    if type(v) == "table" then
        v = v[1]
    end

    local n = tonumber(v)
    return n or 0
end

------------------------------------------------------------
-- GLOBAL INPUT CONVERTER
------------------------------------------------------------
function isDown(list)
    local keys = input.get()
    local dualshock  = joypad.get(1)

    for _, k in ipairs(list or {}) do
        if keys[k] or dualshock[k] then
            return true
        end
    end
    return false
end

------------------------------------------------------------
-- CONFIG: FILE LOADER
------------------------------------------------------------
local path = ".\\SOTN AERI.config"
local config, order = loadBindings(path)

------------------------------------------------------------
-- CONFIG: APPLY CUSTOM BINDS/VARIABLES
------------------------------------------------------------
-- General binds apply
local Up = config["D-Pad Up"]
local Down = config["D-Pad Down"]
local Left = config["D-Pad Left"]
local Right = config["D-Pad Right"]
local Triangle = config["Triangle"]
local Cross = config["Cross"]
local Square = config["Square"]
local Circle = config["Circle"]
local L1 = config["L1"]
local L2 = config["L2"]
local R1 = config["R1"]
local R2 = config["R2"]

-- Specialized binds apply
local Cast_Selected_Spell = config["Cast_Selected_Spell"]
local Clear_Selected_Spell = config["Clear_Selected_Spell"]
local Summon_Spirit_Select = config["Summon_Spirit_Select"]
local Tetra_Spirit_Select = config["Tetra_Spirit_Select"]
local Hellfire_Select = config["Hellfire_Select"]
local Dark_Metamorphosis_Select = config["Dark_Metamorphosis_Select"]
local Soul_Steal_Select = config["Soul_Steal_Select"]
local Sword_Brothers_Select = config["Sword_Brothers_Select"]
local Wolf_Dash_Button = config["Wolf_Dash_Button"]
local Shield_Dash_Button = config["Shield_Dash_Button"]

-- Timing config apply
local ws_sf  = StringToNumber(config["Wing_Smash_STEPFRAMES"])
local ws_gcd = StringToNumber(config["Wing_Smash_GLOBALCOOLDOWN"])
local ws_buf  = StringToNumber(config["Wing_Smash_BUFFER"])
local wd_sf  = StringToNumber(config["Wolf_Dash_STEPFRAMES"])
local wd_gcd = StringToNumber(config["Wolf_Dash_GLOBALCOOLDOWN"])
local gj_sf  = StringToNumber(config["Gravity_Jump_STEPFRAMES"])
local gj_gcd = StringToNumber(config["Gravity_Jump_GLOBALCOOLDOWN"])
local sd_iw = StringToNumber(config["Shield_Dash_INTERVALWAIT"])
local sd_afd = StringToNumber(config["Shield_Dash_AUTOFIREDELAY"])
local sum_sf = StringToNumber(config["Summon_Spirit_STEPFRAMES"])
local sum_gcd = StringToNumber(config["Summon_Spirit_GLOBALCOOLDOWN"])
local tet_gcd = StringToNumber(config["Tetra_Spirit_GLOBALCOOLDOWN"])
local hell_sf = StringToNumber(config["Hellfire_STEPFRAMES"])
local hell_gcd = StringToNumber(config["Hellfire_GLOBALCOOLDOWN"])
local dmet_sf = StringToNumber(config["Dark_Metamorphosis_STEPFRAMES"])
local dmet_gcd = StringToNumber(config["Dark_Metamorphosis_GLOBALCOOLDOWN"])
local ss_sf = StringToNumber(config["Soul_Steal_STEPFRAMES"])
local ss_gcd = StringToNumber(config["Soul_Steal_GLOBALCOOLDOWN"])
local bro_gcd = StringToNumber(config["Sword_Brothers_GLOBALCOOLDOWN"])


-- clamps buffers to GCD - 5frames
if ws_buf >= ws_gcd then
    ws_buf = ws_gcd - 5
end

------------------------------------------------------------
-- CONFIG: MOVEMENT ASSIST OPTIONS
------------------------------------------------------------
function ws_assist()
    local v = config["Enable_Wing_Smash_Assist"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function wd_assist()
    local v = config["Enable_Wolf_Dash_Assist"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function gj_assist()
    local v = config["Enable_Gravity_Jump_Assist"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function sd_assist()
    local v = config["Enable_Shield_Dash_Assist"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

------------------------------------------------------------
-- CONFIG: UI ELEMENT OPTIONS
------------------------------------------------------------
function Active_Assists_UI()
    local v = config["Enable_Active_Assists_UI"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function MP_Bar_Dagger_UI()
    local v = config["Enable_MP_Bar_Dagger_UI"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function Spell_Cost_UI()
    local v = config["Enable_Spell_Cost_UI"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function Spellbook_UI()
    local v = config["Enable_Spellbook_UI"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function Library_Card_Count_UI()
    local v = config["Enable_Library_Card_Count_UI"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

------------------------------------------------------------
-- CONFIG: DEBUG MODE OPTIONS
------------------------------------------------------------
function configdump()
    local v = config["CONFIG_DUMP"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function inputreadertest()
    local v = config["INPUT_READER_TEST"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function RamOSD()
    local v = config["RAM_READ_OSD"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function VarOSD()
    local v = config["VARIABLE_WATCH_OSD"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function LogicOSD()
    local v = config["LOGIC_WATCH_OSD"]
    if type(v) == "table" then
        v = v[1]
    end
    if not v then return false end
    return v:lower() == "true"
end

function debugmode()
    --add all debug functions here
    return configdump()
    or inputreadertest()
    or RamOSD()
    or VarOSD()
    or LogicOSD()
end

------------------------------------------------------------
-- DEBUG: COSOLE LOGGING HEADERS
------------------------------------------------------------
if debugmode() then

    -- enables config dump
    if configdump() then

        console.log(" ")
        console.log("======== CONFIG FILE DUMP ========")
        console.log(" ")
        
        for _, action in ipairs(order) do
            local keys = config[action] or {}

            local out = action .. " = "

            for i, k in ipairs(keys) do
                out = out .. k
                if i < #keys then
                    out = out .. ", "
                end
            end

            console.log(out)

        end
        console.log(" ")
        console.log("============ END DUMP ============")
        console.log(" ")
    end

    -- enables input logging
    if inputreadertest() then

        console.log(" ")
        console.log("========== BINDING TEST ==========")
        console.log(" ")
    end
end

------------------------------------------------------------------------------------------------------------------------
-- VARIABLE INITIALIZATION
------------------------------------------------------------------------------------------------------------------------
-- global misc variables
local frame = 0
local frameData_text = "N/A"
local UIspellID = nil
local UIspellname = nil
local spell_running_cooldown = 0
local spell_cooldown_max = nil

-- global state system variables
local spell_state = 0
local facing = "Right"
local spell_direction = nil
local spell_step = 0
local spell_stepframes = 0
local spell_timer = 0
local spell_cooldown = 0

-- bat double tap variables
local bat_leftRising  = nil
local bat_rightRising =nil
local bat_prevLeft = false
local bat_prevRight = false
local bat_lastLeftPressFrame = -999
local bat_lastRightPressFrame = -999
local bat_doubleTapWindow = 20
local direction_tracking = false
local lastLRFrame = -999
local bat_autoChain = false

-- gravity variables
local grav_upRisingEdge = nil
local grav_prevUpPress = false
local grav_lastUpPressFrame = -999
local grav_doubleTapWindow = 20
local grav_hasleap = nil
local HasLanded = true

-- shield dash variables
local sd_state = 0
local sd_timer = 0

------------------------------------------------------------
-- SPELL DATA INITIALIZATION
------------------------------------------------------------
-- spell IDs
local SPELL_NONE = 0
local SPELL_SUMMON_SPIRIT = 1
local SPELL_TETRA_SPIRIT = 2
local SPELL_HELLFIRE = 3
local SPELL_DARK_METAMORPHOSIS = 4
local SPELL_SOUL_STEAL = 5
local SPELL_SWORD_BROTHERS = 6
local SPELL_WING_SMASH = 7
local SPELL_WOLF_DASH = 8
local SPELL_GRAVITY_JUMP = 9

-- Spell Data Tables
local SPELL_DATA = {
    [SPELL_NONE] = { id = 0, name = "None", cost = 0, steps = 0, stepframes = 0, cooldown = 0, buffer = 0 },

    [SPELL_SUMMON_SPIRIT] = { id = 1, name = "Summon Spirit", cost = 5, steps = 7, stepframes = sum_sf, cooldown = sum_gcd, buffer = 0 },
    [SPELL_TETRA_SPIRIT] = { id = 2, name = "Tetra Spirit", cost = 20, steps = 21, stepframes = 3, cooldown = tet_gcd, buffer = 0 },
    [SPELL_HELLFIRE] = { id = 3, name = "Hellfire", cost = 15, steps = 7, stepframes = hell_sf, cooldown = hell_gcd, buffer = 0 },
    [SPELL_DARK_METAMORPHOSIS] = { id = 4, name = "Dark Metamorphosis", cost = 10, steps = 9, stepframes = dmet_sf, cooldown = dmet_gcd, buffer = 0 },
    [SPELL_SOUL_STEAL] = { id = 5, name = "Soul Steal", cost = 50, steps = 11, stepframes = ss_sf, cooldown = ss_gcd, buffer = 0 },
    [SPELL_SWORD_BROTHERS] = { id = 6, name = "Sword Brothers", cost = 35, steps = 33, stepframes = 3, cooldown = bro_gcd, buffer = 0 },

    [SPELL_WING_SMASH] = { id = 7, name = "Wing Smash", cost = 8, steps = 7, stepframes = ws_sf, cooldown = ws_gcd, buffer = ws_buf },
    [SPELL_WOLF_DASH] = { id = 8, name = "Wolf Dash", cost = 10, steps = 6, stepframes = wd_sf, cooldown = wd_gcd, buffer = 0 },
    [SPELL_GRAVITY_JUMP] = { id = 9, name = "Gravity Jump", cost = 4, steps = 6, stepframes = gj_sf, cooldown = gj_gcd, buffer = 0 }
}

-- getter initialization
local spell = SPELL_NONE
local SELECTED_SPELL = SPELL_NONE

------------------------------------------------------------------------------------------------------------------------
-- MAIN LOOP START (All code below here runs each frame)
------------------------------------------------------------------------------------------------------------------------
while true do
local pad = {}

------------------------------------------------------------
-- RAM READER (spell/movement)
------------------------------------------------------------
local ramTransformFlag  = memory.read_u16_le(0x097BF8)
local ramFormHandler = memory.read_u16_le(0x073484)
local ramTileCollide = memory.read_u16_le(0x072F20)
local ramP1Control = memory.read_u16_le(0x03C9A4)
local ramMP = memory.read_u16_le(0x097BB0)
local ramMPMAX = memory.read_u16_le(0x097BB4)
local ramShop = memory.read_u16_le(0x097400)
local ramLibCard = memory.readbyte(0x097A30)

------------------------------------------------------------------------------------------------------------------------
-- GLOBAL PAUSE GATE (Prevents code below from executing in map/menu and stops timing desync on room transitions)
------------------------------------------------------------------------------------------------------------------------
function GlobalPause()
    gui.clearGraphics()

    -- BLOCK execution in shop
    if ramShop == 1 then
        return false
    end

    -- ALLOW only valid gameplay states
    if (ramP1Control == 1) or (ramP1Control == 5) then
        return true
    end

    return false
end

if GlobalPause() then
------------------------------------------------------------
-- INPUT READER (Reads currently pressed inputs and passes to code)
------------------------------------------------------------
-- general inputs
local UpPress = isDown(Up)
local DownPress = isDown(Down)
local LeftPress = isDown(Left)
local RightPress = isDown(Right)
local TrianglePress = isDown(Triangle)
local CrossPress = isDown(Cross)
local SquarePress = isDown(Square)
local CirclePress = isDown(Circle)
local L1Press = isDown(L1)
local L2Press = isDown(L2)
local R1Press = isDown(R1)
local R2Press = isDown(R2)

-- specialized inputs
local CastPress = isDown(Cast_Selected_Spell)
local ClearPress = isDown(Clear_Selected_Spell)
local Summon_Spirit_Select = isDown(Summon_Spirit_Select)
local Tetra_Spirit_Select =isDown(Tetra_Spirit_Select)
local Hellfire_Select = isDown(Hellfire_Select)
local Dark_Metamorphosis_Select = isDown(Dark_Metamorphosis_Select)
local Soul_Steal_Select = isDown(Soul_Steal_Select)
local Sword_Brothers_Select = isDown(Sword_Brothers_Select)
local Wolf_Dash_Press = isDown(Wolf_Dash_Button)
local Shield_Dash_Press = isDown(Shield_Dash_Button)



-- insert into the beginning of input sequencer steps to prevent input bleed
function InputsToNeutral()
    pad["P1 D-Pad Up"] = false
    pad["P1 D-Pad Down"] = false
    pad["P1 D-Pad Left"] = false
    pad["P1 D-Pad Right"] = false
    pad["P1 □"] = false
    pad["P1 ○"] = false
    pad["P1 △"] = false
end

------------------------------------------------------------
-- DEBUG: INPUT READER CONSOLE LOGGING
------------------------------------------------------------
if debugmode() then

    if inputreadertest() then

        frameData_text = "Frame: " .. frame

        -- control frame logging
        console.log(frameData_text)

        -- general input logging
        if UpPress then console.log("D-PAD UP INPUT REGISTERED") end
        if DownPress then console.log("D-PAD DOWN INPUT REGISTERED") end
        if LeftPress then console.log("D-PAD LEFT INPUT REGISTERED") end
        if RightPress then console.log("D-PAD RIGHT INPUT REGISTERED") end
        if TrianglePress then console.log("△ INPUT REGISTERED") end
        if CrossPress then console.log("X INPUT REGISTERED") end
        if SquarePress then console.log("□ INPUT REGISTERED") end
        if CirclePress then console.log("○ INPUT REGISTERED") end
        if L1Press then console.log("L1 INPUT REGISTERED") end
        if L2Press then console.log("L2 INPUT REGISTERED") end
        if R1Press then console.log("R1 INPUT REGISTERED") end
        if R2Press then console.log("R2 INPUT REGISTERED") end

        -- specialized input logging
        if CastPress then console.log("CAST SELECTED SPELL INPUT REGISTERED") end
        if ClearPress then console.log("Clear SELECTED SPELL INPUT REGISTERED") end
        if Summon_Spirit_Select then console.log("SUMMON SPIRIT INPUT REGISTERED") end
        if Tetra_Spirit_Select then console.log("TETRA SPIRIT INPUT REGISTERED") end
        if Hellfire_Select then console.log("HELLFIRE INPUT REGISTERED") end
        if Dark_Metamorphosis_Select then console.log("DARK METAMORPHOSIS INPUT REGISTERED") end
        if Soul_Steal_Select then console.log("SOUL STEAL INPUT REGISTERED") end
        if Sword_Brothers_Select then console.log("SWORD BROTHERS INPUT REGISTERED") end
        if Wolf_Dash_Press then console.log("WOLF DASH BUTTON INPUT REGISTERED") end
        if Shield_Dash_Press then console.log("Shield DASH BUTTON INPUT REGISTERED") end

        -- blank seperator line
        console.log(" ")

    end
end

------------------------------------------------------------
-- SPELL DATA GETTER FUNCTION LIBRARY
------------------------------------------------------------
function getSpellID(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].id or 0
end
----------------------------------------------------
function getSpellID(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].id or 0
end

function getSpellName(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].name or "None"
end

function getSpellCost(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].cost or 0
end

function getSpellSteps(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].steps or 0
end

function getSpellFramesPerStep(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].stepframes or 0
end

function getSpellCooldown(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].cooldown or 0
end

function getSpellBuffer(spell)
    return SPELL_DATA[spell] and SPELL_DATA[spell].buffer or 0
end

------------------------------------------------------------
-- PRIORITY FUNCTIONS LIBRARY
------------------------------------------------------------
--Tracks game control frames and used in certain timing applications
function UpdateControlFrame()
    frame = frame + 1
end

-- L/R latch state
function UpdateFacing(LeftPress, RightPress)
    if direction_tracking == true then
        if LeftPress and not RightPress then
            facing = "Left"
        elseif RightPress and not LeftPress then
            facing = "Right"
        end
        return facing
    end
end

-- Last L/R press frame data memory
function UpdateLastLRFrame()
    if (LeftPress or RightPress) and direction_tracking == true then
        lastLRFrame = frame
    end
end

-- ticks spell cooldowns
function UpdateSpellCooldown()
    if spell_cooldown > 0 then
        spell_cooldown = spell_cooldown - 1
    end
end

-- checks if alucard has landed between movement skills
function QueryHasLanded()
    if ramTransformFlag == 0 and (ramFormHandler == 35 or ramFormHandler == 29 or ramFormHandler <= 20) then
        HasLanded = true
    end
end

-- State maching initialization
function spell_initialize()
    spell_step = 0
    spell_timer = 0
    spell_direction = facing
    direction_tracking = false
    spell_cooldown = getSpellCooldown(spell_state)

    -- clamps cooldown to execution time + 5 frames
    if spell_cooldown <= (getSpellSteps(spell_state) * getSpellFramesPerStep(spell_state)) then
       spell_cooldown = 5 + (getSpellSteps(spell_state) * getSpellFramesPerStep(spell_state))
    end

    -- set cooldown max for UI
    spell_cooldown_max = spell_cooldown

    -- cooldown UI divide by 0 latch
    if spell_cooldown_max <= 0 then
        spell_cooldown_max = 1
    end

    spell_running_cooldown = getSpellID(spell_state)

end

-- resets state system
function spell_exit()
        spell_state = 0
        spell_step = 0
        spell_timer = 0
        direction_tracking = true
end

------------------------------------------------------------
-- PERMISSIONS LIBRARY (Defines conditions in which code execution is allowed)
------------------------------------------------------------
function CanControl()
    return (ramP1Control == 1)
end

-- Sufficient MP check
function HasMP(spell)
    local cost = getSpellCost(spell)
    return ramMP >= cost
end

-- wing smash check
function WingSmash_OK()
    return CanControl()
        and ws_assist()
        and HasMP(SPELL_WING_SMASH)
        and (
            (ramFormHandler == 194) -- bat L/R moving
            or (ramFormHandler == 195) -- bat slowing down
            or (ramFormHandler == 196) -- bat stopped
            or (ramFormHandler == 197) -- bat moving down
            or (ramFormHandler == 198) -- bat wing smashing
        )
        and (ramTransformFlag == 1) -- is transformed
end

-- wing smash chain check
function WingSmashChain_OK()
    return WingSmash_OK ()
    and bat_autoChain == true
    and (frame - lastLRFrame) <= getSpellBuffer(SPELL_WING_SMASH)
end

-- wolf dash check
function WolfDash_OK()
    return CanControl()
        and wd_assist()
        and HasMP(SPELL_WOLF_DASH)
        and (
            (ramFormHandler == 226) -- wolf L/R sprinting
            or (ramFormHandler == 224) -- wolf L/R moving
            or (ramFormHandler == 222) --wolf stopped standing
            or (ramFormHandler == 233) -- wolf stopped sitting
            or (ramFormHandler == 225) -- wolf turning
        )
        and (ramTransformFlag == 1) -- is transformed
end

-- gravity jump check
function GravityJump_OK()
    return CanControl()
        and gj_assist()
        and HasMP(SPELL_GRAVITY_JUMP)
        and ramFormHandler < 100 -- human form
        and (ramTransformFlag == 0) -- gravity jump not happening
end

-- gravity jump chain check
function GravityJumpChain_OK()
    return CanControl()
        and gj_assist()
        and HasMP(SPELL_GRAVITY_JUMP)
        and HasLanded == false
        and ramFormHandler < 100 -- human form
end

-- shield dash check
function ShieldDash_OK()
    return CanControl()
        and sd_assist()
        and (ramTransformFlag == 0)
        and (ramTileCollide ~= 32)
        and spell_cooldown <= 0
        and spell_state == 0
end

-- cast trigger check
function Cast_OK()
    return CanControl()
        and (ramTransformFlag == 0) -- not transformed
        and (ramTileCollide ~= 32)
        and HasMP(SELECTED_SPELL)
        and spell_cooldown <= 0
        and spell_state == 0
        and SELECTED_SPELL ~= 0
end

------------------------------------------------------------------------------------------------------------------------
-- MOVEMENT SCRIPTS BLOCK (Movement skill input detection and execution scripts go here)
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------
-- FRAME UPDATE CALLS
------------------------------------------------------------
UpdateControlFrame()
UpdateFacing(LeftPress, RightPress)
UpdateLastLRFrame()
QueryHasLanded()
UpdateSpellCooldown()

------------------------------------------------------------
-- WING SMASH INPUT DETECTION (finsihed)
------------------------------------------------------------
-- bonk reset
if ramFormHandler == 202 then
    spell_cooldown = 0
end

if spell_cooldown <= 0 and spell_state == 0 then
spell_running_cooldown = nil

    if not WingSmash_OK() or not WingSmashChain_OK() then
        bat_autoChain = false
    end

    -- autochains on next while holding
    if WingSmashChain_OK() then
        spell_state = getSpellID(SPELL_WING_SMASH)
        spell_initialize()
    else

        -- manual trigger
        if WingSmash_OK() then

            bat_leftRising  = LeftPress and not bat_prevLeft
            bat_rightRising = RightPress and not bat_prevRight

            -- LEFT DOUBLE TAP
            if bat_leftRising then
                if (frame - bat_lastLeftPressFrame) <= bat_doubleTapWindow then
                    spell_state = getSpellID(SPELL_WING_SMASH)
                    bat_autoChain = true -- enable auto chaining
                    spell_initialize()
                end
                bat_lastLeftPressFrame = frame
            end

            -- RIGHT DOUBLE TAP
            if bat_rightRising then
                if (frame - bat_lastRightPressFrame) <= bat_doubleTapWindow then
                    spell_state = getSpellID(SPELL_WING_SMASH)
                    bat_autoChain = true -- enable auto chaining
                    spell_initialize()
                end
                bat_lastRightPressFrame = frame
            end
        end
    end
end


bat_prevLeft = LeftPress
bat_prevRight = RightPress

------------------------------------------------------------
-- WING SMASH EXECUTION (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_WING_SMASH) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_WING_SMASH) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- X HOLD DURING INPUT SEQUENCE
    if spell_step >= 0 and spell_step <= 6 then
        pad["P1 X"] = true
    end

    -- RIGHT VERSION INPUT SEQUENCE
    if spell_direction == "Right" then

        if spell_step == 0 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 1 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 2 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        end

    -- LEFT VERSION INPUT SEQUENCE
    elseif spell_direction == "Left" then

        if spell_step == 0 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 1 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 2 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        end
    end

    -- EXIT STATE CLEANLY
    if spell_step >= getSpellSteps(SPELL_WING_SMASH) then
        HasLanded = false
        spell_exit()
    end
end

------------------------------------------------------------
-- WOLF DASH INPUT DETECTION (finished)
------------------------------------------------------------
-- bonk reset
if ramFormHandler == 202 then
    spell_cooldown = 0
end

if spell_cooldown <= 0 and spell_state == 0 then
spell_running_cooldown = nil

    if WolfDash_OK() and Wolf_Dash_Press then
        spell_state = getSpellID(SPELL_WOLF_DASH)
        spell_initialize()
    end
end

------------------------------------------------------------
-- WOLF DASH EXECUTION (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_WOLF_DASH) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_WOLF_DASH) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- INITIAL DIRECTIONAL INPUT
    if spell_step < 2 then
        if wd_direction == "Right" then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif wd_direction == "Left" then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        end
    end

    -- RIGHT VERSION INPUT SEQUENCE
    if spell_direction == "Right" then

        if spell_step == 2 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = false

        elseif spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 □"] = true

        end

    -- LEFT VERSION INPUT SEQUENCE
    elseif spell_direction == "Left" then

        if spell_step == 2 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 □"] = true

        end
    end

    -- EXIT STATE CLEANLY
    if spell_step >= getSpellSteps(SPELL_WOLF_DASH) then
        HasLanded = false
        spell_exit()
    end

end
------------------------------------------------------------
-- GRAVITY JUMP INPUT DETECTION (finished)
------------------------------------------------------------
-- bonk reset
if (ramTileCollide == 34 or ramTileCollide == 38 or ramTileCollide == 42 or (ramTileCollide > 2000 and ramTileCollide < 4000)) and ramFormHandler < 100 then
    spell_cooldown = 0
end

if spell_cooldown <= 0 and spell_state == 0 then
spell_running_cooldown = nil

    -- execute if up press while airborne and you have not yet landed
    if GravityJumpChain_OK() and UpPress then
        if grav_hasleap == true then
            pad["P1 X"] = true
            grav_hasleap = false
        end
        spell_state = getSpellID(SPELL_GRAVITY_JUMP)
        spell_initialize()
    else

        -- DOUBLE TAP manual activation
        if GravityJump_OK() then
            grav_upRisingEdge = UpPress and not grav_prevUpPress

            if grav_upRisingEdge then
                if (frame - grav_lastUpPressFrame) <= grav_doubleTapWindow then
                    -- burns double jump if already airborne
                    if ramTileCollide == 32 then
                        pad["P1 X"] = true
                        grav_hasleap = false
                    else
                        grav_hasleap = true
                    end
                    spell_state = getSpellID(SPELL_GRAVITY_JUMP)
                    spell_initialize()
                end
                grav_lastUpPressFrame = frame
            end
        end
    end
end


grav_prevUpPress = UpPress
------------------------------------------------------------
-- GRAVITY JUMP EXECUTION
------------------------------------------------------------
if spell_state == getSpellID(SPELL_GRAVITY_JUMP) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_GRAVITY_JUMP) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()

    -- INPUT SEQUENCE
    elseif spell_step == 3 then
        InputsToNeutral()
        pad["P1 D-Pad Down"] = true

    elseif spell_step == 4 then
        InputsToNeutral()
        pad["P1 D-Pad Up"] = true

    elseif spell_step == 5 then
        pad["P1 X"] = true
    end

    -- EXIT CLEANLY
    if spell_step >= getSpellSteps(SPELL_GRAVITY_JUMP) then
        HasLanded = false
        spell_exit()
    end
end

------------------------------------------------------------
-- SHIELD DASH AUTOFIRE (fix vars, perms, and test)
------------------------------------------------------------
if sd_assist() and ShieldDash_OK() and Shield_Dash_Press then

    sd_timer = sd_timer + 1

    -- STEP 0: TRIANGLE PRESS
    if sd_state == 0 then
        if facing == "Right" then
            pad["P1 D-Pad Right"] = true
        elseif facing == "Left" then
            pad["P1 D-Pad Left"] = true
        end
    InputsToNeutral()
    pad["P1 △"] = true

        if sd_timer >= sd_iw then
            sd_timer = 0
            sd_state = 1
        end
    end

    -- STEP 1: CIRCLE PRESS
    if sd_state == 1 then
        InputsToNeutral()
        pad["P1 ○"] = true

        if sd_timer >= sd_afd then
            sd_timer = 0
            sd_state = 0
        end
    end

else
    -- RESET WHEN NOT HELD
    sd_state = 0
    sd_timer = 0
end

------------------------------------------------------------------------------------------------------------------------
-- SPELL SCRIPTS BLOCK (Spell input detection and execution scripts go here)
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------
-- SPELL SELECTION SYSTEMS (finished)
------------------------------------------------------------
if spell_cooldown == 0 then
    
    if ClearPress then
        SELECTED_SPELL = SPELL_NONE
    elseif Summon_Spirit_Select then
        SELECTED_SPELL = SPELL_SUMMON_SPIRIT
    elseif Tetra_Spirit_Select then
        SELECTED_SPELL = SPELL_TETRA_SPIRIT
    elseif Hellfire_Select then
        SELECTED_SPELL = SPELL_HELLFIRE
    elseif Dark_Metamorphosis_Select then
        SELECTED_SPELL = SPELL_DARK_METAMORPHOSIS
    elseif Soul_Steal_Select then
        SELECTED_SPELL = SPELL_SOUL_STEAL
    elseif Sword_Brothers_Select then
        SELECTED_SPELL = SPELL_SWORD_BROTHERS
    end

end

------------------------------------------------------------
-- CAST TRIGGER (add double tap quickfires?)
------------------------------------------------------------
if Cast_OK() and CastPress then
    if  SELECTED_SPELL ~= SPELL_SWORD_BROTHERS then
        spell_state = getSpellID(SELECTED_SPELL)
        spell_initialize()
    elseif SELECTED_SPELL == SPELL_SWORD_BROTHERS and memory.readbyte(0x09797A) == 3 then
        spell_state = getSpellID(SELECTED_SPELL)
        spell_initialize()
    elseif SELECTED_SPELL == SPELL_SWORD_BROTHERS and memory.readbyte(0x09797A) ~= 3 then
    end
end

------------------------------------------------------------
-- SUMMON SPIRIT (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_SUMMON_SPIRIT) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_SUMMON_SPIRIT) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()
    end

    -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_SUMMON_SPIRIT) then
        spell_exit()
    end
end
------------------------------------------------------------
-- TETRA SPIRIT (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_TETRA_SPIRIT) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_TETRA_SPIRIT) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()
    end

     -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step >= 3 and spell_step <= 15 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 16 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 17 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 18 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 19 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 20 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

        if spell_step >= 3 and spell_step <= 15 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 16 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 17 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 18 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 19 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 20 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_TETRA_SPIRIT) then
        spell_exit()
    end
end

------------------------------------------------------------
-- HELLFIRE (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_HELLFIRE) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_HELLFIRE) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()
    end

    -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

       if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_HELLFIRE) then
        spell_exit()
    end
end

------------------------------------------------------------
-- DARK METAMORPHOSIS (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_DARK_METAMORPHOSIS) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_DARK_METAMORPHOSIS) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 3 then
        InputsToNeutral()
    end

    -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 8 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 8 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_DARK_METAMORPHOSIS) then
        spell_exit()
    end
end

------------------------------------------------------------
-- SOUL STEAL (finished)
------------------------------------------------------------
if spell_state == getSpellID(SPELL_SOUL_STEAL) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_SOUL_STEAL) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()
    end

    -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 8 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 9 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 10 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

        if spell_step == 3 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 7 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 8 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 9 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 10 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_SOUL_STEAL) then
        spell_exit()
    end
end

------------------------------------------------------------
-- SWORD BROTHERS
------------------------------------------------------------
if spell_state == getSpellID(SPELL_SWORD_BROTHERS) then

    spell_timer = spell_timer + 1

    if spell_timer >= getSpellFramesPerStep(SPELL_SWORD_BROTHERS) then
        spell_timer = 0
        spell_step = spell_step + 1
    end

    -- input lockout
    if spell_step <= 2 then
        InputsToNeutral()
    end

    -- RIGHT VERSION
    if spell_direction == "Right" then

        if spell_step == 3  then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Right"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Right"] = true

        elseif spell_step >= 7 and spell_step <= 30 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 31 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 32 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end

    -- LEFT VERSION
    elseif spell_direction == "Left" then

       if spell_step == 3  then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 4 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 5 then
            InputsToNeutral()
            pad["P1 D-Pad Left"] = true

        elseif spell_step == 6 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true
            pad["P1 D-Pad Left"] = true

        elseif spell_step >= 7 and spell_step <= 30 then
            InputsToNeutral()
            pad["P1 D-Pad Up"] = true

        elseif spell_step == 31 then
            InputsToNeutral()
            pad["P1 D-Pad Down"] = true

        elseif spell_step == 32 then
            InputsToNeutral()
            pad["P1 □"] = true
            pad["P1 ○"] = true

        end
    end

    -- exit cleanly
    if spell_step >= getSpellSteps(SPELL_SWORD_BROTHERS) then
        spell_exit()
    end
end


------------------------------------------------------------------------------------------------------------------------
-- OVERLAY UI DRAW BLOCK (Clears in map/menus)
------------------------------------------------------------------------------------------------------------------------
-- UI element offsets/dimensions
local spellbook_offsetX = 24
local spellbook_offsetY = 49

local spellbookhanger_offsetX = 43
local spellbookhanger_offsetY = 43

local MPTextX = 44
local MPTextY = 27

local CDmeterX = spellbook_offsetX + 13
local CDmeterY = spellbook_offsetY + 20
local CDmeterW = 50
local CDmeterH = 3

local textcolor = nil

if spell_cooldown > 0 then
    textcolor = "white"
    UIspellID = getSpellID(spell_running_cooldown)
elseif spell_cooldown <= 0 and HasLanded == true then
    UIspellID = getSpellID(SELECTED_SPELL)
end

-- sets spell UI text
if UIspellID == 0 then
    UIspellname = " Arcana Unfocused "
elseif UIspellID == 1 then
    UIspellname = "  Summon  Spirit  "
elseif UIspellID == 2 then
    UIspellname = "   Tetra Spirit   "
elseif UIspellID == 3 then
    UIspellname = "     Hellfire     "
elseif UIspellID == 4 then
    UIspellname = "Dark Metamorphosis"
elseif UIspellID == 5 then
    UIspellname = "    Soul Steal    "
elseif UIspellID == 6 then
    UIspellname = "  Sword Brothers  "
elseif UIspellID == 7 then
    UIspellname = "    Wing Smash    "
elseif UIspellID == 8 then
    UIspellname = "   Wolf Charge    "
elseif UIspellID == 9 then
    UIspellname = "   Gravity Jump   "
end

------------------------------------------------------------
-- MP COST DAGGER AND EXTRA ICONS UI
------------------------------------------------------------
-- MP bar config (match your existing UI)
local MP_BAR_WIDTH = 50

-- arrow offsets (tweak these to align with your art)
local MP_ARROW_OFFSET_X = -2 -- offset from left most pixel
local MP_ARROW_OFFSET_Y = 13  -- sits slightly above bar usually

function DrawMPProjectionArrow(barX, barY, currentMP, maxMP, spellID)

    if ramMPMAX == nil or ramMPMAX <= 0 then return end

    local cost = getSpellCost(UIspellID)
    if cost == nil then cost = 0 end

    -- projected MP after cast
    local projectedMP = ramMP - cost
    if projectedMP < 0 then projectedMP = 0 end

    -- convert to pixel position
    local projected_px = (projectedMP / ramMPMAX) * MP_BAR_WIDTH

    -- snap to pixel (prevents jitter)
    projected_px = math.floor(projected_px + 0.5)

    -- final X position
    local arrowX = barX + projected_px + MP_ARROW_OFFSET_X
    local arrowY = barY + MP_ARROW_OFFSET_Y

    -- clamp inside bar
    if arrowX < barX then arrowX = barX end
    if arrowX > barX + MP_BAR_WIDTH then arrowX = barX + MP_BAR_WIDTH end

    if UIspellID ~= 0 then
        texcolor = "white"
        if UIspellID == 6 then
            if memory.readbyte(0x09797A) ~= 3 then
                textcolor = "red"
                gui.drawImage(noswordbro_img, 15, 43)
            elseif memory.readbyte(0x09797A) == 3 then
                texcolor = "white"
                gui.drawImage(swordbro_img, 15, 43)
            end

            if HasMP(UIspellID) then
                texcolor = "white"
                gui.drawImage(mp_arrow_img, arrowX, arrowY)
            else
                textcolor = "red"
                gui.drawImage(nomp_arrow_img, arrowX, arrowY)
            end

        elseif UIspellID ~= 6 then

            if HasMP(UIspellID) then
                texcolor = "white"
                gui.drawImage(mp_arrow_img, arrowX, arrowY)
            else
                textcolor = "red"
                gui.drawImage(nomp_arrow_img, arrowX, arrowY)
                gui.drawImage(mannaprism_img, 17, 53)
            end
        end
    end
end

------------------------------------------------------------
-- COOLDOWN METER UI
------------------------------------------------------------
-- cooldown meter fill
function DrawCooldownFill(x, y, width, height, fillPercent)

    if spell_cooldown_max == nil or spell_cooldown_max <= 0 then return end
    if spell_cooldown == nil or spell_cooldown <= 0 then return end

    -- clamp fill percent
    local progress = spell_cooldown / spell_cooldown_max
    if progress < 0 then progress = 0 end
    if progress > 1 then progress = 1 end

    local fillWidth = math.floor(width * progress)

    if fillWidth > 0 then
        gui.drawRectangle(
            x + 1,
            y + 1,
            fillWidth - 2,
            height - 2,
            0xFF00FFFF, -- cyan core
            0xAA00FFFF  -- semi transparent
        )
    end
end

--cooldown chamber glass gradient
function DrawCooldownChamber(x, y, width, height)
-- OUTER TUBE (dark glass base)
gui.drawRectangle(x, y, width, height, 0xFF000000, 0x88000000)

-- GLASS SHADING (top highlight)
gui.drawRectangle(
    x + 1,
    y + 1,
    width - 2,
    math.floor(height * 0.35),
    0x55FFFFFF, -- soft white highlight
    0x55FFFFFF
)

-- GLASS SHADING (bottom shadow)
gui.drawRectangle(
    x + 1,
    y + math.floor(height * 0.65),
    width - 2,
    math.floor(height * 0.35),
    0x55000000, -- darker bottom
    0x55000000
)

-- EDGE HIGHLIGHT (thin top line for "glass reflection")
gui.drawLine(
    x + 1,
    y + 1,
    x + width - 2,
    y + 1,
    0x99FFFFFF
)
end

------------------------------------------------------------
-- UI DRAW CALLS
------------------------------------------------------------
-- MP dagger and extra icons
if MP_Bar_Dagger_UI() then
    DrawMPProjectionArrow(MPTextX + 0, MPTextY - 22, ramMP, ramMPMAX, UIspellID)
end

-- show spell cost
if Spell_Cost_UI() then
    gui.pixelText(MPTextX + 46, MPTextY + 41, getSpellCost(UIspellID) .. "MP", textcolor, 0x00000000, 1)
end

-- spellbook UI
if Spellbook_UI() then
    -- frame background
    gui.drawBox(spellbook_offsetX + 4, spellbook_offsetY + 2, spellbook_offsetX + 87, spellbook_offsetY + 17, 0x00000000, 0xA02C223F)
    -- main frame
    gui.drawImage(spellframe_img, spellbook_offsetX, spellbook_offsetY)
    -- left and right connector bits on top
    gui.drawImage(spellframehanger_img, spellbookhanger_offsetX, spellbookhanger_offsetY)
    gui.drawImage(spellframehanger_img, spellbookhanger_offsetX + 44, spellbookhanger_offsetY)
    -- spell text
    gui.pixelText(spellbook_offsetX + 11, spellbook_offsetY + 7, UIspellname, textcolor, 0x00000000, 1)
    -- cooldown bar glass texture
    DrawCooldownChamber(CDmeterX, CDmeterY, CDmeterW, CDmeterH)
    -- cooldown bar fluid
    DrawCooldownFill(CDmeterX, CDmeterY, CDmeterW, CDmeterH)
    -- cooldown bar frame
    gui.drawImage(cdglassframe_img, CDmeterX - 2, CDmeterY-2)
end

------------------------------------------------------------
-- DEBUG: OSD UI DRAW
------------------------------------------------------------
-- RamOSD display
if RamOSD() then

local RamOSD_bg = 0xA0000000
local RamOSD_offsetX = 185
local RamOSD_offsetY = 178

    RamOSD_X = RamOSD_offsetX
    RamOSD_Y = RamOSD_offsetY
    gui.drawBox(RamOSD_X, RamOSD_Y, RamOSD_X + 100, RamOSD_Y + 49, "black", RamOSD_bg)
        gui.pixelText(RamOSD_X, RamOSD_Y, "RAM READ OSD", "white", 0x00000000, 1)
    RamOSD_Y = RamOSD_Y + 14
        gui.pixelText(RamOSD_X, RamOSD_Y, "ramP1Control:" .. ramP1Control, "white", 0x00000000, 1)
    RamOSD_Y = RamOSD_Y + 7
            gui.pixelText(RamOSD_X, RamOSD_Y, "ramShop:" .. ramShop, "white", 0x00000000, 1)
    RamOSD_Y = RamOSD_Y + 7
        gui.pixelText(RamOSD_X, RamOSD_Y, "ramFormHandler:" .. ramFormHandler, "white", 0x00000000, 1)
    RamOSD_Y = RamOSD_Y + 7
        gui.pixelText(RamOSD_X, RamOSD_Y, "ramTransformFlag:" .. ramTransformFlag, "white", 0x00000000, 1)
    RamOSD_Y = RamOSD_Y + 7
        gui.pixelText(RamOSD_X, RamOSD_Y, "ramTileCollide:" .. ramTileCollide, "white", 0x00000000, 1)
end


-- VarOSD display
if VarOSD() then

local VarOSD_bg = 0xA0000000
local VarOSD_offsetX = 185
local VarOSD_offsetY = 20

    VarOSD_X = VarOSD_offsetX
    VarOSD_Y = VarOSD_offsetY
        gui.drawBox(VarOSD_X, VarOSD_Y, VarOSD_X + 100, VarOSD_Y + 57, "black", VarOSD_bg)
        gui.pixelText(VarOSD_X, VarOSD_Y, "VARIABLE OSD", "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 14
        gui.pixelText(VarOSD_X, VarOSD_Y, "Frame Count:" .. frame, "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 7
        gui.pixelText(VarOSD_X, VarOSD_Y, "lastLRFrame:" .. lastLRFrame, "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 7
        gui.pixelText(VarOSD_X, VarOSD_Y, "spell_state:" .. getSpellID(spell_state), "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 7
        gui.pixelText(VarOSD_X, VarOSD_Y, "spell_timer:" .. spell_timer, "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 7
        gui.pixelText(VarOSD_X, VarOSD_Y, "spell_step:" .. spell_step, "white", 0x00000000, 1)
    VarOSD_Y = VarOSD_Y + 7
        gui.pixelText(VarOSD_X, VarOSD_Y, "spell_cooldown:" .. spell_cooldown, "white", 0x00000000, 1)

end

-- gate/latch display
if LogicOSD() then

local LogicOSD_bg = 0xA0000000
local LogicOSD_offsetX = 15
local LogicOSD_offsetY = 157

    LogicOSD_X = LogicOSD_offsetX
    LogicOSD_Y = LogicOSD_offsetY
    gui.drawBox(LogicOSD_X, LogicOSD_Y, LogicOSD_X + 100, LogicOSD_Y + 70, "black", LogicOSD_bg)
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "LOGIC OSD", "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 14
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "facing: " .. tostring(facing), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "WingSmash_OK: " .. tostring(WingSmash_OK()), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "WingSmashChain_OK: " .. tostring(WingSmashChain_OK()), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "WolfDash_OK: " .. tostring(WolfDash_OK()), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "GravityJump_OK: " .. tostring(GravityJump_OK()), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "GravityJumpChain_OK: " .. tostring(GravityJumpChain_OK()), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "HasLanded: " .. tostring(HasLanded), "white", 0x00000000, 1)
    LogicOSD_Y = LogicOSD_Y + 7
        gui.pixelText(LogicOSD_X, LogicOSD_Y, "Cast_OK: " .. tostring(Cast_OK()), "white", 0x00000000, 1)

end




------------------------------------------------------------------------------------------------------------------------
-- CLOSE GLOBAL PAUSE (anything below here runs during map/menu/transitions)
------------------------------------------------------------------------------------------------------------------------
end
------------------------------------------------------------
-- LETTERBOX UI DRAW BLOCK (Does not clear in map/menus/transitions)
------------------------------------------------------------
-- AERI Branding
local letterbox_repos = memory.read_u16_le(0x00E2D8)
local letterbox_offsetX = 72

if letterbox_repos == 1 then
    gui.drawImage(logo_img, letterbox_offsetX, 0 )
else
    gui.drawImage(logo_img, 15, 0 )
end

-- debug indicator
if debugmode() then
    if letterbox_repos == 1 then
        gui.pixelText(letterbox_offsetX + 90, 18, "DEBUG MODE ACTIVE", "red", 0xF0000000, 1)
    else
        gui.pixelText(105, 18, "DEBUG MODE ACTIVE", "red", 0xF0000000, 1)
    end
end

-- active assists UI draw
if Active_Assists_UI() then
    gui.pixelText(14, 230, "Active Assists:", "white", 0x00000000, 1)
    local assist_offsetX = 80
    if ws_assist() then
        DrawAnimation(bat_anim, assist_offsetX, 215)
        UpdateAnimation(bat_anim)
        assist_offsetX = assist_offsetX + 30
    end

    if wd_assist() then
        DrawAnimation(wolf_anim, assist_offsetX, 227)
        UpdateAnimation(wolf_anim)
        assist_offsetX = assist_offsetX + 50
    end

    if gj_assist() then
        DrawAnimation(grav_anim, assist_offsetX, 227)
        UpdateAnimation(grav_anim)
        assist_offsetX = assist_offsetX + 45
    end

    if sd_assist() then
        DrawAnimation(dash_anim, assist_offsetX, 213)
        UpdateAnimation(dash_anim)
    end
end

-- show current LC count
if Library_Card_Count_UI() then
    gui.drawImage(librarycard_img, 250, 228)
    gui.pixelText(260, 230, ":" .. tostring(ramLibCard), "white", 0x00000000, 1)
end

------------------------------------------------------------------------------------------------------------------------
-- FINAL INPUT APPLY
------------------------------------------------------------------------------------------------------------------------

    joypad.set(pad)
    emu.frameadvance()
end