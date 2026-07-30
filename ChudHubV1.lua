local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local RepS=game:GetService("ReplicatedStorage")
local TS=game:GetService("TeleportService")
local Li=game:GetService("Lighting")
local TwS=game:GetService("TweenService")
local mfl=math.floor;local mcl=math.clamp;local mab=math.abs;local mra=math.random;local mmax=math.max;local mmin=math.min;local mrad=math.rad

local T={
    bg=Color3.fromRGB(5,7,11),     bgS=Color3.fromRGB(11,13,18),     bgT=Color3.fromRGB(20,22,28),
    ac=Color3.fromRGB(120,47,204),bd=Color3.fromRGB(35,38,48),  off=Color3.fromRGB(27,30,37),
    tx=Color3.fromRGB(230,230,235),txM=Color3.fromRGB(140,142,150),txD=Color3.fromRGB(90,92,100),txSel=Color3.fromRGB(200,200,210),
    ok=Color3.fromRGB(52,211,153),ng=Color3.fromRGB(248,113,113),wn=Color3.fromRGB(251,191,36),
}
local TL={
{n="Proxy",       d="Tuff aura",    i="◉",ac=Color3.fromRGB(120,47,204), bg=Color3.fromRGB(5,7,11),    bS=Color3.fromRGB(11,13,18),  bT=Color3.fromRGB(20,22,28),  bd=Color3.fromRGB(35,38,48),  of=Color3.fromRGB(27,30,37),  tx=Color3.fromRGB(230,230,235),tM=Color3.fromRGB(140,142,150),tD=Color3.fromRGB(90,92,100)},
{n="Carbon",   d="Pure Black",       i="◉",ac=Color3.fromRGB(220,220,220), bg=Color3.fromRGB(0,0,0),      bS=Color3.fromRGB(8,8,8),     bT=Color3.fromRGB(14,14,14),  bd=Color3.fromRGB(32,32,32),  of=Color3.fromRGB(22,22,22),  tx=Color3.fromRGB(240,240,240),tM=Color3.fromRGB(150,150,150),tD=Color3.fromRGB(85,85,85)},
{n="Obsidian", d="Dark · Indigo",    i="◈",ac=Color3.fromRGB(99,102,241),  bg=Color3.fromRGB(10,10,14),   bS=Color3.fromRGB(16,16,22),  bT=Color3.fromRGB(22,22,30),  bd=Color3.fromRGB(38,38,52),  of=Color3.fromRGB(30,30,42),  tx=Color3.fromRGB(245,245,250),tM=Color3.fromRGB(160,160,180),tD=Color3.fromRGB(90,90,110)},
{n="Midnight", d="Dark · Blue",      i="✦",ac=Color3.fromRGB(59,130,246),  bg=Color3.fromRGB(6,8,18),     bS=Color3.fromRGB(10,14,28),  bT=Color3.fromRGB(14,20,40),  bd=Color3.fromRGB(28,38,72),  of=Color3.fromRGB(18,26,52),  tx=Color3.fromRGB(220,230,255),tM=Color3.fromRGB(120,145,210),tD=Color3.fromRGB(60,78,130)},
{n="Solar",    d="Dark · Amber",     i="⌗",ac=Color3.fromRGB(251,146,30),  bg=Color3.fromRGB(12,8,4),     bS=Color3.fromRGB(20,13,6),   bT=Color3.fromRGB(30,19,8),   bd=Color3.fromRGB(75,42,12),  of=Color3.fromRGB(55,30,8),   tx=Color3.fromRGB(255,238,210),tM=Color3.fromRGB(200,155,90), tD=Color3.fromRGB(130,90,45)},
{n="Crimson",  d="Dark · Red",       i="⬡",ac=Color3.fromRGB(248,113,113), bg=Color3.fromRGB(12,7,9),     bS=Color3.fromRGB(20,11,14),  bT=Color3.fromRGB(30,15,20),  bd=Color3.fromRGB(65,24,34),  of=Color3.fromRGB(48,17,24),  tx=Color3.fromRGB(255,232,232),tM=Color3.fromRGB(195,140,148),tD=Color3.fromRGB(118,74,80)},
{n="Emerald",  d="Dark · Green",     i="◆",ac=Color3.fromRGB(52,211,153),  bg=Color3.fromRGB(5,11,9),     bS=Color3.fromRGB(9,17,14),   bT=Color3.fromRGB(13,25,19),  bd=Color3.fromRGB(22,50,38),  of=Color3.fromRGB(14,36,26),  tx=Color3.fromRGB(215,250,238),tM=Color3.fromRGB(120,190,162),tD=Color3.fromRGB(58,110,86)},
{n="Rose",     d="Dark · Rose Gold", i="✿",ac=Color3.fromRGB(255,150,180), bg=Color3.fromRGB(14,8,11),    bS=Color3.fromRGB(22,12,17),  bT=Color3.fromRGB(32,16,24),  bd=Color3.fromRGB(72,28,48),  of=Color3.fromRGB(52,18,34),  tx=Color3.fromRGB(255,230,238),tM=Color3.fromRGB(200,145,168),tD=Color3.fromRGB(120,78,98)},
{n="Gold",     d="Dark · Gold",      i="✦",ac=Color3.fromRGB(255,195,50),  bg=Color3.fromRGB(12,10,4),    bS=Color3.fromRGB(20,16,6),   bT=Color3.fromRGB(30,24,8),   bd=Color3.fromRGB(80,58,12),  of=Color3.fromRGB(55,40,8),   tx=Color3.fromRGB(255,245,210),tM=Color3.fromRGB(200,168,90), tD=Color3.fromRGB(130,100,40)},
{n="Zinc",     d="Dark · Warm Grey", i="⬨",ac=Color3.fromRGB(180,165,148), bg=Color3.fromRGB(11,10,9),    bS=Color3.fromRGB(18,16,14),  bT=Color3.fromRGB(26,24,20),  bd=Color3.fromRGB(52,46,40),  of=Color3.fromRGB(38,34,28),  tx=Color3.fromRGB(242,238,232),tM=Color3.fromRGB(158,148,136),tD=Color3.fromRGB(98,90,80)},
{n="Void",     d="Pure Void Black",  i="◉",ac=Color3.fromRGB(200,200,210), bg=Color3.fromRGB(2,2,4),      bS=Color3.fromRGB(6,6,10),    bT=Color3.fromRGB(10,10,16),  bd=Color3.fromRGB(24,24,32),  of=Color3.fromRGB(16,16,22),  tx=Color3.fromRGB(235,235,245),tM=Color3.fromRGB(140,140,155),tD=Color3.fromRGB(75,75,90)},
{n="Neon",     d="Cyber · Neon",     i="⚡",ac=Color3.fromRGB(0,255,200),  bg=Color3.fromRGB(5,8,12),     bS=Color3.fromRGB(8,12,18),  bT=Color3.fromRGB(12,18,26),  bd=Color3.fromRGB(30,45,55),  of=Color3.fromRGB(20,30,38),  tx=Color3.fromRGB(220,255,240),tM=Color3.fromRGB(100,200,170),tD=Color3.fromRGB(50,120,100)},
{n="Plasma",   d="Electric Purple",  i="✧",ac=Color3.fromRGB(180,100,255), bg=Color3.fromRGB(8,4,14),     bS=Color3.fromRGB(14,8,22),  bT=Color3.fromRGB(20,12,32),  bd=Color3.fromRGB(45,25,70),  of=Color3.fromRGB(32,18,50),  tx=Color3.fromRGB(240,225,255),tM=Color3.fromRGB(170,130,210),tD=Color3.fromRGB(100,70,140)},
{n="Frost",    d="Icy · Cyan",       i="❄",ac=Color3.fromRGB(100,220,255), bg=Color3.fromRGB(4,10,16),     bS=Color3.fromRGB(8,16,24),  bT=Color3.fromRGB(12,22,34),  bd=Color3.fromRGB(25,50,70),  of=Color3.fromRGB(18,36,52),  tx=Color3.fromRGB(225,245,255),tM=Color3.fromRGB(130,190,220),tD=Color3.fromRGB(70,120,150)},
{n="Lava",     d="Molten · Orange",  i="🔥",ac=Color3.fromRGB(255,120,50),  bg=Color3.fromRGB(14,6,2),      bS=Color3.fromRGB(22,10,4),   bT=Color3.fromRGB(32,16,8),   bd=Color3.fromRGB(80,35,15),  of=Color3.fromRGB(55,25,12),  tx=Color3.fromRGB(255,235,215),tM=Color3.fromRGB(220,160,100),tD=Color3.fromRGB(150,90,60)},
{n="Aqua",     d="Deep Ocean",       i="🌊",ac=Color3.fromRGB(50,200,220),  bg=Color3.fromRGB(2,8,14),      bS=Color3.fromRGB(6,14,22),  bT=Color3.fromRGB(10,20,32),  bd=Color3.fromRGB(20,45,65),  of=Color3.fromRGB(14,32,48),  tx=Color3.fromRGB(210,245,255),tM=Color3.fromRGB(110,180,200),tD=Color3.fromRGB(60,110,130)},
{n="Blood",    d="Crimson Night",    i="🩸",ac=Color3.fromRGB(220,40,60),   bg=Color3.fromRGB(10,2,4),      bS=Color3.fromRGB(16,6,8),   bT=Color3.fromRGB(24,10,14),  bd=Color3.fromRGB(60,15,25),  of=Color3.fromRGB(40,12,18),  tx=Color3.fromRGB(255,225,230),tM=Color3.fromRGB(200,120,130),tD=Color3.fromRGB(130,60,70)},
{n="Custom",   d="Your colours",     i="✎",ac=Color3.fromRGB(120,47,204), bg=Color3.fromRGB(5,7,11),    bS=Color3.fromRGB(11,13,18),  bT=Color3.fromRGB(20,22,28),  bd=Color3.fromRGB(35,38,48),  of=Color3.fromRGB(27,30,37),  tx=Color3.fromRGB(230,230,235),tM=Color3.fromRGB(140,142,150),tD=Color3.fromRGB(90,92,100)},
}
local TL_PRESETS={}
for i,t in ipairs(TL) do
    if t.n~="Custom" then
        TL_PRESETS[i]={n=t.n,d=t.d,i=t.i,ac=t.ac,bg=t.bg,bS=t.bS,bT=t.bT,bd=t.bd,of=t.of,tx=t.tx,tM=t.tM,tD=t.tD}
    end
end
local function customThemeIdx()
    for i,t in ipairs(TL) do if t.n=="Custom" then return i end end
    return #TL
end
local applyPresetToCustom -- forward

local themeIdx=1
local winTrans=18
local S -- forward decl (assigned below; apTh/theme helpers need it in scope)
local reg={ac={},bg={},bS={},bT={},tx={},tM={},tD={},bd={},bc={},tr={},tog={},cards={},accentLines={},ico={},sb={}}
local TF=TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local TS2=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local _winGradRef=nil

local function ra(k,o,p) table.insert(reg[k],{o,p}) end
local function raScroll(sf)
    if sf and sf:IsA("ScrollingFrame") then
        table.insert(reg.sb, sf)
        sf.ScrollBarImageColor3 = T.ac
    end
end
local function refreshSidebarTheme()
    -- Prefer callback registered inside _ui (has tabC/side refs in scope)
    if S and type(S._themeSidebarRefresh)=="function" then
        pcall(S._themeSidebarRefresh)
        return
    end
end

local function refreshAccentLines()
    for _,und in ipairs(reg.accentLines) do
        if und and und.Parent then
            und.BackgroundColor3=T.ac
            local ug=und:FindFirstChildOfClass("UIGradient")
            if ug then
                ug.Color=ColorSequence.new({
                    ColorSequenceKeypoint.new(0,T.ac),
                    ColorSequenceKeypoint.new(0.45,Color3.new(math.min(1,T.ac.R*1.4),math.min(1,T.ac.G*1.4),math.min(1,T.ac.B*1.4))),
                    ColorSequenceKeypoint.new(1,Color3.new(T.ac.R*0.35,T.ac.G*0.35,T.ac.B*0.35))
                })
            end
        end
    end
end

local function apTh(t,keepLight)
    -- Apply dark theme base from TL entry
    T.bg=t.bg;T.bgS=t.bS;T.bgT=t.bT;T.ac=t.ac;T.bd=t.bd;T.off=t.of
    T.tx=t.tx;T.txM=t.tM;T.txD=t.tD
    T.txSel=Color3.new((t.tx.R+t.tM.R)/2,(t.tx.G+t.tM.G)/2,(t.tx.B+t.tM.B)/2)

    -- If light mode stays on, keep accent from theme but force light surfaces/text
    if S and S.lightMode and keepLight~=false then
        T.bg=Color3.fromRGB(248,249,252);T.bgS=Color3.fromRGB(255,255,255);T.bgT=Color3.fromRGB(236,238,244)
        T.bd=Color3.fromRGB(200,205,215);T.off=Color3.fromRGB(190,195,205)
        T.tx=Color3.fromRGB(18,20,28);T.txM=Color3.fromRGB(55,58,70);T.txD=Color3.fromRGB(110,115,130)
        T.txSel=Color3.fromRGB(10,12,18)
        -- accent stays from theme (t.ac already set)
    end

    local map={ac="ac",bg="bg",bS="bS",bT="bT",tx="tx",tM="tM",tD="tD",bc="bd"}
    for k,mk in pairs(map) do
        local col=(k=="ac") and T.ac or (k=="bg" and T.bg) or (k=="bS" and T.bgS) or (k=="bT" and T.bgT) or (k=="tx" and T.tx) or (k=="tM" and T.txM) or (k=="tD" and T.txD) or T.bd
        for _,r in ipairs(reg[k]) do if r[1] and r[1].Parent then r[1][r[2]]=col end end
    end
    for _,s in ipairs(reg.bd) do if s and s.Parent then s.Color=T.bd end end
    for _,r in ipairs(reg.tr) do if r[1] and r[1].Parent then r[1][r[2]]=T.off end end
    for _,g in ipairs(reg.tog) do
        if g.f and g.f.Parent then g.f.BackgroundColor3=g.on() end
        if g.c and g.c.Parent then g.c.BackgroundColor3=g.cn() end
    end
    for i,card in ipairs(reg.cards) do
        local sel=(i==themeIdx)
        if card.s and card.s.Parent then
            TwS:Create(card.s,TS2,{Color=sel and T.ac or T.bd,Thickness=sel and 2 or 1}):Play()
        end
        if card.n and card.n.Parent then card.n.TextColor3=sel and T.ac or T.tx end
        if card.ic and card.ic.Parent then card.ic.TextColor3=sel and T.ac or T.txD end
    end
    for _,ic in ipairs(reg.ico) do
        if ic[1] and ic[1].Parent then ic[1][ic[2]]=T.txM end
    end
    if _winGradRef and _winGradRef.Parent then
        _winGradRef.Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,T.bg),
            ColorSequenceKeypoint.new(0.5,T.bgS),
            ColorSequenceKeypoint.new(1,Color3.new(math.min(1,T.bg.R*1.12),math.min(1,T.bg.G*1.12),math.min(1,T.bg.B*1.15)))
        })
    end
    for _,card in ipairs(reg.cards) do
        if card.f and card.f.Parent then
            local g=card.f:FindFirstChildOfClass("UIGradient")
            if not g then g=Instance.new("UIGradient");g.Rotation=120;g.Parent=card.f end
            g.Color=ColorSequence.new({
                ColorSequenceKeypoint.new(0,T.bgT),
                ColorSequenceKeypoint.new(1,T.bgS)
            })
        end
    end
    refreshAccentLines()
    refreshSidebarTheme()
    for _,sf in ipairs(reg.sb) do
        if sf and sf.Parent then sf.ScrollBarImageColor3=T.ac end
    end
    if S and S._layoutModePainters then
        for _,fn in ipairs(S._layoutModePainters) do pcall(fn) end
    end
    if S and type(S._applyUiStyle)=="function" then
        pcall(function() S._applyUiStyle(S.uiStyle or "Solid",true) end)
    end
end
local function applyPresetToCustom(presetIdx, silent)
    local srcT=TL_PRESETS[presetIdx] or (TL[presetIdx] and TL[presetIdx].n~="Custom" and TL[presetIdx])
    if not srcT then return end
    local ci=customThemeIdx()
    local c=TL[ci]
    for _,k in ipairs({"ac","bg","bS","bT","bd","of","tx","tM","tD"}) do c[k]=srcT[k] end
    c.d="From "..tostring(srcT.n)
    themeIdx=ci
    apTh(c, true)
    if not silent and type(showPopup)=="function" then
        -- showPopup may not exist yet during early load
    end
end
local function updCards()
    local t2=TL[themeIdx]
    for i,card in ipairs(reg.cards) do
        local sel=(i==themeIdx)
        if card.s and card.s.Parent then
            TwS:Create(card.s,TS2,{Color=sel and T.ac or T.bd,Thickness=sel and 2 or 1}):Play()
        end
        if card.n and card.n.Parent then card.n.TextColor3=sel and T.ac or T.tx end
        if card.ic and card.ic.Parent then card.ic.TextColor3=sel and T.ac or T.txD end
    end
end

local CH_VERSION="v1.0.1"

local plr=Players.LocalPlayer
local LocalPlayer=plr
local char=plr.Character or plr.CharacterAdded:Wait()
local hrp=char:WaitForChild("HumanoidRootPart")
local hum=char:WaitForChild("Humanoid")
local cam=workspace.CurrentCamera
local mouse=plr:GetMouse()
local Mouse=mouse
local rSys=RepS:WaitForChild("RocketSystem",10)

local ev=rSys and rSys:WaitForChild("Events",10)
local hitR=ev and ev:FindFirstChild("RocketHit")
local expEv=ev and ev:FindFirstChild("ExplosionsMake")

S={
    fireRate=0.001,maxDist=4000,rktPerTgt=1,spread=5,
    wlist={},spamOn=false,simFire=false,dead=false,
    espOn=false,espBoxes={},vehESP={},espCache={},
    espLines=true,espTracers=true,espHealth=true,espNames=true,espDist=true,espFaction=false,espFactionMode="tag",
    espSkeleton=false,espHeadDot=true,espRadar=false,enemyChams=false,vehEspOn=false,
    radarFrame=nil,radarDots={},
    myBase=nil,clickOn=false,mouseHeld=false,
    patMode="None",patSize=50,custTxt="HELLO",txtSize=250,
    tgtTypes={Players=true,Vehicles=false,BaseShields=false,ElectricalBoxes=false},
    cachedWep=nil,lastFire=0,lastClick=0,
    flying=false,flyBV=nil,flyBG=nil,flySpd=1500,
    keys={W=false,A=false,S=false,D=false,Space=false,Ctrl=false,E=false,Q=false},
    spHkOn=false,spHkV=50,jpHkOn=false,jpHkV=100,
    infJOn=false,infJConn=nil,
    ncOn=false,ncConn=nil,ncOrig={},
    gravV=workspace.Gravity,gravOn=false,gravMul=0.5,
    spinOn=false,spinSpd=360,spinBAV=nil,spinAR=true,
    chamsOn=false,chamsHL=nil,
    brightOn=false,fogOn=false,xrayOn=false,xrayParts={},origAtm={},
    origLi={Ambient=Li.Ambient or Color3.new(),OutdoorAmbient=Li.OutdoorAmbient or Color3.new(),
            Brightness=Li.Brightness or 2,FogEnd=Li.FogEnd or 100000,FogStart=Li.FogStart or 0,GlobalShadows=Li.GlobalShadows~=false},
    fireGen=0,hasShot=false,spLkConn=nil,jpLkConn=nil,
    hitboxOn=false,hitboxSize=20,hitboxConn=nil,hitboxOrig={},
    hitboxVisOn=false,hitboxVisPart="Body",hitboxVisBoxes={},hitboxVisConn=nil,
    antiAfkOn=false,antiAfkConn=nil,
    orbitOn=false,orbitConn=nil,orbitTarget=nil,orbitRadius=20,orbitSpeed=1,orbitAngle=0,orbitBV=nil,orbitBG=nil,
    cleanOn=false,cleanConn=nil,
    expSoundOn=false,expSoundConns={},expSoundCache={},
    noShakeOn=false,noShakeConn=nil,noShakeConn2=nil,
    noExpConn=nil,
    bringDist=3,bringLoops={},
    orbitSpecific=false,orbitSpecConn=nil,orbitSpecTarget=nil,orbitSpecAngle=0,orbitSpecDist=20,orbitSpecSpd=90,
    nametag={nameConn=nil,glitchConn=nil},
    watchConns={},
        keybinds={
        menuToggle=Enum.KeyCode.RightControl,
        minimize=Enum.KeyCode.Insert,
        altPalette=Enum.KeyCode.LeftAlt,
                fly=nil, esp=nil, spam=nil, speed=nil, jump=nil, infJump=nil,
        noClip=nil, lowGrav=nil, spin=nil, hitbox=nil, hitboxVis=nil,
        chams=nil, fullbright=nil, noFog=nil, xray=nil, antiAfk=nil,
        cleanExp=nil, noExp=nil, muteExp=nil, noShake=nil, hideNametag=nil,
        clickSpam=nil, orbit=nil, bring=nil,
    },
    minimized=false,
    miniPanel=nil,
    rainbowOn=false,
    uiScale=1.0,
    neonGlow=0.3,
    compactMode=false,
    bannerVol=0.5,
    aimLockEnabled=false,
    aimbotEnabled=false,
    aimbotFOV=120,
    aimbotSmooth=0.15,
    aimbotTeamCheck=false,
    aimbotWallCheck=false,
    aimbotPart="Head",
    aimbotShowFOV=false,
    aimbotHoldRMB=true,
    aimbotOnePress=false,
    aimbotSensitivity=50,
    aimbotUseSens=true,
    aimbotOffset=false,
    aimbotOffsetAmt=10,
    triggerBot=false,
    twizzLoaded=false,
    radarRange=250,
    lockEnabled=false,
    isLockedOn=false,
    targetPlayer=nil,
    smoothingFactor=0.1,
    predictionFactor=0.0,
    bodyPartSelected="Head",
    colorPickerTarget="espBox",
    colorPickerOpen=false,
    vcUnlocked=false,
    desyncEnabled=false,
    desync=false,
    reverseResolveIntensity=5,
    antiLockEnabled=false,
    resolverIntensity=1.0,
    resolverMethod="Recalculate",
    strafeEnabled=false,
    strafeAllowed=true,
    strafeSpeed=50,
    strafeRadius=5,
    strafeMode="Horizontal",
    originalCameraMode=nil,
    silentAimEnabled=false,
    silentAimFOV=130,
    silentAimHitChance=100,
    silentAimTargetPart="HumanoidRootPart",
    silentAimBulletTP=false,
    silentAimShowTarget=false,
    silentAimFOVVisible=false,
    silentAimMethod="Raycast",
    silentAimMultiplyUnitBy=1,
    silentAimCheckFireFunc=false,
    silentAimBlockedMethods={},
    silentAimTeamCheck=false,
    silentAimInclude={},
    silentAimShowTargetColor=Color3.fromRGB(54,57,241),
    silentAimFOVColor=Color3.fromRGB(54,57,241),
    fovCircle=nil,
    _saHighlight=nil,
    fireMode="Auto",
    nebulaThemeColor=Color3.fromRGB(173,216,230),
    hitSoundEnabled=true,
    hitSoundSelect="Neverlose",
    nebulaEnabled=false,
    lockedTime=12,
    fovEnabled=false,
    fovValue=70,
    skyboxSelected="Game's Default",
    hazeDensity=0.3,hazeStrength=0,hazeColor=Color3.fromRGB(199,199,199),
    tankSpamEnabled=false,
    shellsToFire=1,
    spamSpeed=1,
    weaponModMethod="Attribute",
    warTycoonMode=false,
    weaponOnHands=false,
    vehiclePropertySelected="FireRate",
    vehiclePropertyValue=8888,
    nearestVehicle=nil,
        worldEditorOn=false,
    destroyBuildings=false,
    flingEnabled=false,
    flingAll=false,
    bulletTPEnabled=false,
    vehicleStealerEnabled=false,
    adminNotifyEnabled=false,
    removeGamepassButtons=false,
    autoKillRPG=false,
    vehicleHitboxOn=false,
    vehicleHitboxSize=50,
    instantMedkit=false,
        godMode=false,
    autoFarm=false,
    teleportToBase=false,
    customCrosshair=false,
    killAura=false,
    baseRaider=false,
    antiReport=false,
    performanceMode=false,
    customNotifications=true,
    configProfiles=false,
        espBoxCol=Color3.fromRGB(120,140,255),
    espTracerCol=Color3.fromRGB(120,140,255),
    espBoxR=120,espBoxG=140,espBoxB=255,
    espTrR=120,espTrG=140,espTrB=255,
        blurOn=false,
    streamproof=true,
    spectating=false,
    spectateTarget=nil,
    pinFlySpd=false,
    pinPattern=false,
    mediaPlaying=false,
    mediaSound=nil,
    mediaVol=0.5,
    mediaId="",
    fireworkOn=false,
    lightMode=false,
    arrayListOn=true,
    keybindsListOn=false,
    arrayList={},
    arrayListStyle="Default", -- Default | Gradient | Minimal | Shadow | Rainbow
    perfStatsOn=false,
    hideGameUI=false,
    hideUISnapshot=nil, -- {guiName -> wasEnabled}
    hideCoreSnapshot=nil, -- {CoreGuiType -> wasEnabled}
    pinFeatures={},
        focusTargets={}, -- [playerName]=true when focused
    focusMode=false, -- if true, RPG/aim only hit focusTargets
    targetHudOn=false,
    espAvatar=true,
    -- Kill log (persisted across accounts via writefile)
    killLog={}, totalKills=0, totalDeaths=0,
    -- Hitlist
    hitlist={}, -- [userId] = {userId,name,displayName,priority,desc,created}
    hitlistAlertOn=true, joinSniperOn=false, joinSniperTarget=nil,
    -- World lock
    clockLock=false, lockedClockTime=12, nightModeOn=false,
    -- Spin client lock (local orientation free while body still spins for others)
    spinClientLock=false,
    -- Bhop
    bhopOn=false, bhopMult=1, bhopHolding=false, bhopBaseSpeed=16,
    -- Lag switch
    lagSwitchOn=false,
    -- Character refresh restore payload
    _refreshRestore=nil,
    -- Bhop extras
    bhopSnappy=false, bhopSpeed=16, bhopJump=50, bhopMode="Classic",
    -- Radar style: Default | Dot | Cross | Grid | Minimal
    radarStyle="Default",
    -- Anti RPG / exploiter / streamer / UI glass
    antiRpgOn=false, exploiterAlertOn=false, streamerMode=false,
    uiStyle="Solid", -- Solid | Acrylic | Glass | Mica | Liquid
    espVisAlpha=0, -- Drawing transparency 0=opaque, 1=invisible
    _suppressNotifs=true,
    _settingClock=false,
    _espOnSeats=true,
    _rpgGrabLoop=false,
    _vehicleStealBusy=false,
    bulletCountZero=false,
    vehFireRate=nil,
    vehFireRateLoop=false,
}
S.rlabel=plr.Name.."Rocket0"

local function getAvatarThumb(userId,size)
    size=size or 48
    return string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=%d&h=%d",userId,size,size)
end

local CH_SETTINGS_FILE="CHUDHUB_settings.json"
local function CHLoadSettings()
    local ok,data=pcall(function()
        if isfile and isfile(CH_SETTINGS_FILE) then
            return game:GetService("HttpService"):JSONDecode(readfile(CH_SETTINGS_FILE))
        end
    end)
    if ok and type(data)=="table" then return data end
    return {}
end
local function CHSaveSettings()
    pcall(function()
        if not writefile then return end
        local kb={}
        for k,v in pairs(S.keybinds) do
            if typeof(v)=="EnumItem" then kb[k]=v.Name end
        end
        local cfg={
            flySpd=S.flySpd, fireRate=S.fireRate, maxDist=S.maxDist, simFire=S.simFire,
            spHkV=S.spHkV, jpHkV=S.jpHkV, hitboxSize=S.hitboxSize, gravMul=S.gravMul,
            spinSpd=S.spinSpd, orbitSpecDist=S.orbitSpecDist, orbitSpecSpd=S.orbitSpecSpd,
            bringDist=S.bringDist, themeIdx=themeIdx, winTrans=S.winTrans or winTrans,
            navMode=S.navMode, arrayListStyle=S.arrayListStyle, arrayListOn=S.arrayListOn,
            compactMode=S.compactMode, rainbowOn=S.rainbowOn, sfxVol=S.sfxVol,
            neonGlow=S.neonGlow, customNotifications=S.customNotifications,
            streamproof=S.streamproof, performanceMode=S.performanceMode,
            aimbotFOV=S.aimbotFOV, aimbotSmooth=S.aimbotSmooth, aimbotPart=S.aimbotPart,
            silentAimFOV=S.silentAimFOV, silentAimHitChance=S.silentAimHitChance,
            espBoxR=S.espBoxR, espBoxG=S.espBoxG, espBoxB=S.espBoxB,
            espTrR=S.espTrR, espTrG=S.espTrG, espTrB=S.espTrB,
            espSkeleton=S.espSkeleton, espHeadDot=S.espHeadDot, espRadar=S.espRadar,
            keybinds=kb, patMode=S.patMode, patSize=S.patSize,
            lightMode=S.lightMode, uiScale=S.uiScale,
        }
        writefile(CH_SETTINGS_FILE,game:GetService("HttpService"):JSONEncode(cfg))
    end)
end
local _CHCfg=CHLoadSettings()
local function applyLoadedCfg(c)
    if not c or type(c)~="table" then return end
    if c.flySpd then S.flySpd=c.flySpd end
    if c.fireRate then S.fireRate=c.fireRate end
    if c.maxDist then S.maxDist=c.maxDist end
    if c.simFire~=nil then S.simFire=c.simFire end
    if c.spHkV then S.spHkV=c.spHkV end
    if c.jpHkV then S.jpHkV=c.jpHkV end
    if c.hitboxSize then S.hitboxSize=c.hitboxSize end
    if c.gravMul then S.gravMul=c.gravMul end
    if c.spinSpd then S.spinSpd=c.spinSpd end
    if c.orbitSpecDist then S.orbitSpecDist=c.orbitSpecDist end
    if c.orbitSpecSpd then S.orbitSpecSpd=c.orbitSpecSpd end
    if c.bringDist then S.bringDist=c.bringDist end
    if c.themeIdx and TL[c.themeIdx] then themeIdx=c.themeIdx end
    if c.winTrans then S.winTrans=c.winTrans;winTrans=c.winTrans end
    if c.navMode then S.navMode=c.navMode end
    if c.arrayListStyle then S.arrayListStyle=c.arrayListStyle end
    if c.arrayListOn~=nil then S.arrayListOn=c.arrayListOn end
    if c.compactMode~=nil then S.compactMode=c.compactMode end
    if c.rainbowOn~=nil then S.rainbowOn=c.rainbowOn end
    if c.sfxVol then S.sfxVol=c.sfxVol end
    if c.neonGlow then S.neonGlow=c.neonGlow end
    if c.customNotifications~=nil then S.customNotifications=c.customNotifications end
    if c.streamproof~=nil then S.streamproof=c.streamproof end
    if c.performanceMode~=nil then S.performanceMode=c.performanceMode end
    if c.aimbotFOV then S.aimbotFOV=c.aimbotFOV end
    if c.aimbotSmooth then S.aimbotSmooth=c.aimbotSmooth end
    if c.aimbotPart then S.aimbotPart=c.aimbotPart end
    if c.silentAimFOV then S.silentAimFOV=c.silentAimFOV end
    if c.silentAimHitChance then S.silentAimHitChance=c.silentAimHitChance end
    if c.espBoxR then S.espBoxR=c.espBoxR;S.espBoxG=c.espBoxG or S.espBoxG;S.espBoxB=c.espBoxB or S.espBoxB
        S.espBoxCol=Color3.fromRGB(S.espBoxR,S.espBoxG,S.espBoxB) end
    if c.espTrR then S.espTrR=c.espTrR;S.espTrG=c.espTrG or S.espTrG;S.espTrB=c.espTrB or S.espTrB
        S.espTracerCol=Color3.fromRGB(S.espTrR,S.espTrG,S.espTrB) end
    if c.espSkeleton~=nil then S.espSkeleton=c.espSkeleton end
    if c.espHeadDot~=nil then S.espHeadDot=c.espHeadDot end
    if c.espRadar~=nil then S.espRadar=c.espRadar end
    if c.patMode then S.patMode=c.patMode end
    if c.patSize then S.patSize=c.patSize end
    if c.lightMode~=nil then S.lightMode=c.lightMode end
    if c.uiScale then S.uiScale=c.uiScale end
    if type(c.keybinds)=="table" then
        for k,name in pairs(c.keybinds) do
            pcall(function()
                local ek=Enum.KeyCode[name]
                if ek then S.keybinds[k]=ek end
            end)
        end
    end
end
applyLoadedCfg(_CHCfg)
local _saveQueued=false
local function CHQueueSave()
    if _saveQueued then return end;_saveQueued=true
    task.delay(1,function() _saveQueued=false;CHSaveSettings() end)
end


-- ========== PasteWare Silent Aim core (functions unchanged) ==========
local SilentAimSettings = {
    Enabled = false,
    ClassName = "PasteWare Silent Aim",
    ToggleKey = "U",
    TeamCheck = false,
    TargetPart = "HumanoidRootPart",
    SilentAimMethod = "Raycast",
    FOVRadius = 130,
    FOVVisible = false,
    ShowSilentAimTarget = false,
    HitChance = 100,
    MultiplyUnitBy = 1,
    BulletTP = false,
    CheckForFireFunc = false,
    BlockedMethods = {},
    Include = {},
    Origin = "Camera",
    FOVColor = Color3.fromRGB(54, 57, 241),
    TargetColor = Color3.fromRGB(54, 57, 241),
    IgnoredPlayers = {},
}
getgenv().SilentAimSettings = SilentAimSettings

local SA_Camera = workspace.CurrentCamera
local SA_GetPlayers = Players.GetPlayers
local SA_WorldToScreen = SA_Camera.WorldToScreenPoint
local SA_WorldToViewportPoint = SA_Camera.WorldToViewportPoint
local SA_FindFirstChild = game.FindFirstChild

local ValidTargetParts = {"Head", "HumanoidRootPart"}

local fov_circle
pcall(function()
    fov_circle = Drawing.new("Circle")
    fov_circle.Thickness = 1
    fov_circle.NumSides = 100
    fov_circle.Radius = 130
    fov_circle.Filled = false
    fov_circle.Visible = false
    fov_circle.ZIndex = 999
    fov_circle.Transparency = 1
    fov_circle.Color = SilentAimSettings.FOVColor
end)
S.fovCircle = fov_circle

local ExpectedArguments = {
    ViewportPointToRay = { ArgCountRequired = 2, Args = { "number", "number" } },
    ScreenPointToRay = { ArgCountRequired = 2, Args = { "number", "number" } },
    Raycast = { ArgCountRequired = 3, Args = { "Instance", "Vector3", "Vector3", "RaycastParams" } },
    FindPartOnRay = { ArgCountRequired = 2, Args = { "Ray", "Instance", "boolean", "boolean" } },
    FindPartOnRayWithIgnoreList = { ArgCountRequired = 3, Args = { "Ray", "table", "boolean", "boolean" } },
    FindPartOnRayWithWhitelist = { ArgCountRequired = 3, Args = { "Ray", "table", "boolean", "boolean" } },
}

function CalculateChance(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return chance <= Percentage / 100
end

local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = SA_WorldToScreen(SA_Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function getClosestPlayer()
    if not SilentAimSettings.TargetPart then return end
    local Camera = workspace.CurrentCamera
    local Closest
    local DistanceToMouse
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local ignoredPlayers = SilentAimSettings.IgnoredPlayers

    for _, Player in next, SA_GetPlayers(Players) do
        if Player == LocalPlayer then continue end
        if ignoredPlayers and ignoredPlayers[Player.Name] then continue end
        if SilentAimSettings.TeamCheck and Player.Team == LocalPlayer.Team then continue end
        local Character = Player.Character
        if not Character then continue end
        local HumanoidRootPart = SA_FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = SA_FindFirstChild(Character, "Humanoid")
        if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then continue end
        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
        if not OnScreen then continue end
        local Distance = (center - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or SilentAimSettings.FOVRadius or 2000) then
            Closest = ((SilentAimSettings.TargetPart == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[SilentAimSettings.TargetPart])
            DistanceToMouse = Distance
        end
    end
    return Closest
end

-- alias for other ChudHub features that still call getSilentAimTarget
local function getSilentAimTarget()
    return getClosestPlayer()
end



local function getBodyPart(character, partName)
    return character:FindFirstChild(partName) and partName or "Head"
end

local function getNearestPlayerToMouse()
    if not (S.aimLockEnabled or S.aimbotEnabled) then return nil end
    local nearest, shortest = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isFocusTarget(p) and not S.wlist[p.Name] and p.Character and p.Character:FindFirstChild(S.bodyPartSelected or "Head") then
            local part = p.Character[S.bodyPartSelected or "Head"]
            local sp, on = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            if on then
                local d = (Vector2.new(sp.X, sp.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if d < shortest then nearest, shortest = p, d end
            end
        end
    end
    return nearest
end

local function toggleLockOnPlayer()
    if not (S.lockEnabled and S.aimLockEnabled) then return end
    if S.isLockedOn then
        S.isLockedOn, S.targetPlayer = false, nil
    else
        S.targetPlayer = getNearestPlayerToMouse()
        if S.targetPlayer and S.targetPlayer.Character then
            local pn = getBodyPart(S.targetPlayer.Character, S.bodyPartSelected or "Head")
            if S.targetPlayer.Character:FindFirstChild(pn) then S.isLockedOn = true end
        end
    end
end

-- Desync Heartbeat (PasteWare pure reverse-resolve)
game:GetService("RunService").Heartbeat:Connect(function()
    if not (S.desyncEnabled and S.desync) then return end
    local ch = LocalPlayer.Character
    local r = ch and ch:FindFirstChild("HumanoidRootPart")
    if not r then return end
    local intens = S.reverseResolveIntensity or 5
    local originalVelocity = r.Velocity
    local randomOffset = Vector3.new(
        math.random(-1, 1) * intens * 1000,
        math.random(-1, 1) * intens * 1000,
        math.random(-1, 1) * intens * 1000
    )
    pcall(function()
        r.Velocity = randomOffset
        r.CFrame = r.CFrame * CFrame.Angles(0, math.random(-1, 1) * intens * 0.001, 0)
    end)
    game:GetService("RunService").RenderStepped:Wait()
    pcall(function()
        r.Velocity = originalVelocity
    end)
end)

-- Aimbot / AimLock RenderStepped
game:GetService("RunService").RenderStepped:Connect(function()
    -- FOV circle for aimbot
    if S.aimbotShowFOV and S.aimbotEnabled then
        if not S._aimFOV then
            local c=Drawing and Drawing.new and Drawing.new("Circle")
            if c then
                c.Thickness=1;c.NumSides=64;c.Radius=S.aimbotFOV or 120
                c.Filled=false;c.Visible=true;c.Color=Color3.fromRGB(120,47,204)
                c.Transparency=0.4
                S._aimFOV=c
            end
        end
        if S._aimFOV then
            S._aimFOV.Position=Vector2.new(Mouse.X,Mouse.Y+36)
            S._aimFOV.Radius=S.aimbotFOV or 120
            S._aimFOV.Visible=true
        end
    elseif S._aimFOV then
        S._aimFOV.Visible=false
    end

    -- Hold RMB to aim (when aimbotHoldRMB is on), otherwise always-on while enabled
    local rmbHeld=UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    local aimActive=false
    if S.aimbotEnabled then
        if S.aimbotHoldRMB then
            aimActive=rmbHeld
        else
            aimActive=true
        end
    end
    local useAim=aimActive or (S.aimLockEnabled and S.isLockedOn)
    if not useAim then return end

    local targetPart=nil
    if aimActive then
        local best,bestD=nil,math.huge
        local fov=S.aimbotFOV or 120
        local partName=S.aimbotPart or "Head"
        for _,p in pairs(Players:GetPlayers()) do
            if p==LocalPlayer then continue end
            if S.wlist[p.Name] then continue end
            if not isFocusTarget(p) then continue end
            if S.aimbotTeamCheck and p.Team and LocalPlayer.Team and p.Team==LocalPlayer.Team then continue end
            local ch=p.Character;if not ch then continue end
            local hum2=ch:FindFirstChildOfClass("Humanoid");if not hum2 or hum2.Health<=0 then continue end
            local part=ch:FindFirstChild(partName) or ch:FindFirstChild("HumanoidRootPart")
            if not part then continue end
            local sp,on=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            if not on then continue end
            local d=(Vector2.new(sp.X,sp.Y)-Vector2.new(Mouse.X,Mouse.Y)).Magnitude
            if d<=fov and d<bestD then best,bestD=part,d end
        end
        targetPart=best
    elseif S.isLockedOn and S.targetPlayer and S.targetPlayer.Character then
        local pn=getBodyPart(S.targetPlayer.Character,S.bodyPartSelected or "Head")
        targetPart=S.targetPlayer.Character:FindFirstChild(pn)
        local hum2=S.targetPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not (targetPart and hum2 and hum2.Health>0) then
            S.isLockedOn,S.targetPlayer=false,nil
            targetPart=nil
        end
    end

    if targetPart then
        local pred=targetPart.Position+(targetPart.AssemblyLinearVelocity*(S.predictionFactor or 0))
                if S.aimbotOffset then
            pred=pred+Vector3.new(0,(S.aimbotOffsetAmt or 10)/10,0)
        end
        if S.antiLockEnabled then
            local intens=S.resolverIntensity or 1
            if S.resolverMethod=="Recalculate" then
                pred=pred+(targetPart.AssemblyLinearVelocity*intens)
            elseif S.resolverMethod=="Randomize" then
                pred=pred+Vector3.new(math.random()*intens-intens/2,math.random()*intens-intens/2,math.random()*intens-intens/2)
            elseif S.resolverMethod=="Invert" then
                pred=pred-(targetPart.AssemblyLinearVelocity*intens*2)
            end
        end
        local camPos=workspace.CurrentCamera.CFrame.Position
        local goal=CFrame.new(camPos,pred)
                if S.aimbotUseSens then
            local sens=math.clamp(S.aimbotSensitivity or 50,9,99)/100
            TwS:Create(workspace.CurrentCamera,TweenInfo.new(sens,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{CFrame=goal}):Play()
        else
            local smooth=S.aimbotEnabled and (S.aimbotSmooth or 0.15) or (S.smoothingFactor or 0.1)
            workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame:Lerp(goal,math.clamp(1-smooth,0.05,1))
        end
    end
end)

-- Target Strafe (raw)
local function startTargetStrafe()
    if not S.strafeAllowed then return end
    S.targetPlayer = getSilentAimTarget() or getNearestPlayerToMouse()
    if S.targetPlayer and S.targetPlayer.Parent then
        S.originalCameraMode = LocalPlayer.CameraMode
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(S.targetPlayer.Position))
        end
        workspace.CurrentCamera.CameraSubject = S.targetPlayer.Parent:FindFirstChildOfClass("Humanoid")
    end
end

local function strafeAroundTarget()
    if not (S.strafeAllowed and S.strafeEnabled and S.targetPlayer and S.targetPlayer.Parent) then return end
    local tp = S.targetPlayer.Position
    local ang = tick() * ((S.strafeSpeed or 50)/10)
    local r = S.strafeRadius or 5
    local off = (S.strafeMode == "UP") and Vector3.new(math.cos(ang)*r, r, math.sin(ang)*r) or Vector3.new(math.cos(ang)*r, 0, math.sin(ang)*r)
    if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(tp + off))
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, tp)
        end
    end
end

local function stopTargetStrafe()
    LocalPlayer.CameraMode = S.originalCameraMode or Enum.CameraMode.Classic
    workspace.CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    S.strafeEnabled = false
    S.targetPlayer = nil
end

game:GetService("RunService").RenderStepped:Connect(function()
    if S.strafeEnabled and S.strafeAllowed then strafeAroundTarget() end
end)

-- Tank Spam (raw War Tycoon)
local FireTurret, RegisterTurretHit
local function getTank()
    if not S.masterToggle then return nil end
    local gs = workspace:FindFirstChild("Game Systems")
    local tw = gs and gs:FindFirstChild("Tank Workspace")
    if not tw then return nil end
    local best, bestD = nil, math.huge
    for _, t in pairs(tw:GetChildren()) do
        if t:FindFirstChild("Misc") and t.Misc:FindFirstChild("Turrets") then
            local p = (t.PrimaryPart and t.PrimaryPart.Position) or Vector3.new()
            local lp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.new()
            local d = (p - lp).Magnitude
            if d < bestD then bestD, best = d, t end
        end
    end
    return best
end

local function getTurretSmokeAndSettings(tank)
    if not tank or not tank:FindFirstChild("Misc") then return nil,nil,nil end
    for _, g in pairs(tank.Misc.Turrets:GetChildren()) do
        for _, tur in pairs(g:GetChildren()) do
            local smoke = tur:FindFirstChild("SmokePart")
            local mod = tur:FindFirstChildOfClass("ModuleScript")
            if smoke and mod then
                local ok, set = pcall(require, mod)
                if ok then return tur, smoke, set end
            end
        end
    end
    return nil,nil,nil
end

local function startTankSpam()
    if not S.masterToggle or not S.tankSpamEnabled then return end
    if not FireTurret then FireTurret = RepS:FindFirstChild("BulletFireSystem") and RepS.BulletFireSystem:FindFirstChild("FireTurret") end
    if not RegisterTurretHit then RegisterTurretHit = RepS:FindFirstChild("BulletFireSystem") and RepS.BulletFireSystem:FindFirstChild("RegisterTurretHit") end
    if not FireTurret or not RegisterTurretHit then return end
    local tank = getTank()
    if not tank then return end
    local tur, smoke, set = getTurretSmokeAndSettings(tank)
    if not tur or not smoke or not set then return end
    for _ = 1, (S.shellsToFire or 1) do
        if not S.tankSpamEnabled then return end
        local tgt = getSilentAimTarget()
        if not tgt then return end
        local orig = smoke.Position
        local dir = (tgt.Position - orig).Unit
        pcall(function()
            FireTurret:FireServer(tank, tur, nil,nil,nil,nil, {{workspace[LocalPlayer.Name], tur, workspace:FindFirstChild("LocalPartStorage")}}, true)
            RegisterTurretHit:FireServer(tur, smoke, tank, {normal=Vector3.new(0,1,0), hitPart=tgt, origin=orig, hitPoint=tgt.Position, direction=dir}, set)
        end)
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    if S.tankSpamEnabled then
        task.wait(math.max(0.01, 1/(S.spamSpeed or 1)))
        startTankSpam()
    end
end)

-- Weapon Mods (raw)
local function modifyWeaponSettings(prop, val)
    local plr = Players.LocalPlayer
    local bp = plr:WaitForChild("Backpack")
    local char = plr.Character or plr.CharacterAdded:Wait()
    local useAttr = (S.weaponModMethod == "Attribute")
    local function proc(w)
        if useAttr and w:IsA("Tool") then
            pcall(function() w:SetAttribute(prop, val) end)
        else
            local mod
            if S.warTycoonMode then
                local guns = RepS:FindFirstChild("Configurations") and RepS.Configurations:FindFirstChild("ACS_Guns")
                if guns then mod = guns:FindFirstChild(w.Name) and guns[w.Name]:FindFirstChild("Settings") end
            else
                for _, d in pairs(w:GetDescendants()) do if d:IsA("ModuleScript") and d.Name=="Settings" then mod = d break end end
            end
            if mod then pcall(function() local m = require(mod); if m then m[prop] = val end end) end
        end
    end
    if S.weaponOnHands then
        local t = char:FindFirstChildOfClass("Tool")
        if t then proc(t) end
    else
        for _, it in pairs(bp:GetChildren()) do if it:IsA("Tool") then proc(it) end end
    end
end

-- Vehicle Property Mod (raw)
local function getNearestVehicle()
    if not LocalPlayer or not LocalPlayer.Character then
        return nil
    end

    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        return nil
    end

    local gs = workspace:FindFirstChild("Game Systems")
    if not gs then
        return nil
    end

    local best, bd = nil, math.huge

    local vehicleWorkspaces = {
        "Vehicle Workspace", "Tank Workspace", "Plane Workspace",
        "Helicopter Workspace", "Boat Workspace", "Submarine Workspace",
        "Drone Workspace"
    }

    for _, wsName in ipairs(vehicleWorkspaces) do
        local ws = gs:FindFirstChild(wsName)
        if ws then
            for _, v in pairs(ws:GetChildren()) do
                if v:IsA("Model") then
                    local rootPart = nil

                    -- Best method: Functionality.TargetPart
                    local func = v:FindFirstChild("Functionality")
                    if func then
                        local tp = func:FindFirstChild("TargetPart")
                        if tp and tp:IsA("BasePart") then
                            rootPart = tp
                        end
                    end

                    if not rootPart then rootPart = v.PrimaryPart end
                    if not rootPart then rootPart = v:FindFirstChildWhichIsA("BasePart") end

                    if rootPart then
                        local d = (rootPart.Position - hrp.Position).Magnitude
                        if d < bd then
                            bd = d
                            best = v
                        end
                    end
                end
            end
        end
    end

    S.nearestVehicle = best
    return best
end

local function modifyAllVehicleSettings()
    local veh = S.nearestVehicle or getNearestVehicle()
    if not veh then return end
    local function search(o, out)
        if o:IsA("ModuleScript") and o.Name == "Settings" then table.insert(out, o) end
        for _, c in pairs(o:GetChildren()) do search(c, out) end
    end
    local mods = {}
    search(veh, mods)
    local prop = S.vehiclePropertySelected or "FireRate"
    local v = S.vehiclePropertyValue or 8888
    for _, m in pairs(mods) do
        pcall(function()
            local ok, t = pcall(require, m)
            if ok and type(t)=="table" and t[prop]~=nil then t[prop] = v end
        end)
    end
end

-- PasteWare namecall hook (logic unchanged from working PW script)
local previousHighlight = nil
local function removeOldHighlight()
    if previousHighlight then
        pcall(function() previousHighlight:Destroy() end)
        previousHighlight = nil
    end
end

RS.RenderStepped:Connect(function()
    SA_Camera = workspace.CurrentCamera
    if SilentAimSettings.ShowSilentAimTarget then
        local closestPlayer = getClosestPlayer()
        if closestPlayer then
            local Root = closestPlayer.Parent and (closestPlayer.Parent.PrimaryPart or closestPlayer) or closestPlayer
            local _, IsOnScreen = SA_WorldToViewportPoint(SA_Camera, Root.Position)
            removeOldHighlight()
            if IsOnScreen and closestPlayer.Parent then
                local highlight = closestPlayer.Parent:FindFirstChildOfClass("Highlight")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Parent = closestPlayer.Parent
                    highlight.Adornee = closestPlayer.Parent
                end
                highlight.FillColor = SilentAimSettings.TargetColor
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = SilentAimSettings.TargetColor
                highlight.OutlineTransparency = 0
                previousHighlight = highlight
            end
        else
            removeOldHighlight()
        end
    else
        removeOldHighlight()
    end

    if fov_circle then
        if SilentAimSettings.FOVVisible then
            fov_circle.Visible = true
            fov_circle.Color = SilentAimSettings.FOVColor
            fov_circle.Radius = SilentAimSettings.FOVRadius
            fov_circle.Position = Vector2.new(SA_Camera.ViewportSize.X / 2, SA_Camera.ViewportSize.Y / 2)
        else
            fov_circle.Visible = false
        end
    end
end)

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method, Arguments = getnamecallmethod(), {...}
    local self, chance = Arguments[1], CalculateChance(SilentAimSettings.HitChance)

    local BlockedMethods = SilentAimSettings.BlockedMethods or {}
    if type(BlockedMethods) == "table" then
        if BlockedMethods[Method] then return end
        for _, m in pairs(BlockedMethods) do
            if m == Method then return end
        end
    end

    if SilentAimSettings.CheckForFireFunc and (Method == "FindPartOnRay" or Method == "FindPartOnRayWithWhitelist" or Method == "FindPartOnRayWithIgnoreList" or Method == "Raycast" or Method == "ViewportPointToRay" or Method == "ScreenPointToRay") then
        local Traceback = tostring(debug.traceback()):lower()
        if not (Traceback:find("bullet") or Traceback:find("gun") or Traceback:find("fire")) then
            return oldNamecall(...)
        end
    end

    if SilentAimSettings.Enabled and self == workspace and not checkcaller() and chance then
        local HitPart = getClosestPlayer()
        if HitPart then
            local function modifyRay(Origin)
                if SilentAimSettings.BulletTP then
                    Origin = (HitPart.CFrame * CFrame.new(0, 0, 1)).p
                end
                return Origin, getDirection(Origin, HitPart.Position)
            end

            local methodWanted = SilentAimSettings.SilentAimMethod

            if Method == "FindPartOnRayWithIgnoreList" and methodWanted == Method then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
                    local Origin, Direction = modifyRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction * SilentAimSettings.MultiplyUnitBy)
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "FindPartOnRayWithWhitelist" and methodWanted == Method then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
                    local Origin, Direction = modifyRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction * SilentAimSettings.MultiplyUnitBy)
                    return oldNamecall(unpack(Arguments))
                end
            elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and methodWanted:lower() == Method:lower() then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
                    local Origin, Direction = modifyRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction * SilentAimSettings.MultiplyUnitBy)
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "Raycast" and methodWanted == Method then
                if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                    local Origin, Direction = modifyRay(Arguments[2])
                    Arguments[2], Arguments[3] = Origin, Direction * SilentAimSettings.MultiplyUnitBy
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "ViewportPointToRay" and methodWanted == Method then
                if ValidateArguments(Arguments, ExpectedArguments.ViewportPointToRay) then
                    local Origin = SA_Camera.CFrame.p
                    if SilentAimSettings.BulletTP then
                        Origin = (HitPart.CFrame * CFrame.new(0, 0, 1)).p
                    end
                    return Ray.new(Origin, (HitPart.Position - Origin).Unit * SilentAimSettings.MultiplyUnitBy)
                end
            elseif Method == "ScreenPointToRay" and methodWanted == Method then
                if ValidateArguments(Arguments, ExpectedArguments.ScreenPointToRay) then
                    local Origin = SA_Camera.CFrame.p
                    if SilentAimSettings.BulletTP then
                        Origin = (HitPart.CFrame * CFrame.new(0, 0, 1)).p
                    end
                    return Ray.new(Origin, (HitPart.Position - Origin).Unit * SilentAimSettings.MultiplyUnitBy)
                end
            end
        end
    end

    return oldNamecall(...)
end))



print("[ChudHub] PasteWare silent aim + desync integrated.")

local VWS={"Gunship Workspace","Vehicle Workspace","Tank Workspace","Submarine Workspace",
    "Rc Workspace","Helicopter Workspace","Hovercraft Workspace","Drone Workspace","Plane Workspace","Boat Workspace"}
local VRN={"HumanoidRootPart","Main","Seat","VehicleSeat","DriveSeat","Body","Hull","Frame"}
local NORMS={[Enum.NormalId.Top]=Vector3.new(0,1,0),[Enum.NormalId.Bottom]=Vector3.new(0,-1,0),
    [Enum.NormalId.Front]=Vector3.new(0,0,-1),[Enum.NormalId.Back]=Vector3.new(0,0,1),
    [Enum.NormalId.Left]=Vector3.new(-1,0,0),[Enum.NormalId.Right]=Vector3.new(1,0,0)}

-- focus mode filter (was missing — broke updateESP)
local function isFocusTarget(p)
    if not p then return false end
    if not S.focusMode then return true end
    local ft = S.focusTargets
    if type(ft) ~= "table" then return true end
    -- empty focus list = treat everyone as valid
    local any = false
    for _ in pairs(ft) do any = true break end
    if not any then return true end
    return ft[p.Name] == true or ft[tostring(p.UserId)] == true
end

local function isIgnoredName(n) return S.wlist[n]==true end
local function isIgnored(p)
    if S.wlist[p.Name]==true then return true end
    return false
end

local function findVRoot(v)
    for _,n in ipairs(VRN) do local p=v:FindFirstChild(n);if p and p:IsA("BasePart") then return p end end
    local pp=v.PrimaryPart;if pp and pp:IsA("BasePart") then return pp end
    local best,bm=nil,0
    for _,d in pairs(v:GetDescendants()) do if d:IsA("BasePart") and d.Name~="Handle" then local m=d.Size.Magnitude;if m>bm then best,bm=d,m end end end
    return best
end
local function pivMap()
    local r={};local gs=workspace:FindFirstChild("Game Systems");if not gs then return r end
    for _,wn in ipairs(VWS) do local f=gs:FindFirstChild(wn);if not f then continue end
        for _,v in pairs(f:GetChildren()) do for _,p in pairs(Players:GetPlayers()) do if p~=plr and p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h and h.SeatPart and h.SeatPart:IsDescendantOf(v) then r[p]=v end
        end end end
    end;return r
end
local function vehHasWL(v)
    for _,p in pairs(Players:GetPlayers()) do if p~=plr and isIgnored(p) and p.Character then
        local h=p.Character:FindFirstChildOfClass("Humanoid")
        if h and h.SeatPart and h.SeatPart:IsDescendantOf(v) then return true end
    end end;return false
end
local function tyProt(ty)
    local o=ty:FindFirstChild("Owner");if not o then return false end
    local v=o.Value;if not v or v=="" then return false end
    return v==plr.Name or S.wlist[v]==true
end
local function findBase()
    local tf=workspace:FindFirstChild("Tycoon");if not tf then return end
    local ts=tf:FindFirstChild("Tycoons");if not ts then return end
    for _,t in ts:GetChildren() do local o=t:FindFirstChild("Owner");if o and o.Value==plr.Name then S.myBase=t;return t end end
end
local function isMyPart(p) return S.myBase and p:IsDescendantOf(S.myBase) end
task.spawn(function() while not S.myBase and not S.dead do findBase();task.wait(2) end end)

-- ===== Kill Log (global file, shared across accounts on this machine) =====
local KILL_FILE="CHUDHUB_kills.json"
local function loadKillLog()
    local ok,data=pcall(function()
        if isfile and isfile(KILL_FILE) then
            return game:GetService("HttpService"):JSONDecode(readfile(KILL_FILE))
        end
    end)
    if ok and type(data)=="table" then
        S.totalKills=tonumber(data.totalKills) or 0
        S.totalDeaths=tonumber(data.totalDeaths) or 0
        S.killLog=type(data.kills)=="table" and data.kills or {}
        return
    end
    S.killLog={};S.totalKills=0;S.totalDeaths=0
end
local function saveKillLog()
    pcall(function()
        if not writefile then return end
        -- keep last 250 entries
        while #S.killLog>250 do table.remove(S.killLog,1) end
        writefile(KILL_FILE,game:GetService("HttpService"):JSONEncode({
            totalKills=S.totalKills,totalDeaths=S.totalDeaths,kills=S.killLog
        }))
    end)
end
local function logKill(victim)
    if not victim or victim==plr then return end
    S.totalKills=(S.totalKills or 0)+1
    table.insert(S.killLog,{
        type="kill",
        name=victim.Name,
        displayName=victim.DisplayName or victim.Name,
        userId=victim.UserId,
        time=os.time(),
        placeId=game.PlaceId,
    })
    saveKillLog()
    pcall(function()
        local sp=rawget(_G,"CH_showPopup")
        if type(sp)=="function" then
            sp("Kill +"..tostring(S.totalKills),victim.DisplayName or victim.Name,T.ok)
        end
    end)
end
local function logDeath()
    S.totalDeaths=(S.totalDeaths or 0)+1
    table.insert(S.killLog,{
        type="death",
        name=plr.Name,
        displayName=plr.DisplayName or plr.Name,
        userId=plr.UserId,
        time=os.time(),
        placeId=game.PlaceId,
    })
    saveKillLog()
end
loadKillLog()
-- Current character death
pcall(function()
    if hum then
        hum.Died:Connect(function() logDeath() end)
    end
end)

-- Track other players' deaths (local kill attribution)
local function bindPlayerDeath(p)
    if not p or p==plr then return end
    local function attach(c)
        local h=c and c:FindFirstChildOfClass("Humanoid")
        if not h then return end
        h.Died:Connect(function()
            -- Attribute kill if we were actively fighting / nearby
            local okAttr=false
            if S.spamOn or S.focusMode then
                if S.focusTargets[p.Name] or S.spamOn then okAttr=true end
            end
            local th=c:FindFirstChild("HumanoidRootPart")
            if th and hrp and (th.Position-hrp.Position).Magnitude<180 then okAttr=true end
            if okAttr then logKill(p) end
        end)
    end
    if p.Character then attach(p.Character) end
    p.CharacterAdded:Connect(function(c) task.defer(function() attach(c) end) end)
end
for _,p in ipairs(Players:GetPlayers()) do bindPlayerDeath(p) end
Players.PlayerAdded:Connect(bindPlayerDeath)

-- ===== Hitlist =====
local HITLIST_FILE="CHUDHUB_hitlist.json"
local function loadHitlist()
    local ok,data=pcall(function()
        if isfile and isfile(HITLIST_FILE) then
            return game:GetService("HttpService"):JSONDecode(readfile(HITLIST_FILE))
        end
    end)
    if ok and type(data)=="table" then
        S.hitlist={}
        for _,e in ipairs(data) do
            if e and e.userId then S.hitlist[tostring(e.userId)]=e end
        end
    end
end
local function saveHitlist()
    pcall(function()
        if not writefile then return end
        local arr={}
        for _,e in pairs(S.hitlist) do arr[#arr+1]=e end
        writefile(HITLIST_FILE,game:GetService("HttpService"):JSONEncode(arr))
    end)
end
loadHitlist()

local function fetchRobloxUser(query)
    -- query can be username, display name, or userId
    local Http=game:GetService("HttpService")
    local uid=tonumber(query)
    local profile=nil
    -- first: match players currently in server by display name / username
    if not uid then
        local q=tostring(query):lower()
        for _,p in ipairs(Players:GetPlayers()) do
            if p.Name:lower()==q or (p.DisplayName and p.DisplayName:lower()==q) or (p.DisplayName and p.DisplayName:lower():find(q,1,true)) then
                uid=p.UserId
                break
            end
        end
    end
    if uid then
        local ok,body=pcall(function()
            return game:HttpGet("https://users.roblox.com/v1/users/"..tostring(uid))
        end)
        if ok and body then
            local d=Http:JSONDecode(body)
            if d and d.id then
                profile={userId=d.id,name=d.name,displayName=d.displayName,description=d.description or "",created=d.created,isBanned=d.isBanned}
            end
        end
    else
        local ok,body=pcall(function()
            return game:HttpGet("https://users.roblox.com/v1/usernames/users",true)
        end)
        -- POST preferred; fallback to older endpoint
        local ok2,body2=pcall(function()
            return game:HttpGet("https://api.roblox.com/users/get-by-username?username="..Http:UrlEncode(query))
        end)
        if ok2 and body2 then
            local d=Http:JSONDecode(body2)
            if d and (d.Id or d.id) then
                uid=d.Id or d.id
                local ok3,body3=pcall(function() return game:HttpGet("https://users.roblox.com/v1/users/"..tostring(uid)) end)
                if ok3 and body3 then
                    local d3=Http:JSONDecode(body3)
                    profile={userId=d3.id,name=d3.name,displayName=d3.displayName,description=d3.description or "",created=d3.created,isBanned=d3.isBanned}
                else
                    profile={userId=uid,name=d.Username or d.username or query,displayName=d.Username or query,description="",created="",isBanned=false}
                end
            end
        end
        -- modern username lookup via POST-like alternative if available
        if not profile then
            local okp,resp=pcall(function()
                if request then
                    local r=request({
                        Url="https://users.roblox.com/v1/usernames/users",
                        Method="POST",
                        Headers={["Content-Type"]="application/json"},
                        Body=Http:JSONEncode({usernames={query},excludeBannedUsers=false})
                    })
                    return r and r.Body
                elseif syn and syn.request then
                    local r=syn.request({
                        Url="https://users.roblox.com/v1/usernames/users",
                        Method="POST",
                        Headers={["Content-Type"]="application/json"},
                        Body=Http:JSONEncode({usernames={query},excludeBannedUsers=false})
                    })
                    return r and r.Body
                end
            end)
            if okp and resp then
                local d=Http:JSONDecode(resp)
                local data=d and d.data and d.data[1]
                if data and data.id then
                    uid=data.id
                    local ok3,body3=pcall(function() return game:HttpGet("https://users.roblox.com/v1/users/"..tostring(uid)) end)
                    if ok3 and body3 then
                        local d3=Http:JSONDecode(body3)
                        profile={userId=d3.id,name=d3.name,displayName=d3.displayName,description=d3.description or "",created=d3.created,isBanned=d3.isBanned}
                    else
                        profile={userId=uid,name=data.name or query,displayName=data.displayName or query,description="",created="",isBanned=false}
                    end
                end
            end
        end
    end
    if profile then
        -- extra presence / friends count optional
        pcall(function()
            local okf,fb=pcall(function() return game:HttpGet("https://friends.roblox.com/v1/users/"..tostring(profile.userId).."/followers/count") end)
            if okf and fb then
                local fd=Http:JSONDecode(fb);profile.followers=fd and fd.count or nil
            end
        end)
        pcall(function()
            local okf,fb=pcall(function() return game:HttpGet("https://friends.roblox.com/v1/users/"..tostring(profile.userId).."/followings/count") end)
            if okf and fb then
                local fd=Http:JSONDecode(fb);profile.followings=fd and fd.count or nil
            end
        end)
        pcall(function()
            local okf,fb=pcall(function() return game:HttpGet("https://friends.roblox.com/v1/users/"..tostring(profile.userId).."/friends/count") end)
            if okf and fb then
                local fd=Http:JSONDecode(fb);profile.friends=fd and fd.count or nil
            end
        end)
    end
    return profile
end

local function showHitlistBanner(entry,playerObj)
    if not S.hitlistAlertOn then return end
    local parentGui=nil
    pcall(function()
        if sg and sg.Parent then parentGui=sg end
    end)
    if not parentGui then
        pcall(function()
            parentGui=plr:FindFirstChild("PlayerGui")
            if parentGui then
                local existing=parentGui:FindFirstChild("ChudHubUI")
                if existing then parentGui=existing
                else
                    local tmp=Instance.new("ScreenGui");tmp.Name="CH_HitlistTemp";tmp.ResetOnSpawn=false;tmp.Parent=parentGui;parentGui=tmp
                end
            end
        end)
    end
    if not parentGui then return end
    local banner=Instance.new("Frame")
    banner.Name="CH_HitlistBanner"
    banner.Size=UDim2.new(0,420,0,90)
    banner.AnchorPoint=Vector2.new(0.5,0)
    banner.Position=UDim2.new(0.5,0,0,-100)
    banner.BackgroundColor3=Color3.fromRGB(18,8,12)
    banner.BackgroundTransparency=0.08
    banner.BorderSizePixel=0
    banner.ZIndex=120
    banner.Parent=parentGui
    local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,12);c.Parent=banner
    local st=Instance.new("UIStroke");st.Color=Color3.fromRGB(248,113,113);st.Thickness=2;st.Parent=banner
    local av=Instance.new("ImageLabel")
    av.Size=UDim2.new(0,64,0,64);av.Position=UDim2.new(0,12,0.5,-32)
    av.BackgroundColor3=Color3.fromRGB(30,20,24);av.BorderSizePixel=0
    av.Image=getAvatarThumb(entry.userId or (playerObj and playerObj.UserId) or 1,100)
    av.ZIndex=121;av.Parent=banner
    local ac=Instance.new("UICorner");ac.CornerRadius=UDim.new(1,0);ac.Parent=av
    local title=Instance.new("TextLabel")
    title.Size=UDim2.new(1,-100,0,28);title.Position=UDim2.new(0,90,0,12)
    title.BackgroundTransparency=1;title.Text="⚠ HITLIST TARGET IN SERVER"
    title.TextColor3=Color3.fromRGB(248,113,113);title.Font=Enum.Font.GothamBold;title.TextSize=16
    title.TextXAlignment=Enum.TextXAlignment.Left;title.ZIndex=121;title.Parent=banner
    local sub=Instance.new("TextLabel")
    sub.Size=UDim2.new(1,-100,0,36);sub.Position=UDim2.new(0,90,0,42)
    sub.BackgroundTransparency=1
    sub.Text=(entry.displayName or entry.name or "?").."  @"..(entry.name or "?").."  ·  UID "..tostring(entry.userId or "?")
    sub.TextColor3=Color3.fromRGB(230,230,235);sub.Font=Enum.Font.Gotham;sub.TextSize=13
    sub.TextXAlignment=Enum.TextXAlignment.Left;sub.TextWrapped=true;sub.ZIndex=121;sub.Parent=banner
    TwS:Create(banner,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Position=UDim2.new(0.5,0,0,18)
    }):Play()
    pcall(function() if type(playSFX)=="function" then playSFX("notify",0.6) end end)
    task.delay(6,function()
        if banner and banner.Parent then
            TwS:Create(banner,TweenInfo.new(0.3),{Position=UDim2.new(0.5,0,0,-120),BackgroundTransparency=1}):Play()
            task.wait(0.35);banner:Destroy()
        end
    end)
end

local function checkHitlistPlayer(p)
    if not p or p==plr then return end
    local e=S.hitlist[tostring(p.UserId)]
    if e then
        showHitlistBanner(e,p)
        if S.joinSniperOn then
            pcall(function()
                local sp=rawget(_G,"CH_showPopup")
                if type(sp)=="function" then
                    sp("Join Sniper","Target found: "..(e.displayName or e.name),T.ng)
                end
            end)
        end
    end
end
for _,p in ipairs(Players:GetPlayers()) do task.defer(checkHitlistPlayer,p) end
Players.PlayerAdded:Connect(function(p) task.delay(0.5,function() checkHitlistPlayer(p) end) end)

-- Clock lock: only correct when the game changes ClockTime (no flicker fight)
pcall(function()
    Li:GetPropertyChangedSignal("ClockTime"):Connect(function()
        if S._settingClock then return end
        if not (S.clockLock or S.nightModeOn) then return end
        local t=S.nightModeOn and 0 or (S.lockedClockTime or 12)
        if math.abs((Li.ClockTime or 0)-t)>0.01 then
            S._settingClock=true
            pcall(function() Li.ClockTime=t end)
            task.defer(function() S._settingClock=false end)
        end
    end)
end)
-- slow safety tick (every 2s) in case PropertyChanged is blocked
task.spawn(function()
    while true do
        task.wait(2)
        if S.clockLock or S.nightModeOn then
            local t=S.nightModeOn and 0 or (S.lockedClockTime or 12)
            if not S._settingClock and math.abs((Li.ClockTime or 0)-t)>0.5 then
                S._settingClock=true
                pcall(function() Li.ClockTime=t end)
                task.defer(function() S._settingClock=false end)
            end
        end
    end
end)

RS.RenderStepped:Connect(function()
    -- Spin client-lock: keep local orientation camera-facing so you can move/aim
    if S.spinOn and S.spinClientLock and hrp and hrp.Parent and not S.flying then
        local look=cam.CFrame.LookVector
        local flat=Vector3.new(look.X,0,look.Z)
        if flat.Magnitude>0.05 then
            pcall(function()
                hrp.CFrame=CFrame.new(hrp.Position,hrp.Position+flat)
            end)
        end
    end
end)

-- ===== Anti RPG Spam (client-side protection) =====
local function applyAntiRpg(en)
    S.antiRpgOn=en
    if S._antiRpgConn then pcall(function() S._antiRpgConn:Disconnect() end);S._antiRpgConn=nil end
    if S._antiRpgConn2 then pcall(function() S._antiRpgConn2:Disconnect() end);S._antiRpgConn2=nil end
    if S._antiRpgHb then pcall(function() S._antiRpgHb:Disconnect() end);S._antiRpgHb=nil end
    if not en then return end
    -- Rocket spam hits via RocketHit remote + explosions; client can still lock health / strip knockback
    pcall(function()
        if hitR then
            S._antiRpgConn=hitR.OnClientEvent:Connect(function(...)
                if not S.antiRpgOn or not hum then return end
                pcall(function() hum.Health=hum.MaxHealth end)
            end)
        end
    end)
    pcall(function()
        if expEv then
            S._antiRpgConn2=expEv.OnClientEvent:Connect(function(...)
                if not S.antiRpgOn or not hum then return end
                pcall(function() hum.Health=hum.MaxHealth end)
            end)
        end
    end)
    -- hard lock: full heal + zero knockback every frame while anti is on
    S._antiRpgHb=RS.Heartbeat:Connect(function()
        if not S.antiRpgOn then return end
        pcall(function()
            if hum and hum.Parent and hum.Health>0 then
                if hum.Health<hum.MaxHealth then hum.Health=hum.MaxHealth end
            end
            if hrp and hrp.Parent then
                for _,c in ipairs(hrp:GetChildren()) do
                    if (c:IsA("BodyVelocity") or c:IsA("LinearVelocity") or c:IsA("VectorForce")) and c~=S.flyBV and c~=S.spinBAV then
                        pcall(function() c:Destroy() end)
                    end
                end
                -- damp extreme explosion impulses
                local v=hrp.AssemblyLinearVelocity
                if v.Magnitude>120 then
                    hrp.AssemblyLinearVelocity=Vector3.new(v.X*0.2,math.min(v.Y,40),v.Z*0.2)
                end
            end
            for _,o in ipairs(workspace:GetChildren()) do
                if o:IsA("Explosion") then
                    pcall(function()
                        o.BlastPressure=0;o.BlastRadius=0;o.DestroyJointRadiusPercent=0
                        if hrp and (o.Position-hrp.Position).Magnitude<60 then o:Destroy() end
                    end)
                end
            end
        end)
    end)
end

-- ===== Exploiter Alert (heuristic) =====
local function scanExploiters()
    if not S.exploiterAlertOn then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p==plr then continue end
        local c=p.Character;if not c then continue end
        local h=c:FindFirstChildOfClass("Humanoid")
        local r=c:FindFirstChild("HumanoidRootPart")
        if not h or not r then continue end
        local flags={}
        if h.WalkSpeed and h.WalkSpeed>50 then flags[#flags+1]="Speed "..math.floor(h.WalkSpeed) end
        if h.JumpPower and h.JumpPower>100 then flags[#flags+1]="Jump "..math.floor(h.JumpPower) end
        -- hitbox expand: HRP far larger than normal (~2,2,1)
        pcall(function()
            local sz=r.Size
            if sz.X>=8 or sz.Y>=8 or sz.Z>=8 then
                flags[#flags+1]=string.format("Hitbox %.0fx%.0fx%.0f",sz.X,sz.Y,sz.Z)
            end
        end)
        -- other parts oversized (common silent expand)
        pcall(function()
            local head=c:FindFirstChild("Head")
            if head and head.Size.Magnitude>4 then flags[#flags+1]="BigHead" end
        end)
        local hasFly=false
        for _,ch in ipairs(r:GetChildren()) do
            if ch:IsA("BodyVelocity") or ch:IsA("BodyGyro") or ch:IsA("LinearVelocity") or ch:IsA("AngularVelocity") then
                hasFly=true;break
            end
        end
        if hasFly and not h.SeatPart then flags[#flags+1]="Fly/BV" end
        local spin=false
        pcall(function()
            if r.AssemblyAngularVelocity and r.AssemblyAngularVelocity.Magnitude>20 then spin=true end
        end)
        if spin then flags[#flags+1]="Spin" end
        -- aimbot heuristic: camera / character rapidly snaps toward local player often
        pcall(function()
            S._aimSnap=S._aimSnap or {}
            local key=tostring(p.UserId)
            local look=r.CFrame.LookVector
            local toMe=(hrp.Position-r.Position)
            if toMe.Magnitude>5 and toMe.Magnitude<250 then
                local dot=look:Dot(toMe.Unit)
                if dot>0.97 then
                    S._aimSnap[key]=(S._aimSnap[key] or 0)+1
                    if S._aimSnap[key]>=4 then flags[#flags+1]="AimSnap"; S._aimSnap[key]=0 end
                else
                    S._aimSnap[key]=math.max(0,(S._aimSnap[key] or 0)-1)
                end
            end
        end)
        -- noclip heuristic: inside geometry / no collide on root
        pcall(function()
            if r.CanCollide==false and not h.Sit and not h.SeatPart then flags[#flags+1]="NoCollide" end
        end)
        if #flags>0 then
            local key=tostring(p.UserId)
            S._exploitSeen=S._exploitSeen or {}
            local now=tick()
            if not S._exploitSeen[key] or now-S._exploitSeen[key]>18 then
                S._exploitSeen[key]=now
                pcall(function()
                    local sp=rawget(_G,"CH_showPopup")
                    if sp then sp("⚠ Exploiter?",p.Name.." · "..table.concat(flags,", "),T.ng) end
                end)
            end
        end
    end
end
task.spawn(function()
    while true do
        task.wait(2.5)
        pcall(scanExploiters)
    end
end)

local function applyLagSwitch(en)
    S.lagSwitchOn=en
    pcall(function()
        if en then
            settings().Network.IncomingReplicationLag=10
        else
            settings().Network.IncomingReplicationLag=0
        end
    end)
    pcall(function()
        local nc=game:FindService("NetworkClient") or game:GetService("NetworkClient")
        if nc and nc.SetOutgoingKBPSLimit then
            nc:SetOutgoingKBPSLimit(en and 1 or 9e9)
        end
    end)
end

local function applyBhop(en)
    S.bhopOn=en
    if not en then
        S.bhopMult=1
        S.bhopHolding=false
        if hum and hum.Parent and not S.spHkOn then
            pcall(function() hum.WalkSpeed=S.bhopBaseSpeed or 16 end)
        end
    else
        pcall(function() if hum then S.bhopBaseSpeed=hum.WalkSpeed end end)
    end
end

-- Bhop input + accel (from bhop.lua)
UIS.InputBegan:Connect(function(input,gp)
    if gp then return end
    if input.KeyCode==Enum.KeyCode.Space then
        S.bhopHolding=true
        if S.bhopOn then
            pcall(function()
                local ff=RepS:FindFirstChild("Freefall");if ff then ff:Destroy() end
                local ae=RepS:FindFirstChild("ACS_Engine")
                if ae then
                    local evs=ae:FindFirstChild("Events")
                    if evs then local fd=evs:FindFirstChild("FDMG");if fd then fd:Destroy() end end
                end
            end)
        end
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.KeyCode==Enum.KeyCode.Space then S.bhopHolding=false end
end)
RS.RenderStepped:Connect(function(dt)
    if not S.bhopOn or not hum or not hum.Parent then return end
    if S.spHkOn then return end
    local state=hum:GetState()
    local snappy=S.bhopSnappy or S.bhopMode=="Snappy"
    local accel=snappy and 28 or 8
    local maxM=snappy and 7 or 5
    if S.bhopHolding and (state==Enum.HumanoidStateType.Running or state==Enum.HumanoidStateType.Landed or state==Enum.HumanoidStateType.Jumping) then
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
    end
    if snappy and hrp and hrp.Parent then
        -- instant direction snap: velocity = move direction * speed (no inertia)
        local md=hum.MoveDirection
        local spd=(S.bhopSpeed or S.bhopBaseSpeed or 16)*(S.bhopMult or 1)
        if md.Magnitude>0.05 then
            local y=hrp.AssemblyLinearVelocity.Y
            hrp.AssemblyLinearVelocity=Vector3.new(md.X*spd,y,md.Z*spd)
        elseif not S.bhopHolding then
            local v=hrp.AssemblyLinearVelocity
            hrp.AssemblyLinearVelocity=Vector3.new(v.X*0.7,v.Y,v.Z*0.7)
        end
    end
    if state==Enum.HumanoidStateType.Freefall and S.bhopHolding then
        S.bhopMult=math.clamp((S.bhopMult or 1)+accel*dt,1,maxM)
    elseif state==Enum.HumanoidStateType.Running or state==Enum.HumanoidStateType.Landed then
        if not S.bhopHolding then S.bhopMult=1 end
    end
    local base=S.bhopSpeed or S.bhopBaseSpeed or 16
    pcall(function()
        hum.WalkSpeed=base*(S.bhopMult or 1)
        if S.bhopJump and S.bhopJump>0 then
            hum.JumpPower=S.bhopJump
            pcall(function() hum.JumpHeight=S.bhopJump/5 end)
        end
    end)
end)

local function initSys()
    if rSys then return true end
    rSys=RepS:FindFirstChild("RocketSystem");if not rSys then return false end
    ev=rSys:FindFirstChild("Events");if not ev then return false end
    hitR=ev:FindFirstChild("RocketHit");expEv=ev:FindFirstChild("ExplosionsMake");return true
end
local function getRPG()
    if S.cachedWep and S.cachedWep.Parent and(S.cachedWep.Parent==plr.Character or S.cachedWep.Parent==plr.Backpack) then return S.cachedWep end
    for _,c in ipairs({plr.Character,plr.Backpack}) do if c then
        for _,t in c:GetChildren() do if t:IsA("Tool") then local l=t.Name:lower()
            if l:find("rpg") or l:find("rocket") then S.cachedWep=t;return t end
        end end
    end end;S.cachedWep=nil;return nil
end
local function clickFire(pos,wep)
    if not hitR or not hitR.Parent then return end
    local hp=mouse.Target or workspace.Terrain
    if hp and hp.Parent then
        hitR:FireServer({Normal=Vector3.new(0,0,-1),Player=plr,Label=S.rlabel,HitPart=hp,Vehicle=wep,Position=pos,Weapon=wep})
    end
end

local function glp(ch,sx,cz,sc)
    local p={};local function i(v) p[#p+1]=v end;local function v(x,y,z) return Vector3.new(x,y,z) end
    if ch=="A" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc)) end
    elseif ch=="B" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=0,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end;for y=-3,0,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="C" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="D" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,2,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=-2,2,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="E" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="F" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc)) end
    elseif ch=="G" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for x=2,3,1 do i(v((sx+x)*sc,0,cz*sc)) end;for y=0,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="H" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,cz*sc)) end
    elseif ch=="I" then for y=-3,3,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="J" then for y=-3,3,1 do i(v((sx+2.5)*sc,0,(cz+y)*sc)) end;for x=0,2,1 do i(v((sx+x)*sc,0,(cz+3)*sc)) end;i(v((sx+.5)*sc,0,(cz+2)*sc))
    elseif ch=="K" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for n=0,3,1 do i(v((sx+n)*sc,0,(cz-n)*sc));i(v((sx+n)*sc,0,(cz+n)*sc)) end
    elseif ch=="L" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="M" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+4)*sc,0,(cz+y)*sc)) end;for n=0,2,1 do i(v((sx+n)*sc,0,(cz-3+n)*sc));i(v((sx+4-n)*sc,0,(cz-3+n)*sc)) end
    elseif ch=="N" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for n=0,6,1 do i(v((sx+n*.5)*sc,0,(cz-3+n)*sc)) end
    elseif ch=="O" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="P" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc)) end;for y=-3,0,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="Q" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for n=0,2,1 do i(v((sx+2+n*.5)*sc,0,(cz+1+n)*sc)) end
    elseif ch=="R" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc)) end;for y=-3,0,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end;for n=0,3,1 do i(v((sx+n)*sc,0,(cz+n)*sc)) end
    elseif ch=="S" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=-3,0,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for y=0,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="T" then for y=-3,3,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc)) end
    elseif ch=="U" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="V" then for n=0,6,1 do i(v((sx+n*.25)*sc,0,(cz-3+n)*sc));i(v((sx+3-n*.25)*sc,0,(cz-3+n)*sc)) end
    elseif ch=="W" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+4)*sc,0,(cz+y)*sc)) end;for n=0,2,1 do i(v((sx+n)*sc,0,(cz+3-n)*sc));i(v((sx+4-n)*sc,0,(cz+3-n)*sc)) end
    elseif ch=="X" then for n=0,6,1 do i(v((sx+n*.5)*sc,0,(cz-3+n)*sc));i(v((sx+n*.5)*sc,0,(cz+3-n)*sc)) end
    elseif ch=="Y" then for y=-3,0,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for y=0,3,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end
    elseif ch=="Z" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for n=0,6,1 do i(v((sx+3-n*.5)*sc,0,(cz-3+n)*sc)) end
    elseif ch=="0" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="1" then for y=-3,3,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end;i(v((sx+.5)*sc,0,(cz-2)*sc));for x=0,3,1 do i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="2" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=-3,0,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end;for y=0,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end
    elseif ch=="3" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=-3,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="4" then for y=-3,0,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,cz*sc)) end;for y=-3,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="5" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=-3,0,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for y=0,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="6" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end;for y=0,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end
    elseif ch=="7" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc)) end;for n=0,6,1 do i(v((sx+3-n*.3)*sc,0,(cz-3+n)*sc)) end
    elseif ch=="8" then for y=-3,3,1 do i(v(sx*sc,0,(cz+y)*sc));i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="9" then for y=-3,0,1 do i(v(sx*sc,0,(cz+y)*sc)) end;for y=-3,3,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end;for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc));i(v((sx+x)*sc,0,(cz+3)*sc)) end
    elseif ch=="!" then for y=-3,1,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end;i(v((sx+1.5)*sc,0,(cz+3)*sc))
    elseif ch=="?" then for x=0,3,1 do i(v((sx+x)*sc,0,(cz-3)*sc));i(v((sx+x)*sc,0,cz*sc)) end;for y=-3,0,1 do i(v((sx+3)*sc,0,(cz+y)*sc)) end;for y=0,1,1 do i(v((sx+1.5)*sc,0,(cz+y)*sc)) end;i(v((sx+1.5)*sc,0,(cz+3)*sc))
    end;return p
end
local function getSCF(hp,hn)
    if mab(hn.Y)>0.7 then
        local cr=cam.CFrame.RightVector;local cf2=cam.CFrame.LookVector
        local tr=Vector3.new(cr.X,0,cr.Z);if tr.Magnitude<.01 then tr=Vector3.new(1,0,0) end;tr=tr.Unit
        local tu=Vector3.new(cf2.X,0,cf2.Z);if tu.Magnitude<.01 then tu=Vector3.new(0,0,-1) end;tu=tu.Unit
        return CFrame.fromMatrix(hp,tr,tu,-hn)
    else
        local tu=Vector3.new(0,1,0)-hn*Vector3.new(0,1,0):Dot(hn);if tu.Magnitude<.01 then tu=Vector3.new(0,1,0) end;tu=tu.Unit
        return CFrame.fromMatrix(hp,tu:Cross(hn).Unit,tu,-hn)
    end
end
local function getPP(center,mode,size,text,hn,txtSize)
    local pos={};local pi2=math.pi*2
    if mode=="Custom Text" and text and #text>0 then
        local sc=(txtSize or 50)/10  
        local sp=3.5  
        local clean=""
        for i2=1,#text do local c=text:sub(i2,i2):upper();if c:match("[A-Z0-9!?]") then clean=clean..c end end
        if #clean==0 then return{center} end
        local sx=-((#clean-1)*sp)/2
        local ocf=getSCF(center,hn or Vector3.new(0,1,0))*CFrame.new(0,0,-0.5)
        for i2=1,#clean do
            local ch=clean:sub(i2,i2);local lx=sx+(i2-1)*sp
            for _,pt in ipairs(glp(ch,lx,0,1)) do
                pos[#pos+1]=(ocf*CFrame.new(pt.X*sc,-pt.Z*sc,0)).Position
            end
        end
        if #pos>0 then return pos end
    elseif mode=="Circle" then
        local r=size;local rings=6
        for ri=1,rings do local rr=r*ri/rings;local steps=math.max(8,mfl(pi2*rr/4))
            for si=0,steps-1 do local a=pi2*si/steps;pos[#pos+1]=center+Vector3.new(math.cos(a)*rr,0,math.sin(a)*rr) end
        end
    elseif mode=="Sphere" then
        local r=size;local rings=8
        for ri=0,rings do local phi=math.pi*ri/rings;local yr=math.cos(phi)*r;local pr=math.sin(phi)*r
            local steps=math.max(4,mfl(pi2*pr/4))
            for si=0,steps-1 do local a=pi2*si/steps;pos[#pos+1]=center+Vector3.new(math.cos(a)*pr,yr,math.sin(a)*pr) end
        end
    elseif mode=="Cube" then
        local h=size;local n=8
        for i2=0,n do local t2=i2/n*2-1;local e=h*t2
            pos[#pos+1]=center+Vector3.new(e,h,h);pos[#pos+1]=center+Vector3.new(e,-h,h)
            pos[#pos+1]=center+Vector3.new(e,h,-h);pos[#pos+1]=center+Vector3.new(e,-h,-h)
            pos[#pos+1]=center+Vector3.new(h,e,h);pos[#pos+1]=center+Vector3.new(-h,e,h)
            pos[#pos+1]=center+Vector3.new(h,e,-h);pos[#pos+1]=center+Vector3.new(-h,e,-h)
            pos[#pos+1]=center+Vector3.new(h,h,e);pos[#pos+1]=center+Vector3.new(-h,h,e)
            pos[#pos+1]=center+Vector3.new(h,-h,e);pos[#pos+1]=center+Vector3.new(-h,-h,e)
        end
    elseif mode=="Spiral" then
        local r=size;local turns=4;local height=r*2;local steps=60
        for i2=0,steps do local t2=i2/steps;local a=pi2*turns*t2;local y=height*(t2-0.5)
            pos[#pos+1]=center+Vector3.new(math.cos(a)*r,y,math.sin(a)*r)
            pos[#pos+1]=center+Vector3.new(math.cos(a+math.pi)*r,y,math.sin(a+math.pi)*r)
        end
    elseif mode=="Pyramid" then
        local r=size;local h=r*1.2;local n=8
        for i2=0,n do local t2=i2/n*2-1;local e=r*t2
            pos[#pos+1]=center+Vector3.new(e,0,r);pos[#pos+1]=center+Vector3.new(e,0,-r)
            pos[#pos+1]=center+Vector3.new(r,0,e);pos[#pos+1]=center+Vector3.new(-r,0,e)
        end
        local n2=12
        for i2=0,n2 do local t2=i2/n2;local cr2=r*(1-t2);local y=h*t2
            pos[#pos+1]=center+Vector3.new(cr2,y,cr2);pos[#pos+1]=center+Vector3.new(-cr2,y,cr2)
            pos[#pos+1]=center+Vector3.new(cr2,y,-cr2);pos[#pos+1]=center+Vector3.new(-cr2,y,-cr2)
        end
    elseif mode=="Star" then
        local r=size;local inner=r*0.38;local n=16
        for pt2=0,4 do
            local aO=math.pi*2*pt2/5-math.pi/2;local aI=aO+math.pi/5;local aN=math.pi*2*(pt2+1)/5-math.pi/2
            local ox,oz=math.cos(aO)*r,math.sin(aO)*r;local ix,iz=math.cos(aI)*inner,math.sin(aI)*inner
            local nx2,nz=math.cos(aN)*r,math.sin(aN)*r
            for s=0,n do local t2=s/n;pos[#pos+1]=center+Vector3.new(ox+(ix-ox)*t2,0,oz+(iz-oz)*t2) end
            for s=0,n do local t2=s/n;pos[#pos+1]=center+Vector3.new(ix+(nx2-ix)*t2,0,iz+(nz-iz)*t2) end
        end
    elseif mode=="Cross" then
        local r=size;local w=r*0.25;local n=12
        for i2=0,n do local t2=i2/n*2-1;local e=r*t2
            pos[#pos+1]=center+Vector3.new(e,0,-w);pos[#pos+1]=center+Vector3.new(e,0,0);pos[#pos+1]=center+Vector3.new(e,0,w)
        end
        for i2=1,n do local t2=i2/n;local e=r*t2
            pos[#pos+1]=center+Vector3.new(-w,0,e);pos[#pos+1]=center+Vector3.new(0,0,e);pos[#pos+1]=center+Vector3.new(w,0,e)
            pos[#pos+1]=center+Vector3.new(-w,0,-e);pos[#pos+1]=center+Vector3.new(0,0,-e);pos[#pos+1]=center+Vector3.new(w,0,-e)
        end
    elseif mode=="Heart" then
        local r=size;local n=48
        for i2=0,n do
            local t2=pi2*i2/n
            local x=16*math.sin(t2)^3
            local z=13*math.cos(t2)-5*math.cos(2*t2)-2*math.cos(3*t2)-math.cos(4*t2)
            pos[#pos+1]=center+Vector3.new(x*r/18,0,z*r/18)
        end
    elseif mode=="Penis" then
        -- crude geometric outline (adult pattern request)
        local r=size
        local shaftN=14
        for i2=0,shaftN do
            local t2=i2/shaftN;local y=(t2-0.15)*r*1.6
            local w=r*0.18
            pos[#pos+1]=center+Vector3.new(-w,0,y)
            pos[#pos+1]=center+Vector3.new(w,0,y)
            pos[#pos+1]=center+Vector3.new(0,0,y)
        end
        -- head
        local hn2=16;local hr=r*0.28;local hy=r*1.45
        for i2=0,hn2 do
            local a=pi2*i2/hn2
            pos[#pos+1]=center+Vector3.new(math.cos(a)*hr,0,hy+math.sin(a)*hr*0.7)
        end
        -- balls
        local br=r*0.32;local by=-r*0.15
        for i2=0,hn2 do
            local a=pi2*i2/hn2
            pos[#pos+1]=center+Vector3.new(-br*0.9+math.cos(a)*br*0.55,0,by+math.sin(a)*br*0.55)
            pos[#pos+1]=center+Vector3.new( br*0.9+math.cos(a)*br*0.55,0,by+math.sin(a)*br*0.55)
        end
    elseif mode=="Peace" or mode=="Swastika" then
        local r=size
        local arm=r
        local thick=r*0.22
        local n=10
        for i2=0,n do
            local t2=i2/n
            pos[#pos+1]=center+Vector3.new(t2*arm,0,0)
            pos[#pos+1]=center+Vector3.new(arm,0,t2*arm*0.7)
            pos[#pos+1]=center+Vector3.new(0,0,t2*arm)
            pos[#pos+1]=center+Vector3.new(-t2*arm*0.7,0,arm)
            pos[#pos+1]=center+Vector3.new(-t2*arm,0,0)
            pos[#pos+1]=center+Vector3.new(-arm,0,-t2*arm*0.7)
            pos[#pos+1]=center+Vector3.new(0,0,-t2*arm)
            pos[#pos+1]=center+Vector3.new(t2*arm*0.7,0,-arm)
        end
        for i2=0,n do
            local t2=i2/n
            pos[#pos+1]=center+Vector3.new(t2*arm,0,thick*0.5)
            pos[#pos+1]=center+Vector3.new(t2*arm,0,-thick*0.5)
            pos[#pos+1]=center+Vector3.new(thick*0.5,0,t2*arm)
            pos[#pos+1]=center+Vector3.new(-thick*0.5,0,t2*arm)
            pos[#pos+1]=center+Vector3.new(-t2*arm,0,thick*0.5)
            pos[#pos+1]=center+Vector3.new(-t2*arm,0,-thick*0.5)
            pos[#pos+1]=center+Vector3.new(thick*0.5,0,-t2*arm)
            pos[#pos+1]=center+Vector3.new(-thick*0.5,0,-t2*arm)
        end
    end
    if #pos>0 then return pos end
    return{center}
end

local function addW(c) S.watchConns[#S.watchConns+1]=c end
local function watchGen(gen)
    local dp=gen:FindFirstChild("DiamondPlate")
    if dp and dp:IsA("BasePart") and not isMyPart(dp) then S.shieldSet=S.shieldSet or {};S.shieldSet[dp]=true end
    addW(gen.ChildAdded:Connect(function(c) if c.Name=="DiamondPlate" and c:IsA("BasePart") and not isMyPart(c) then S.shieldSet=S.shieldSet or {};S.shieldSet[c]=true end end))
    addW(gen.ChildRemoved:Connect(function(c) if S.shieldSet then S.shieldSet[c]=nil end end))
end
local function watchBS(bs,ty)
    if tyProt(ty) then return end
    local gen=bs:FindFirstChild("Generator");if gen then watchGen(gen) end
    addW(bs.ChildAdded:Connect(function(c) if c.Name=="Generator" then watchGen(c) end end))
    addW(bs.ChildRemoved:Connect(function(c) if S.shieldSet then S.shieldSet[c]=nil end end))
end
local function watchPO(po,ty)
    if tyProt(ty) then return end
    local bs=po:FindFirstChild("Base Shield");if bs then watchBS(bs,ty) end
    addW(po.ChildAdded:Connect(function(c) if c.Name=="Base Shield" then watchBS(c,ty) end end))
    addW(po.DescendantRemoving:Connect(function(d) if d:IsA("BasePart") and S.shieldSet then S.shieldSet[d]=nil end end))
end
local function scanElec(ty)
    if tyProt(ty) then return end
    task.spawn(function()
        local ok,ds=pcall(function() return ty:GetDescendants() end);if not ok then return end
        for _,d in ipairs(ds) do if d.Name=="ElectricalBox" and not isMyPart(d) then
            local bp;if d:IsA("BasePart") then bp=d
            elseif d:IsA("Model") then
                bp=d.PrimaryPart
                if not bp then local bm=0;for _,p in ipairs(d:GetChildren()) do if p:IsA("BasePart") then local m=p.Size.Magnitude;if m>bm then bp,bm=p,m end end end end
            else bp=d:FindFirstChildWhichIsA("BasePart",true) end
            if bp and d.Parent and d.Parent.Parent then
                if d.Parent.Parent.Name=="PurchasedObjects" or d.Parent.Name=="PurchasedObjects" then
                    S.elecSet=S.elecSet or {};S.elecSet[bp]=true
                end
            end
        end end
    end)
end
local function attachW(ty)
    if tyProt(ty) then return end
    S.shieldSet=S.shieldSet or {};S.elecSet=S.elecSet or {}
    local po=ty:FindFirstChild("PurchasedObjects");if po then watchPO(po,ty) end
    addW(ty.ChildAdded:Connect(function(c) if c.Name=="PurchasedObjects" then watchPO(c,ty) end end))
    scanElec(ty)
end
S.shieldSet={};S.elecSet={}
task.spawn(function()
    task.wait(4)
    local tf=workspace:FindFirstChild("Tycoon");local ts=tf and tf:FindFirstChild("Tycoons");if not ts then return end
    for _,ty in ipairs(ts:GetChildren()) do attachW(ty) end
    addW(ts.ChildAdded:Connect(function(ty) task.wait(.5);attachW(ty) end))
    task.wait(4);for _,ty in ipairs(ts:GetChildren()) do scanElec(ty) end
    while not S.dead do task.wait(30)
        local tf2=workspace:FindFirstChild("Tycoon");local ts2=tf2 and tf2:FindFirstChild("Tycoons")
        if ts2 then for _,ty in ipairs(ts2:GetChildren()) do scanElec(ty) end end
    end
end)

local function getTargets()
    local tgts={};if not hrp or not hrp.Parent then return tgts end
    local mp=hrp.Position
    if S.tgtTypes.Players then
        for _,p in pairs(Players:GetPlayers()) do if p~=plr then
            local ign=isIgnored(p)
            -- focus mode: only hit focused players (and never ignored)
            if S.focusMode then
                local any=false;for _ in pairs(S.focusTargets) do any=true;break end
                if any and not S.focusTargets[p.Name] then continue end
            end
            if not ign then
                local c=p.Character;if not c then continue end
                local tH=c:FindFirstChild("HumanoidRootPart");local h2=c:FindFirstChildOfClass("Humanoid")
                if tH and h2 and h2.Health>0 then local d=(tH.Position-mp).Magnitude
                    if d<=S.maxDist and d>=15 then
                        tgts[#tgts+1]={hrp=tH,d=d,pos=tH.Position+Vector3.new(0,2.5,0),player=p}
                    end
                end
            end
        end end
    end
    if S.tgtTypes.Vehicles then
        local gs=workspace:FindFirstChild("Game Systems");if gs then
            for _,wn in ipairs(VWS) do local f=gs:FindFirstChild(wn);if not f then continue end
                for _,veh in pairs(f:GetChildren()) do
                    local own=veh:FindFirstChild("Owner")
                    if own and own.Value==plr.Name then continue end
                    if own and own.Value and S.wlist[own.Value] then continue end  
                    if vehHasWL(veh) then continue end
                    local vR=findVRoot(veh);if vR then local d=(vR.Position-mp).Magnitude
                        if d<=S.maxDist and d>=15 then tgts[#tgts+1]={hrp=vR,d=d,pos=vR.Position} end
                    end
                end
            end
        end
    end
    if S.tgtTypes.BaseShields and S.shieldSet then
        local dead={}
        for part in pairs(S.shieldSet) do if not part.Parent then dead[#dead+1]=part end end
        for _,p in ipairs(dead) do S.shieldSet[p]=nil end
        for part in pairs(S.shieldSet) do
            if isMyPart(part) then continue end
            local d=(part.Position-mp).Magnitude
            if d<=S.maxDist and d>=15 then tgts[#tgts+1]={hrp=part,d=d,pos=part.Position} end
        end
    end
    if S.tgtTypes.ElectricalBoxes and S.elecSet then
        local dead={}
        for bp in pairs(S.elecSet) do if not bp.Parent then dead[#dead+1]=bp end end
        for _,p in ipairs(dead) do S.elecSet[p]=nil end
        for bp in pairs(S.elecSet) do
            if isMyPart(bp) then continue end
            local d=(bp.Position-mp).Magnitude
            if d<=S.maxDist and d>=15 then tgts[#tgts+1]={hrp=bp,d=d,pos=bp.Position} end
        end
    end
    if #tgts>1 then table.sort(tgts,function(a,b) return a.d<b.d end) end
    return tgts
end

local espTick=0;local pivTime=0;local pivCache={}
local function eCache(p)
    local c=p.Character;if not c then S.espCache[p]=nil;return nil end
    local ca=S.espCache[p];if ca and ca.char==c then return ca end
    local h=c:FindFirstChild("HumanoidRootPart");if not h then S.espCache[p]=nil;return nil end
    local hm=c:FindFirstChildOfClass("Humanoid");if not hm then S.espCache[p]=nil;return nil end
    local d={char=c,hrp=h,hum=hm,head=c:FindFirstChild("Head")};S.espCache[p]=d;return d
end

local factionTagCache={}  
local factionIdCache={}   
local factionIdTime=0

local function getFactionIds()
    local now=tick()
    if now-factionIdTime<10 then return factionIdCache end
    factionIdCache={}
    pcall(function()
        local fd=RepS:FindFirstChild("FactionSysRS")
        if not fd then return end
        local fdata=fd:FindFirstChild("FactionData")
        if not fdata then return end
        for _,faction in pairs(fdata:GetChildren()) do
            local bfd=faction:FindFirstChild("BasicFactionData")
            if not bfd then continue end
            local tag=bfd:FindFirstChild("FactionTag")
            local fname=bfd:FindFirstChild("FactionName")
            factionIdCache[faction.Name]={
                tag=tag and tag.Value or faction.Name,
                name=fname and fname.Value or faction.Name
            }
        end
    end)
    factionIdTime=now
    return factionIdCache
end

local function getPlayerFaction(p)
    local fid=nil
    pcall(function()
        local pfd=p:FindFirstChild("PersonalFactionData")
        if not pfd and p.Character then
            pfd=p.Character:FindFirstChild("PersonalFactionData")
        end
        if not pfd then
            pfd=p:FindFirstChildWhichIsA("Folder",true)
            if pfd and pfd.Name~="PersonalFactionData" then pfd=nil end
        end
        if not pfd then return end
        local pf=pfd:FindFirstChild("PersonalFaction")
        if pf then fid=tostring(pf.Value) end
    end)
    if not fid or fid=="" or fid=="0" then return nil end
    local ids=getFactionIds()
    return ids[fid]
end

local function mkD(t,col,th,tr)
    local ok,d=pcall(function() return Drawing.new(t) end)
    if not ok or not d then return nil end
    pcall(function()
        d.Visible=false;d.Color=col or Color3.new(1,1,1)
        if th then d.Thickness=th end
        if tr then d.Transparency=tr end
        if t=="Square" then d.Filled=false end
        if t=="Text" then d.Size=15;d.Outline=true;d.OutlineColor=Color3.new(0,0,0);d.Center=true;pcall(function() d.Font=Drawing and Drawing.Fonts and Drawing.Fonts.UI or 1 end) end
    end)
    return d
end

local function newEB(p)
    local c=Color3.fromRGB(120,140,255)
    local br={}
    for _=1,8 do br[_]=mkD("Line",c,1.8) end
    local sk={}
    for _=1,18 do sk[_]=mkD("Line",c,2.6,0) end
    local hd=mkD("Circle",c,1.5)
    if hd then pcall(function() hd.Filled=true;hd.NumSides=16;hd.Radius=3 end) end
    -- Avatar BillboardGui (profile pic above head)
    local avBill,avImg
    pcall(function()
        avBill=Instance.new("BillboardGui")
        avBill.Name="CH_Avatar"
        avBill.Size=UDim2.new(0,28,0,28)
        avBill.StudsOffset=Vector3.new(0,3.2,0)
        avBill.AlwaysOnTop=true
        avBill.MaxDistance=800
        avImg=Instance.new("ImageLabel")
        avImg.Size=UDim2.new(1,0,1,0)
        avImg.BackgroundColor3=Color3.fromRGB(20,20,28)
        avImg.BackgroundTransparency=0.2
        avImg.BorderSizePixel=0
        avImg.Image=getAvatarThumb(p.UserId,48)
        avImg.Parent=avBill
        local uc=Instance.new("UICorner");uc.CornerRadius=UDim.new(1,0);uc.Parent=avImg
        local st=Instance.new("UIStroke");st.Color=c;st.Thickness=1.2;st.Parent=avImg
    end)
    return{
        br=br,sk=sk,hd=hd,avBill=avBill,avImg=avImg,
        hbg=mkD("Square",Color3.fromRGB(10,10,15)),
        hbf=mkD("Square",Color3.fromRGB(80,220,100)),
        nt=mkD("Text",Color3.fromRGB(255,255,255)),
        dt=(function() local d=mkD("Text",Color3.fromRGB(200,205,220)) if d then pcall(function() d.Size=13;d.Center=false;d.Outline=true end) end;return d end)(),
        wt=(function() local d=mkD("Text",Color3.fromRGB(255,200,60)) if d then pcall(function() d.Size=11 end) end;return d end)(),
        ft=(function() local d=mkD("Text",Color3.fromRGB(180,220,255)) if d then pcall(function() d.Size=10;d.Center=true end) end;return d end)(),
        tr=mkD("Line",c,1,0.55),
        player=p
    }
end

local function newVEB()
    local c=Color3.fromRGB(255,190,40)
    local br={}
    for _=1,8 do br[_]=mkD("Line",c,1.8) end
    return{
        br=br,
        nt=mkD("Text",Color3.fromRGB(255,255,255)),
        dt=(function() local d=mkD("Text",Color3.fromRGB(165,170,195)) if d then pcall(function() d.Size=11;d.Center=false end) end;return d end)(),
        tr=mkD("Line",c,1,0.55)
    }
end

local function setVis(d,v)
    if d then pcall(function() d.Visible=v end) end
end

local function hideEB(d)
    if not d then return end
    for _,l in ipairs(d.br or {}) do setVis(l,false) end
    for _,l in ipairs(d.sk or {}) do setVis(l,false) end
    setVis(d.hd,false)
    setVis(d.hbg,false);setVis(d.hbf,false)
    setVis(d.nt,false);setVis(d.dt,false);setVis(d.wt,false);setVis(d.ft,false);setVis(d.tr,false)
    if d.avBill then pcall(function() d.avBill.Enabled=false end) end
end

local SKELETON_PAIRS={
    {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
}
-- R6 fallback pairs
local SKELETON_R6={
    {"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"},
}

local function hideVEB(d)
    if not d then return end
    for _,l in ipairs(d.br or {}) do setVis(l,false) end
    setVis(d.nt,false);setVis(d.dt,false);setVis(d.tr,false)
end

local function drawBR(br,bx,by,brx,bby,col,vis)
    local cx=mmax((brx-bx)*0.22,5)
    local cy=mmax((bby-by)*0.22,5)
    local pts={
        {Vector2.new(bx,by),    Vector2.new(bx+cx,by)},
        {Vector2.new(bx,by),    Vector2.new(bx,by+cy)},
        {Vector2.new(brx,by),   Vector2.new(brx-cx,by)},
        {Vector2.new(brx,by),   Vector2.new(brx,by+cy)},
        {Vector2.new(bx,bby),   Vector2.new(bx+cx,bby)},
        {Vector2.new(bx,bby),   Vector2.new(bx,bby-cy)},
        {Vector2.new(brx,bby),  Vector2.new(brx-cx,bby)},
        {Vector2.new(brx,bby),  Vector2.new(brx,bby-cy)},
    }
    local tr=S.espVisAlpha or 0
    for i,l in ipairs(br) do
        if l and pts[i] then pcall(function()
            l.From=pts[i][1];l.To=pts[i][2];l.Color=col;l.Transparency=tr;l.Visible=vis
        end) end
    end
end

local function updateESP()
    if not hrp or not hrp.Parent then return end
    local n=0;for _ in pairs(S.espBoxes) do n=n+1 end
    local rate=n<=4 and 1/55 or n<=8 and 1/40 or 1/28
    local now=tick();if now-espTick<rate then return end;espTick=now
    local lc=cam;local vp=lc.ViewportSize
    local vcx,vby=vp.X*.5,vp.Y
    local cf=lc.CFrame;local cp=cf.Position;local fw=cf.LookVector;local mp=hrp.Position

    if not S.espOn then
        for _,d in pairs(S.espBoxes) do hideEB(d) end
        if not S.vehEspOn then
            for _,d in pairs(S.vehESP) do hideVEB(d) end
            return
        end
    end

    if now-pivTime>=.5 then pivCache=pivMap();pivTime=now end

    if S.espOn then
    for _,d in pairs(S.espBoxes) do
        local p=d.player;if not p or not p.Parent then continue end
        if not isFocusTarget(p) then hideEB(d);continue end
        -- keep ESP while seated (was: hide when pivCache[p])
        local ca=eCache(p);if not ca then hideEB(d);continue end
        local tH=ca.hrp;local th=ca.hum
        if th.Health<=0 or (tH.Position-cp):Dot(fw)<-8 then hideEB(d);continue end
        local vec,on=lc:WorldToViewportPoint(tH.Position)
        if not on then hideEB(d);continue end
        local tv=lc:WorldToViewportPoint(ca.head and ca.head.Position or tH.Position+Vector3.new(0,2,0))
        local bv=lc:WorldToViewportPoint(tH.Position-Vector3.new(0,3,0))
        local h=mab(tv.Y-bv.Y);if h<5 then h=5 end
        local w=h*.48
        local bx=vec.X-w*.5;local by=tv.Y;local brx=bx+w;local bby=bv.Y
        local ec=isIgnored(p) and Color3.fromRGB(80,220,100) or (S.espBoxCol or Color3.fromRGB(120,140,255))

        drawBR(d.br,bx,by,brx,bby,ec,S.espLines)

        local maxHp=th.MaxHealth or 100;if maxHp<=0 then maxHp=100 end
        local hp2=mcl((th.Health or 0)/maxHp,0,1)
        if d.hbg then pcall(function()
            d.hbg.Size=Vector2.new(3,h);d.hbg.Position=Vector2.new(bx-5,by);d.hbg.Visible=S.espHealth
        end) end
        if d.hbf then pcall(function()
            d.hbf.Size=Vector2.new(3,h*hp2);d.hbf.Position=Vector2.new(bx-5,by+h*(1-hp2))
            d.hbf.Color=Color3.fromRGB(mfl(mcl(255*(1-hp2)*2,0,255)),mfl(mcl(255*hp2*1.5,0,255)),40)
            d.hbf.Visible=S.espHealth
        end) end

        if d.nt then pcall(function()
            if S.streamerMode then
                d.nt.Text="Player"
            else
                d.nt.Text=d.player.DisplayName or d.player.Name
            end
            d.nt.Color=Color3.fromRGB(255,255,255)
            local nY=S.espFaction and (by-15) or (by-15)
            d.nt.Position=Vector2.new(vec.X,nY);d.nt.Visible=S.espNames and not S.streamerMode
        end) end

        if d.dt then pcall(function()
            d.dt.Text=mfl((tH.Position-mp).Magnitude).."m"
            d.dt.Position=Vector2.new(brx+4,by+h*.5-6);d.dt.Visible=S.espDist
        end) end

        local wpn=ca.char:FindFirstChildOfClass("Tool")
        if d.wt then pcall(function()
            if wpn then d.wt.Text=wpn.Name;d.wt.Position=Vector2.new(vec.X,bby+3);d.wt.Visible=true
            else d.wt.Visible=false end
        end) end

        if d.ft then pcall(function()
            if S.espFaction then
                local finfo=getPlayerFaction(p)
                if finfo then
                    local ftxt=S.espFactionMode=="tag" and "["..finfo.tag.."]" or finfo.name
                    d.ft.Text=ftxt
                    local fY=S.espNames and (by-28) or (by-15)
                    d.ft.Position=Vector2.new(vec.X,fY);d.ft.Visible=true
                else d.ft.Visible=false end
            else d.ft.Visible=false end
        end) end

        if d.tr then pcall(function()
            d.tr.Color=S.espTracerCol or ec;d.tr.From=Vector2.new(vcx,vby);d.tr.To=Vector2.new(vec.X,bby);d.tr.Visible=S.espTracers
        end) end

        -- Head dot
        if d.hd then pcall(function()
            if S.espHeadDot and ca.head then
                local hv,hon=lc:WorldToViewportPoint(ca.head.Position)
                if hon then
                    d.hd.Position=Vector2.new(hv.X,hv.Y)
                    d.hd.Color=ec
                    d.hd.Radius=mcl(h*0.08,2,6)
                    d.hd.Visible=true
                else d.hd.Visible=false end
            else d.hd.Visible=false end
        end) end

        -- Avatar profile pic
        if d.avBill then pcall(function()
            if S.espAvatar and S.espOn and ca.head then
                if d.avBill.Parent~=ca.head then d.avBill.Adornee=ca.head;d.avBill.Parent=ca.head end
                d.avBill.Enabled=true
                if d.avImg then
                    local st=d.avImg:FindFirstChildOfClass("UIStroke")
                    if st then st.Color=ec end
                end
            else
                d.avBill.Enabled=false
            end
        end) end

        -- Skeleton ESP (recursive part lookup; works seated / R6 / R15)
        if d.sk then
            if S.espSkeleton and ca.char then
                local function findPart(name)
                    local p2=ca.char:FindFirstChild(name)
                    if p2 and p2:IsA("BasePart") then return p2 end
                    for _,d2 in ipairs(ca.char:GetDescendants()) do
                        if d2.Name==name and d2:IsA("BasePart") then return d2 end
                    end
                    return nil
                end
                local pairs=SKELETON_PAIRS
                if not findPart("UpperTorso") then pairs=SKELETON_R6 end
                local skCol=S.espSkeletonCol or ec
                for i,pair in ipairs(pairs) do
                    local line=d.sk[i]
                    if line then
                        local a=findPart(pair[1])
                        local b=findPart(pair[2])
                        if a and b then
                            local pa,ona=lc:WorldToViewportPoint(a.Position)
                            local pb,onb=lc:WorldToViewportPoint(b.Position)
                            if ona and onb and pa.Z>0 and pb.Z>0 then
                                pcall(function()
                                    line.From=Vector2.new(pa.X,pa.Y)
                                    line.To=Vector2.new(pb.X,pb.Y)
                                    line.Color=skCol
                                    line.Thickness=2.8
                                    line.Transparency=S.espVisAlpha or 0
                                    line.Visible=true
                                end)
                            else setVis(line,false) end
                        else setVis(line,false) end
                    end
                end
                for i=#pairs+1,#(d.sk) do setVis(d.sk[i],false) end
            else
                for _,l in ipairs(d.sk) do setVis(l,false) end
            end
        end
    end

    end -- end if S.espOn player boxes

    local active={}
    if not S.vehEspOn then
        for v,d in pairs(S.vehESP) do
            hideVEB(d)
            pcall(function()
                for _,l in ipairs(d.br or {}) do if l then l:Remove() end end
                if d.nt then d.nt:Remove() end;if d.dt then d.dt:Remove() end;if d.tr then d.tr:Remove() end
            end);S.vehESP[v]=nil
        end
        return
    end
    local gs=workspace:FindFirstChild("Game Systems")
    if gs then
        for _,wn in ipairs(VWS) do
            local f=gs:FindFirstChild(wn);if not f then continue end
            for _,veh in pairs(f:GetChildren()) do
                local own=veh:FindFirstChild("Owner")
                local occupants={}
                for pp,v2 in pairs(pivCache) do
                    if v2==veh then occupants[#occupants+1]=pp end
                end
                local hasEnemy=false
                local nameList={}
                for _,pp in ipairs(occupants) do
                    if pp~=plr and not isIgnored(pp) then
                        hasEnemy=true
                        local fi=S.espFaction and getPlayerFaction(pp)
                        local tag=fi and (S.espFactionMode=="tag" and "["..fi.tag.."]" or fi.name) or nil
                        nameList[#nameList+1]=pp.Name..(tag and " "..tag or "")
                    end
                end
                if not hasEnemy and #occupants==0 then
                    if not own or not own.Value or own.Value=="" then
                        hasEnemy=true;nameList[#nameList+1]="Unowned"
                    elseif own.Value~=plr.Name and not S.wlist[own.Value] and not isIgnoredName(own.Value) then
                        hasEnemy=true;nameList[#nameList+1]=own.Value
                    end
                end
                if not hasEnemy then continue end
                local vR=findVRoot(veh);if not vR then continue end
                if (vR.Position-cp):Dot(fw)<-8 then hideVEB(S.vehESP[veh]);continue end
                active[veh]=true
                local vec,on=lc:WorldToViewportPoint(vR.Position)
                if not on then hideVEB(S.vehESP[veh]);continue end
                if not S.vehESP[veh] then S.vehESP[veh]=newVEB() end
                local d=S.vehESP[veh]
                local sz=veh:GetExtentsSize()
                local tv2=lc:WorldToViewportPoint(vR.Position+Vector3.new(0,sz.Y*.5,0))
                local bv2=lc:WorldToViewportPoint(vR.Position-Vector3.new(0,sz.Y*.5,0))
                local h=mab(tv2.Y-bv2.Y);if h<5 then h=5 end
                local w=h*.7
                local bx=vec.X-w*.5;local by=tv2.Y;local brx=bx+w;local bby=bv2.Y
                local vc=Color3.fromRGB(255,190,40)
                drawBR(d.br,bx,by,brx,bby,vc,S.espLines)
                if d.nt then pcall(function()
                    local label=veh.Name
                    if #nameList>0 then label=label.." ("..table.concat(nameList,", ")..")" end
                    d.nt.Text=label
                    d.nt.Position=Vector2.new(vec.X,by-15);d.nt.Visible=S.espNames
                end) end
                if d.dt then pcall(function()
                    d.dt.Text=mfl((vR.Position-mp).Magnitude).."m"
                    d.dt.Position=Vector2.new(brx+4,by+h*.5-6);d.dt.Visible=S.espDist
                end) end
                if d.tr then pcall(function()
                    d.tr.Color=vc;d.tr.From=Vector2.new(vcx,vby);d.tr.To=Vector2.new(vec.X,bby);d.tr.Visible=S.espTracers
                end) end
            end
        end
    end
    for v,d in pairs(S.vehESP) do
        if not active[v] or not v.Parent then
            hideVEB(d)
            pcall(function()
                for _,l in ipairs(d.br) do if l then l:Remove() end end
                if d.nt then d.nt:Remove() end;if d.dt then d.dt:Remove() end;if d.tr then d.tr:Remove() end
            end);S.vehESP[v]=nil
        end
    end
end

local function _ui()
for _,p in pairs(Players:GetPlayers()) do if p~=plr then S.espBoxes[p]=newEB(p) end end
Players.PlayerAdded:Connect(function(p) if p~=plr then S.espBoxes[p]=newEB(p) end end)
Players.PlayerRemoving:Connect(function(p)
    local d=S.espBoxes[p];if d then hideEB(d);pcall(function()
        for _,l in ipairs(d.br or {}) do if l then l:Remove() end end
        for _,k in ipairs({"hbg","hbf","nt","dt","wt","ft","tr"}) do if d[k] then d[k]:Remove() end end
    end);S.espBoxes[p]=nil end
    S.espCache[p]=nil
end)

local function applyNC(en)
    if en then if not S.ncConn then S.ncOrig={}
        if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then S.ncOrig[p]=p.CanCollide end end end
        S.ncConn=RS.Stepped:Connect(function() if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end)
    end
    else if S.ncConn then S.ncConn:Disconnect();S.ncConn=nil;for p,o in pairs(S.ncOrig) do if p and p.Parent then p.CanCollide=o end end;S.ncOrig={} end end
end
local function startFly()
    if S.flying or not hrp or not hrp.Parent then return end;S.flying=true
    S.flyBV=Instance.new("BodyVelocity");S.flyBV.MaxForce=Vector3.new(1e9,1e9,1e9);S.flyBV.Velocity=Vector3.zero;S.flyBV.Parent=hrp
    S.flyBG=Instance.new("BodyGyro");S.flyBG.MaxTorque=Vector3.new(1e9,1e9,1e9);S.flyBG.P=9e4;S.flyBG.CFrame=hrp.CFrame;S.flyBG.Parent=hrp
    if hum and not hum.SeatPart then hum.PlatformStand=true end
    if not S.ncOn then applyNC(true) end
end
local function stopFly()
    S.flying=false;if S.flyBV then S.flyBV:Destroy();S.flyBV=nil end;if S.flyBG then S.flyBG:Destroy();S.flyBG=nil end
    if hum and hum.Parent and not hum.SeatPart then hum.PlatformStand=false end
    if not S.ncOn then applyNC(false) end
end
local function applySpd()
    if S.spLkConn then S.spLkConn:Disconnect();S.spLkConn=nil end
    if S.spHkOn then if hum then hum.WalkSpeed=S.spHkV end
        S.spLkConn=RS.Stepped:Connect(function() if hum and hum.Parent and hum.WalkSpeed~=S.spHkV then hum.WalkSpeed=S.spHkV end end)
    else if hum then hum.WalkSpeed=16 end end
end
local function applyJmp()
    if S.jpLkConn then S.jpLkConn:Disconnect();S.jpLkConn=nil end
    local function setJump(h,val)
        if not h then return end
        pcall(function()
            -- modern humanoids use JumpHeight; older use JumpPower
            if h.UseJumpPower ~= nil then
                h.UseJumpPower=true
            end
            h.JumpPower=val
            -- approximate JumpHeight from JumpPower (g≈196.2)
            local jh=math.clamp((val*val)/(2*196.2), 0, 500)
            pcall(function() h.JumpHeight=jh end)
        end)
    end
    if S.jpHkOn then
        setJump(hum,S.jpHkV)
        S.jpLkConn=RS.Stepped:Connect(function()
            if hum and hum.Parent then
                if hum.JumpPower~=S.jpHkV then setJump(hum,S.jpHkV) end
            end
        end)
    else
        setJump(hum,50)
    end
end
local function applyInfJ(en)
    if en then if not S.infJConn then S.infJConn=UIS.JumpRequest:Connect(function() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end) end
    else if S.infJConn then S.infJConn:Disconnect();S.infJConn=nil end end
end
local function applyGrav(en) workspace.Gravity=en and S.gravV*S.gravMul or S.gravV end
local function applyChams(en)
    if en then if not S.chamsHL and char then
        S.chamsHL=Instance.new("Highlight");S.chamsHL.FillColor=T.ac;S.chamsHL.OutlineColor=Color3.fromRGB(255,255,255)
        S.chamsHL.FillTransparency=.5;S.chamsHL.OutlineTransparency=0;S.chamsHL.Parent=char end
    else if S.chamsHL then S.chamsHL:Destroy();S.chamsHL=nil end end
end
local function applyBright(en)
    if en then Li.Ambient=Color3.fromRGB(255,255,255);Li.OutdoorAmbient=Color3.fromRGB(255,255,255);Li.Brightness=2;Li.FogEnd=1e5;Li.FogStart=0;Li.GlobalShadows=false
        for _,o in pairs(Li:GetChildren()) do if o:IsA("Atmosphere") then if not S.origAtm[o] then S.origAtm[o]={Density=o.Density,Haze=o.Haze} end;o.Density=0;o.Haze=0 end end
    else Li.Ambient=S.origLi.Ambient;Li.OutdoorAmbient=S.origLi.OutdoorAmbient;Li.Brightness=S.origLi.Brightness;Li.GlobalShadows=S.origLi.GlobalShadows
        if not S.fogOn then Li.FogEnd=S.origLi.FogEnd;Li.FogStart=S.origLi.FogStart;for o,orig in pairs(S.origAtm) do if o and o.Parent then o.Density=orig.Density;o.Haze=orig.Haze end end;S.origAtm={} end
    end
end
local function ensureAtmosphere()
    local a = Li:FindFirstChildOfClass("Atmosphere")
    if not a then
        a = Instance.new("Atmosphere")
        a.Parent = Li
        a.Density = 0.3
        a.Haze = 0
        a.Color = Color3.fromRGB(199, 199, 199)
        a.Decay = Color3.fromRGB(92, 92, 92)
        a.Glare = 0
        a.Offset = 0
    end
    return a
end

local function applyHaze(density, haze, color)
    local a = ensureAtmosphere()
    if density ~= nil then a.Density = density end
    if haze ~= nil then a.Haze = haze end
    if color ~= nil then a.Color = color end
    return a
end

local function applyFog(en)
    if en then Li.FogEnd=1e5;Li.FogStart=0
        for _,src in ipairs({Li:GetChildren(),workspace.Terrain:GetChildren()}) do for _,o in ipairs(src) do if o:IsA("Atmosphere") then if not S.origAtm[o] then S.origAtm[o]={Density=o.Density,Haze=o.Haze} end;o.Density=0;o.Haze=0 end end end
    else if not S.brightOn then Li.FogEnd=S.origLi.FogEnd;Li.FogStart=S.origLi.FogStart;for o,orig in pairs(S.origAtm) do if o and o.Parent then o.Density=orig.Density;o.Haze=orig.Haze end end;S.origAtm={} end end
end
local function applyXR(en)
    if en then for _,p in pairs(workspace:GetDescendants()) do if p:IsA("BasePart") and p.Transparency==0 and not p:IsDescendantOf(char) then S.xrayParts[#S.xrayParts+1]=p;p.Transparency=.7 end end
    else for _,p in ipairs(S.xrayParts) do if p and p.Parent then p.Transparency=0 end end;S.xrayParts={} end
end
local function applySpin(en)
    if en then if not hrp or not hrp.Parent then return end
        if S.spinBAV then S.spinBAV:Destroy();S.spinBAV=nil end
        if hum and hum.Parent then S.spinAR=hum.AutoRotate;hum.AutoRotate=false end
        S.spinBAV=Instance.new("BodyAngularVelocity");S.spinBAV.AngularVelocity=Vector3.new(0,mrad(S.spinSpd),0)
        S.spinBAV.MaxTorque=Vector3.new(0,1e9,0);S.spinBAV.P=1e9;S.spinBAV.Parent=hrp
    else if S.spinBAV then S.spinBAV:Destroy();S.spinBAV=nil end;if hum and hum.Parent then hum.AutoRotate=S.spinAR end end
end

local function applyHitbox(en)
    if en then
        S.hitboxOrig={}
        S.hitboxConn=RS.Heartbeat:Connect(function()
            if not S.hitboxOn then return end
            for _,p in pairs(Players:GetPlayers()) do
                if p==plr or isIgnored(p) then continue end
                local c=p.Character;if not c then continue end
                local r2=c:FindFirstChild("HumanoidRootPart");if not r2 then continue end
                if not S.hitboxOrig[p] then S.hitboxOrig[p]={part=r2,size=r2.Size,trans=r2.Transparency,canc=r2.CanCollide} end
                local sz=S.hitboxSize
                if r2.Size.X~=sz then r2.Size=Vector3.new(sz,sz,sz) end
                r2.Transparency=1 -- invisible expander
                r2.CanCollide=false
                r2.Material=Enum.Material.ForceField
            end
        end)
    else
        if S.hitboxConn then S.hitboxConn:Disconnect();S.hitboxConn=nil end
        for _,orig in pairs(S.hitboxOrig) do
            if orig.part and orig.part.Parent then
                pcall(function()
                    orig.part.Size=orig.size
                    orig.part.Transparency=orig.trans
                    orig.part.CanCollide=orig.canc
                    orig.part.Material=Enum.Material.Plastic
                end)
            end
        end;S.hitboxOrig={}
    end
end

local function applyHitboxVis(en)
    if en then
        if S.hitboxVisConn then return end
        local folder=Instance.new("Folder");folder.Name="CHHitboxVis";folder.Parent=workspace
        local function refreshBoxes()
            for p,box in pairs(S.hitboxVisBoxes) do
                if not p.Parent then pcall(function() box:Destroy() end);S.hitboxVisBoxes[p]=nil end
            end
            for _,p in pairs(Players:GetPlayers()) do
                if p==plr or isIgnored(p) then continue end
                if S.hitboxVisBoxes[p] then continue end
                local c=p.Character;if not c then continue end
                local target
                if S.hitboxVisPart=="Head" then
                    target=c:FindFirstChild("Head")
                elseif S.hitboxVisPart=="Body" then
                    target=c:FindFirstChild("HumanoidRootPart")
                else
                    target=c:FindFirstChild("HumanoidRootPart")
                end
                if not target then continue end
                local box=Instance.new("SelectionBox")
                box.Adornee=target
                box.Color3=Color3.fromRGB(99,102,241)
                box.LineThickness=0.04
                box.SurfaceTransparency=0.75
                box.SurfaceColor3=Color3.fromRGB(99,102,241)
                box.Parent=folder
                S.hitboxVisBoxes[p]=box
            end
        end
        refreshBoxes()
        S.hitboxVisConn=RS.Heartbeat:Connect(function()
            refreshBoxes()
            for p,box in pairs(S.hitboxVisBoxes) do
                if not p.Parent then continue end
                local c=p.Character;if not c then box.Adornee=nil;continue end
                local target
                if S.hitboxVisPart=="Head" then target=c:FindFirstChild("Head")
                else target=c:FindFirstChild("HumanoidRootPart") end
                box.Adornee=target
            end
        end)
        S.hitboxVisFolder=folder
    else
        if S.hitboxVisConn then S.hitboxVisConn:Disconnect();S.hitboxVisConn=nil end
        for _,box in pairs(S.hitboxVisBoxes) do pcall(function() box:Destroy() end) end
        S.hitboxVisBoxes={}
        if S.hitboxVisFolder then pcall(function() S.hitboxVisFolder:Destroy() end);S.hitboxVisFolder=nil end
    end
end

local function applyAntiAfk(en)
    if en then
        if S.antiAfkConn then return end
        S.antiAfkConn=RS.Heartbeat:Connect(function()
            UIS:SetStringAttribute("JumpInput","")
        end)
        pcall(function()
            local vu=game:GetService("VirtualUser")
            if not S.antiAfkConn2 then
                S.antiAfkConn2=plr.Idled:Connect(function() vu:CaptureController();vu:ClickButton2(Vector2.new()) end)
            end
        end)
    else
        if S.antiAfkConn then S.antiAfkConn:Disconnect();S.antiAfkConn=nil end
        if S.antiAfkConn2 then S.antiAfkConn2:Disconnect();S.antiAfkConn2=nil end
    end
end

local function applyOrbit(en)
    if en then
        if S.orbitConn then S.orbitConn:Disconnect();S.orbitConn=nil end
        if not S.orbitBV then
            S.orbitBV=Instance.new("BodyVelocity")
            S.orbitBV.MaxForce=Vector3.new(1e9,1e9,1e9)
            S.orbitBV.Velocity=Vector3.zero
            S.orbitBV.Parent=hrp
        end
        if not S.orbitBG then
            S.orbitBG=Instance.new("BodyGyro")
            S.orbitBG.MaxTorque=Vector3.new(1e9,1e9,1e9)
            S.orbitBG.P=9e4
            S.orbitBG.CFrame=hrp.CFrame
            S.orbitBG.Parent=hrp
        end
        if hum and hum.Parent then hum.PlatformStand=true end
        S.orbitAngle=0
        S.orbitConn=RS.RenderStepped:Connect(function(dt)
            if S.dead or not hrp or not hrp.Parent then return end
            local best,bestD=nil,math.huge
            for _,p in pairs(Players:GetPlayers()) do
                if p==plr or isIgnored(p) then continue end
                local c=p.Character;if not c then continue end
                local r2=c:FindFirstChild("HumanoidRootPart");if not r2 then continue end
                local d=(r2.Position-hrp.Position).Magnitude
                if d<bestD then bestD=d;best=r2 end
            end
            S.orbitTarget=best
            if not best or not best.Parent then
                if S.orbitBV then S.orbitBV.Velocity=Vector3.zero end;return
            end
            S.orbitAngle=S.orbitAngle+dt*S.orbitSpeed*math.pi*2
            local r=S.orbitRadius
            local tx=best.Position.X+math.cos(S.orbitAngle)*r
            local tz=best.Position.Z+math.sin(S.orbitAngle)*r
            local ty=best.Position.Y+2
            local target=Vector3.new(tx,ty,tz)
            local diff=target-hrp.Position
            local spd=mcl(diff.Magnitude*8,0,120)
            if S.orbitBV then S.orbitBV.Velocity=diff.Magnitude>0.5 and diff.Unit*spd or Vector3.zero end
            if S.orbitBG then
                S.orbitBG.CFrame=CFrame.lookAt(hrp.Position,Vector3.new(best.Position.X,hrp.Position.Y,best.Position.Z))
            end
        end)
    else
        if S.orbitConn then S.orbitConn:Disconnect();S.orbitConn=nil end
        if S.orbitBV then S.orbitBV:Destroy();S.orbitBV=nil end
        if S.orbitBG then S.orbitBG:Destroy();S.orbitBG=nil end
        S.orbitTarget=nil
        if hum and hum.Parent and not S.flying then hum.PlatformStand=false end
    end
end

local function getCharRoot(p)
    local c = p.Character or workspace:FindFirstChild(p.Name)
    if c then
        local r = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
        if r then return r end
        local anyPart = c:FindFirstChildWhichIsA("BasePart")
        if anyPart then return anyPart end
    end
    for _,obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and Players:GetPlayerFromCharacter(obj)==p then
            return obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
        end
    end
    return nil
end

local bringLoops={}
local function getBringCF() if not hrp or not hrp.Parent then return nil end;return hrp.CFrame*CFrame.new(0,0,-(S.bringDist or 3)) end
local function pinChar(e,tH)
    if e.rsConn then e.rsConn:Disconnect();e.rsConn=nil end;e.currentTH=tH
    e.rsConn=RS.RenderStepped:Connect(function()
        if not e.active then e.rsConn:Disconnect();e.rsConn=nil;return end
        local t=e.currentTH;if not t or not t.Parent then return end
        local cf=getBringCF();if not cf then return end;t.CFrame=cf
    end)
end
local function stopBring(p) local e=bringLoops[p];if not e then return end;e.active=false;if e.charConn then e.charConn:Disconnect() end;if e.rsConn then e.rsConn:Disconnect() end;if e.pollConn then e.pollConn:Disconnect() end;bringLoops[p]=nil end
local function startBring(p)
    if bringLoops[p] then stopBring(p) end
    local e={active=true,charConn=nil,rsConn=nil,pollConn=nil,currentTH=nil};bringLoops[p]=e
    local function tryAttach() local c=p.Character;if not c then return end;local tH=c:FindFirstChild("HumanoidRootPart");if not tH or tH==e.currentTH then return end;pinChar(e,tH) end
    tryAttach()
    e.charConn=p.CharacterAdded:Connect(function(nc) if not e.active then return end;task.spawn(function() local tH=nc:WaitForChild("HumanoidRootPart",10);if tH and e.active then pinChar(e,tH) end end) end)
    e.pollConn=RS.Heartbeat:Connect(function() if not e.active then return end;local c=p.Character;if not c then return end;local tH=c:FindFirstChild("HumanoidRootPart");if tH and tH~=e.currentTH then pinChar(e,tH) end end)
end

local function applyOrbitSpecific(en,target)
    if S.orbitSpecConn then S.orbitSpecConn:Disconnect();S.orbitSpecConn=nil end
    if not en or not target then S.orbitSpecific=false;S.orbitSpecTarget=nil;return end
    S.orbitSpecific=true;S.orbitSpecTarget=target;S.orbitSpecAngle=0
    S.orbitSpecConn=RS.RenderStepped:Connect(function(dt)
        if S.dead or not hrp or not hrp.Parent then return end
        if not target or not target.Parent then applyOrbitSpecific(false,nil);return end
        local tH=getCharRoot(target);if not tH then return end
        local pos=tH.Position
        S.orbitSpecAngle=(S.orbitSpecAngle+S.orbitSpecSpd*dt)%360
        local rad=mrad(S.orbitSpecAngle)
        hrp.CFrame=CFrame.new(
            pos.X+S.orbitSpecDist*math.cos(rad),
            pos.Y,
            pos.Z+S.orbitSpecDist*math.sin(rad)
        )*CFrame.Angles(0,-(rad+math.pi/2),0)
    end)
end

local function applyNoExp(en)
    if en then
        if S.noExpConn then return end
        S.noExpConn=workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("Explosion") then task.defer(function()
                if not obj or not obj.Parent then return end
                pcall(function() obj.BlastRadius=0;obj.BlastPressure=0;obj.DestroyJointRadiusPercent=0;obj.ExplosionType=Enum.ExplosionType.NoCraters end)
                pcall(function() obj:Destroy() end)
            end) end
        end)
    else if S.noExpConn then S.noExpConn:Disconnect();S.noExpConn=nil end end
end

local function applyHideNametag(en)
    if en then
        local c2=plr.Character;if not c2 then return end
        local head=c2:FindFirstChild("Head");if not head then return end
        for _,child in pairs(head:GetChildren()) do if child:IsA("BillboardGui") or child:IsA("Decal") then pcall(function() child:Destroy() end) end end
        if S.nametag.nameConn then S.nametag.nameConn:Disconnect() end
        S.nametag.nameConn=plr.CharacterAdded:Connect(function(nc)
            local h=nc:WaitForChild("Head",5);task.wait(0.5);if not h then return end
            for _,child in pairs(h:GetChildren()) do if child:IsA("BillboardGui") or child:IsA("Decal") then pcall(function() child:Destroy() end) end end
        end)
    else if S.nametag.nameConn then S.nametag.nameConn:Disconnect();S.nametag.nameConn=nil end end
end

local function applyExpSound(en)
    if en then
        S.expSoundOn=true
        local function removeSound(obj)
            if obj.Name=="ExpSound" and obj:IsA("Sound") then
                S.expSoundCache[obj]=obj.Parent
                pcall(function() obj.Parent=nil end)
            end
        end
        for _,d in pairs(workspace:GetDescendants()) do removeSound(d) end
        S.expSoundConns[1]=workspace.DescendantAdded:Connect(function(obj)
            task.defer(function()
                if obj and obj.Name=="ExpSound" and obj:IsA("Sound") then
                    pcall(function() obj.Parent=nil end)
                end
            end)
        end)
    else
        S.expSoundOn=false
        if S.expSoundConns[1] then S.expSoundConns[1]:Disconnect();S.expSoundConns={} end
        for obj,par in pairs(S.expSoundCache) do
            pcall(function() if par and par.Parent then obj.Parent=par end end)
        end
        S.expSoundCache={}
    end
end

local function applyClean(en)
    if en then
        if S.cleanConn then return end
        S.cleanConn=workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("Explosion") then
                task.defer(function()
                    if not obj or not obj.Parent then return end
                    pcall(function() obj.BlastRadius=0;obj.BlastPressure=0;obj.DestroyJointRadiusPercent=0;obj.ExplosionType=Enum.ExplosionType.NoCraters end)
                    pcall(function() obj:Destroy() end)
                end)
            end
        end)
    else
        if S.cleanConn then S.cleanConn:Disconnect();S.cleanConn=nil end
    end
end

local function applyNoShake(en)
    if en then
        if S.noShakeConn then return end
        local expShake=ev and ev:FindFirstChild("ExplosionShake")
        if expShake then pcall(function() expShake:Destroy() end) end
        S.noShakeConn=ev and ev.ChildAdded:Connect(function(c)
            if c.Name=="ExplosionShake" then pcall(function() c:Destroy() end) end
        end) or true
    else
        if S.noShakeConn and type(S.noShakeConn)~="boolean" then S.noShakeConn:Disconnect() end
        S.noShakeConn=nil
    end
end

local simRunning=false  
RS.Heartbeat:Connect(function()
    if S.dead then return end
    updateESP()
    -- Radar dots (camera-relative, reused)
    if S.espRadar and S.radarFrame and S.radarFrame.Visible then
        local myRoot = hrp
        if not myRoot or not myRoot.Parent then
            local ch = plr.Character
            myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
        end
        if myRoot then
            if not S.radarDots then S.radarDots={} end
            local range=S.radarRange or 250
            local camCF = cam and cam.CFrame or CFrame.new()
            local look=camCF.LookVector
            local flatLook=Vector3.new(look.X,0,look.Z)
            if flatLook.Magnitude<0.01 then flatLook=Vector3.new(0,0,-1) else flatLook=flatLook.Unit end
            local right=Vector3.new(-flatLook.Z,0,flatLook.X)
            local used={}
            for _,p in pairs(Players:GetPlayers()) do
                if p==plr then continue end
                if S.focusMode and type(isFocusTarget)=="function" and not isFocusTarget(p) then continue end
                local root=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                local off=root.Position-myRoot.Position
                local relX=off:Dot(right)/range
                local relZ=off:Dot(flatLook)/range
                if math.abs(relX)<=1.05 and math.abs(relZ)<=1.05 then
                    local key=p.UserId
                    used[key]=true
                    local dot=S.radarDots[key]
                    if not dot or not dot.Parent then
                        dot=Instance.new("Frame")
                        dot.Size=UDim2.new(0,7,0,7)
                        dot.BackgroundColor3=S.espBoxCol or T.ac
                        dot.BorderSizePixel=0
                        dot.ZIndex=52
                        dot.Parent=S.radarFrame
                        local c=Instance.new("UICorner");c.CornerRadius=UDim.new(1,0);c.Parent=dot
                        S.radarDots[key]=dot
                    end
                    dot.Position=UDim2.new(0.5+mcl(relX,-1,1)*0.42,-3.5,0.5-mcl(relZ,-1,1)*0.42,-3.5)
                    local focused = S.focusTargets and S.focusTargets[p.Name]
                    dot.BackgroundColor3=focused and T.ok or (S.espBoxCol or T.ac)
                    dot.Visible=true
                end
            end
            for k,dot in pairs(S.radarDots) do
                if not used[k] and dot then dot.Visible=false end
            end
        end
    elseif S.radarDots then
        for _,dot in pairs(S.radarDots) do if dot then dot.Visible=false end end
    end
    -- Enemy chams
    if S.enemyChams then
        for _,p in pairs(Players:GetPlayers()) do
            if p==plr then continue end
            local ch=p.Character;if not ch then continue end
            for _,part in pairs(ch:GetChildren()) do
                if part:IsA("BasePart") and not part:FindFirstChild("CH_Chams") then
                    local h=Instance.new("Highlight")
                    h.Name="CH_Chams";h.Adornee=part;h.FillColor=S.espBoxCol or T.ac
                    h.OutlineColor=Color3.new(1,1,1);h.FillTransparency=0.5;h.OutlineTransparency=0.3
                    h.Parent=part
                end
            end
        end
    end
end)

RS.RenderStepped:Connect(function()
    if S.dead or not hrp or not hrp.Parent then return end
    if S.flying then
        local mv=Vector3.zero;local cf=cam.CFrame
        if S.keys.W then mv+=cf.LookVector end;if S.keys.S then mv-=cf.LookVector end
        if S.keys.A then mv-=cf.RightVector end;if S.keys.D then mv+=cf.RightVector end
        if S.keys.Space or S.keys.E then mv+=Vector3.yAxis end;if S.keys.Ctrl or S.keys.Q then mv-=Vector3.yAxis end
        if mv.Magnitude>0 then mv=mv.Unit*S.flySpd end
        if S.flyBV then S.flyBV.Velocity=mv end
        if S.flyBG then S.flyBG.MaxTorque=S.spinOn and Vector3.new(1e9,0,1e9) or Vector3.new(1e9,1e9,1e9);S.flyBG.CFrame=cf end
    end
end)

do
    local payload={Normal=Vector3.new(0,0,-1),Player=plr,Label=S.rlabel,
        HitPart=nil,Vehicle=nil,Position=nil,Weapon=nil}
    local function fire(pos,wep,hp)
        if not hitR or not hitR.Parent or not hp or not hp.Parent then return end
        payload.HitPart=hp;payload.Vehicle=wep;payload.Position=pos;payload.Weapon=wep
        hitR:FireServer(payload)
    end
    RS.Heartbeat:Connect(function()
        if S.dead or not S.spamOn or not hrp or not hrp.Parent then return end
        local t=tick();if t-S.lastFire<S.fireRate then return end;S.lastFire=t
        local wep=S.cachedWep;if not wep or not wep.Parent then wep=getRPG();S.cachedWep=wep end
        if not wep or not wep.Parent then return end
        local tgts=getTargets();if #tgts==0 then return end
        local gen=S.fireGen;local sr=S.spread*100;local rpt=S.rktPerTgt
        local function doFire(tp,th)
            fire(tp,wep,th)
            for _=2,rpt do
                fire(Vector3.new(tp.X+mra(-sr,sr)/100,tp.Y+mra(-sr,sr)/100,tp.Z+mra(-sr,sr)/100),wep,th)
            end
        end
        if S.simFire then
            if simRunning then return end;simRunning=true
            task.spawn(function()
                for i=1,#tgts do
                    if not S.spamOn or S.fireGen~=gen or not wep.Parent then break end
                    doFire(tgts[i].pos,tgts[i].hrp)
                end;simRunning=false
            end)
        else
            if S.fireGen~=gen or not wep.Parent then return end
            doFire(tgts[1].pos,tgts[1].hrp)
        end
    end)
end

plr.CharacterAdded:Connect(function(nc)
    char=nc;hrp=nc:WaitForChild("HumanoidRootPart");hum=nc:WaitForChild("Humanoid")
    cam=workspace.CurrentCamera;S.cachedWep=nil
    -- Soft refresh: restore tools + position without full loadout loss
    if S._refreshRestore then
        local r=S._refreshRestore;S._refreshRestore=nil
        task.spawn(function()
            local tries=0
            while tries<20 do
                tries=tries+1
                if hrp and hrp.Parent then
                    pcall(function() hrp.CFrame=r.cf end)
                    pcall(function() if hum then hum.Health=hum.MaxHealth end end)
                    for _,t in ipairs(r.tools or {}) do
                        pcall(function()
                            if t and t.Parent==nil then t.Parent=plr.Backpack end
                        end)
                    end
                    break
                end
                task.wait(0.05)
            end
        end)
    end
    -- force baseline walkspeed 16 immediately, then re-apply hacks after game scripts
    pcall(function() if hum then hum.WalkSpeed=16;S.bhopBaseSpeed=16 end end)
    task.delay(0.15,function()
        pcall(function() if hum and hum.Parent and not S.spHkOn and not S.bhopOn then hum.WalkSpeed=16 end end)
    end)
    task.wait(.5)
    S.myBase=nil;task.spawn(function() while not S.myBase and not S.dead do findBase();task.wait(2) end end)
    if S.flying then task.delay(.5,startFly) end
    if S.spinOn then task.delay(.5,function() applySpin(true) end) end
    applySpd();applyJmp();applyInfJ(S.infJOn);applyNC(S.ncOn);applyGrav(S.gravOn);applyChams(S.chamsOn)
    applyBright(S.brightOn);applyFog(S.fogOn);applyXR(S.xrayOn)
    -- bind death logger for local player
    pcall(function()
        if hum then
            hum.Died:Connect(function()
                logDeath()
            end)
        end
    end)
    -- one more pass in case the game overwrote after load
    task.delay(1,function()
        if S.dead then return end
        applySpd();applyJmp()
        if not S.spHkOn and not S.bhopOn and hum and hum.Parent then pcall(function() hum.WalkSpeed=16 end) end
    end)
end)

task.spawn(function()
    task.wait(1)
    local function wto(ty)
        local o=ty:FindFirstChild("Owner");if not o then o=ty:WaitForChild("Owner",10);if not o then return end end
        o.Changed:Connect(function(v) if v==plr.Name then S.myBase=ty end;if v~="" then findBase() end end)
    end
    local function wat()
        local tf=workspace:FindFirstChild("Tycoon");if not tf then return end
        local ts=tf:FindFirstChild("Tycoons");if not ts then return end
        for _,ty in pairs(ts:GetChildren()) do task.spawn(wto,ty) end
        ts.ChildAdded:Connect(function(ty) task.spawn(wto,ty) end)
    end
    wat();workspace.ChildAdded:Connect(function(c) if c.Name=="Tycoon" then task.wait(.5);wat() end end)
end)

local sg=Instance.new("ScreenGui");sg.Name="ChudHubUI";sg.ResetOnSpawn=false
sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
sg.DisplayOrder=999
sg.IgnoreGuiInset=true
local function applyStreamproof(en)
    S.streamproof=en
    pcall(function()
        if en then
            -- Prefer executor-protected containers (hidden from CaptureService / OBS game capture)
            if gethui then
                sg.Parent=gethui()
            elseif syn and syn.protect_gui then
                syn.protect_gui(sg)
                if not sg.Parent then sg.Parent=plr:WaitForChild("PlayerGui") end
            elseif protect_gui then
                protect_gui(sg)
                if not sg.Parent then sg.Parent=plr:WaitForChild("PlayerGui") end
            elseif get_hidden_gui then
                sg.Parent=get_hidden_gui()
            else
                -- Fallback: CoreGui (still visible to some captures but outside PlayerGui)
                pcall(function() sg.Parent=game:GetService("CoreGui") end)
                if not sg.Parent then sg.Parent=plr:WaitForChild("PlayerGui") end
            end
            pcall(function() sg.DisplayOrder=999999 end)
        else
            sg.Parent=plr:WaitForChild("PlayerGui")
        end
    end)
end
applyStreamproof(S.streamproof~=false)
if not sg.Parent then sg.Parent=plr:WaitForChild("PlayerGui") end

local SW_COLLAPSED=58
local SW_EXPANDED=190
local SW=SW_COLLAPSED
local WW=720
local WH=600
local HDR_H=42
local NAV_H=38
local PAD=14
local SETTINGS_W=280
S.navMode="side"
S.sideExpanded=false
S.settingsOpen=false
S.sfxVol=0.45

-- ===== Rayfield / Lucide icons (sprite sheet via rbxassetid) =====
local Icons=nil
pcall(function()
    Icons=loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua'))()
end)
local function getIcon(name)
    if not Icons then return nil end
    name=string.lower(tostring(name or "")):gsub("^%s+",""):gsub("%s+$","")
    local sized=Icons["48px"]
    if not sized then return nil end
    local r=sized[name]
    if not r then return nil end
    return {
        id=r[1],
        imageRectSize=Vector2.new(r[2][1],r[2][2]),
        imageRectOffset=Vector2.new(r[3][1],r[3][2]),
    }
end
local function mkIcon(par,name,size,props)
    size=size or 18
    local data=getIcon(name)
    if data then
        local img=Instance.new("ImageLabel")
        img.Parent=par
        img.BackgroundTransparency=1
        img.Size=UDim2.new(0,size,0,size)
        img.Image="rbxassetid://"..tostring(data.id)
        img.ImageRectSize=data.imageRectSize
        img.ImageRectOffset=data.imageRectOffset
        img.ScaleType=Enum.ScaleType.Fit
        if props then for k,v in pairs(props) do img[k]=v end end
        return img
    end
    local t=Instance.new("TextLabel")
    t.Parent=par
    t.BackgroundTransparency=1
    t.Size=UDim2.new(0,size,0,size)
    t.Text=tostring(name):sub(1,1):upper()
    t.TextColor3=(props and props.ImageColor3) or Color3.fromRGB(180,180,190)
    t.Font=Enum.Font.GothamBold
    t.TextSize=math.max(10,size-4)
    if props then
        if props.Position then t.Position=props.Position end
        if props.AnchorPoint then t.AnchorPoint=props.AnchorPoint end
        if props.ZIndex then t.ZIndex=props.ZIndex end
    end
    return t
end
-- Lucide icon name map for tabs / chrome
local ICO={
    Move="move", Weapon="crosshair", RPG="rocket", Vis="eye", Vehicle="settings-2", Misc="sparkles", Online="globe", Styling="layout-grid",
    Player="users", Commands="terminal", Settings="settings", Close="x", Min="minus", Max="plus", Search="search",
    Star="star", Edit="pencil", Slash="slash", Lock="lock",
    Fly="plane", Esp="eye", Spam="zap", Speed="gauge", Jump="arrow-up", Noclip="ghost",
    Grav="arrow-down", Spin="rotate-cw", Hitbox="box", Chams="layers", Bright="sun", Fog="cloud",
    Xray="scan", Afk="clock", Clean="trash-2", Orbit="orbit", Bring="user-round-plus", God="shield",
}

-- layout constants (less rounded, consistent spacing)
local GAP=8
local TOG_H=42
local SL_H=48
local SEC_H=28
local CORNER=6

-- ===== Custom SFX system =====
-- Clean UI SFX (soft UI ticks, not game SFX)
local SFX={
    open="rbxassetid://6895079853",
    close="rbxassetid://6895079853",
    toggle_on="rbxassetid://6042053626",
    toggle_off="rbxassetid://6042053626",
    click="rbxassetid://6042053626",
    hover="rbxassetid://10066931761",
    slider="rbxassetid://10066931761",
    notify="rbxassetid://4590662766",
    error="rbxassetid://5180805019",
    tab="rbxassetid://6042053626",
}
local function playSFX(name,vol)
    pcall(function()
        local id=SFX[name] or SFX.click
        local s=Instance.new("Sound")
        s.SoundId=id
        s.Volume=(vol or S.sfxVol or 0.28)*0.7
        s.PlaybackSpeed=name=="hover" and 1.15 or (name=="toggle_on" and 1.05 or 1)
        s.Parent=game:GetService("SoundService")
        s:Play()
        game:GetService("Debris"):AddItem(s,2)
    end)
end

-- global feature registry for cross-tab search
local featureReg={}
local refreshTargetHud=nil
local _curBuildTab=nil
local function regFeature(info)
    if not info then return end
    if not info.tab and _curBuildTab then info.tab=_curBuildTab end
    table.insert(featureReg,info)
end

local UI_FONT=Enum.Font.GothamMedium
local UI_FONT_BOLD=Enum.Font.GothamBold
local function new(cls,par,props)
    local o=Instance.new(cls);if par then o.Parent=par end
    if props then for k,v in pairs(props) do o[k]=v end end
    -- nicer default UI font when not explicitly set
    if (o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox")) and props and not props.Font then
        o.Font=UI_FONT
    end
    return o
end
local function corner(o,r) new("UICorner",o,{CornerRadius=UDim.new(0,r or CORNER)}) end
local function mkStroke(o,c,th) local s=new("UIStroke",o,{Color=c,Thickness=th or 1});table.insert(reg.bd,s);return s end

-- Rainbow accents
local rainbowConn=nil
local function applyRainbow(en)
    if rainbowConn then rainbowConn:Disconnect();rainbowConn=nil end
    if not en then if TL[themeIdx] then apTh(TL[themeIdx]) end;return end
    local hue=0
    rainbowConn=RS.RenderStepped:Connect(function(dt)
        if not S.rainbowOn then return end
        hue=(hue+dt*0.12)%1
        local col=Color3.fromHSV(hue,0.65,1)
        T.ac=col
        for _,r in ipairs(reg.ac) do if r[1] and r[1].Parent then pcall(function() r[1][r[2]]=col end) end end
    end)
end
local function applyCompact(en)
    S.compactMode=en
    GAP=en and 2 or 8
    TOG_H=en and 26 or 42
    SL_H=en and 32 or 48
    SEC_H=en and 18 or 28
    local targetW=en and 420 or 720
    local targetH=en and 380 or 600
    WW=targetW;WH=targetH
    if win then
        TwS:Create(win,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,targetW,0,targetH)
        }):Play()
    end
    if winWrap then
        pcall(function()
            winWrap.Size=UDim2.new(0,targetW+6,0,targetH+6)
        end)
    end
    -- shrink every registered feature row + text
    for _,f in ipairs(featureReg) do
        if f.frame and f.frame.Parent then
            pcall(function()
                local h=en and 26 or (f.kind=="slider" and 48 or 42)
                f.frame.Size=UDim2.new(1,en and -12 or -PAD*2,0,h)
                for _,ch in ipairs(f.frame:GetDescendants()) do
                    if ch:IsA("TextLabel") or ch:IsA("TextButton") then
                        ch.TextSize=en and 10 or 12
                    end
                end
            end)
        end
    end
    showPopup("Compact",en and "Ultra-compact ON" or "Compact OFF",T.ac)
    CHQueueSave()
end
local _perfOrigTextures={}
local function applyPerformance(en)
    S.performanceMode=en
    if en then
        S.neonGlow=0
        if S.rainbowOn then S.rainbowOn=false;applyRainbow(false) end
        pcall(function()
            settings().Rendering.QualityLevel=Enum.QualityLevel.Level01
            Li.GlobalShadows=false
            Li.FogEnd=1e6
        end)
        -- strip textures → blank coloured parts; hide particles
        task.spawn(function()
            _perfOrigTextures={}
            for _,obj in ipairs(workspace:GetDescendants()) do
                if not S.performanceMode then break end
                if obj:IsA("Texture") or obj:IsA("Decal") then
                    pcall(function()
                        _perfOrigTextures[#_perfOrigTextures+1]={o=obj,t=obj.Transparency}
                        obj.Transparency=1
                    end)
                elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                    pcall(function()
                        _perfOrigTextures[#_perfOrigTextures+1]={o=obj,en=obj.Enabled}
                        obj.Enabled=false
                    end)
                elseif obj:IsA("Explosion") then
                    pcall(function() obj:Destroy() end)
                end
            end
        end)
        if not S._perfDesc then
            S._perfDesc=workspace.DescendantAdded:Connect(function(obj)
                if not S.performanceMode then return end
                task.defer(function()
                    if obj:IsA("Texture") or obj:IsA("Decal") then pcall(function() obj.Transparency=1 end)
                    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                        pcall(function() obj.Enabled=false end)
                    elseif obj:IsA("Explosion") then pcall(function() obj:Destroy() end) end
                end)
            end)
        end
    else
        if S._perfDesc then S._perfDesc:Disconnect();S._perfDesc=nil end
        for _,rec in ipairs(_perfOrigTextures) do
            pcall(function()
                if rec.t~=nil and rec.o then rec.o.Transparency=rec.t end
                if rec.en~=nil and rec.o then rec.o.Enabled=rec.en end
            end)
        end
        _perfOrigTextures={}
        pcall(function() settings().Rendering.QualityLevel=Enum.QualityLevel.Automatic end)
    end
end

do
    local activeBanners={}
    local function relayout()
        local y=12
        for _,b in ipairs(activeBanners) do
            if b and b.Parent then
                TwS:Create(b,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position=UDim2.new(0.5,0,0,y)}):Play()
                y=y+b.AbsoluteSize.Y+8
            end
        end
    end
    S.showBanner=function(frm,body)
        if S.customNotifications==false then return end
        playSFX("notify",0.4)
        pcall(function() end) -- kept for structure
        local bw=300
        local card=new("Frame",sg,{Size=UDim2.new(0,bw,0,52),AnchorPoint=Vector2.new(0.5,0),
            Position=UDim2.new(0.5,0,0,-70),BackgroundColor3=T.bgT,BackgroundTransparency=0.15,
            BorderSizePixel=0,ZIndex=60})
        corner(card,10)
        local st=new("UIStroke",card,{Color=T.ac,Thickness=1,Transparency=0.2})
        new("Frame",card,{Size=UDim2.new(0,3,1,-14),Position=UDim2.new(0,7,0,7),
            BackgroundColor3=T.ac,BorderSizePixel=0,ZIndex=61})
        new("TextLabel",card,{Size=UDim2.new(1,-44,0,16),Position=UDim2.new(0,18,0,7),
            BackgroundTransparency=1,Text="☆ "..frm,TextColor3=T.ac,Font=Enum.Font.GothamBold,
            TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=61})
        local bodyLbl=new("TextLabel",card,{Size=UDim2.new(1,-26,0,28),Position=UDim2.new(0,18,0,24),
            BackgroundTransparency=1,Text=body,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
            TextWrapped=true,ZIndex=61})
        local function resize()
            local tb=bodyLbl.TextBounds
            local ty=tb.Y
            if ty<=0 then
                local est=math.ceil(((#body)/40)+1)*14
                ty=math.max(14,est)
            end
            local h=math.max(52,40+math.ceil(ty))
            card.Size=UDim2.new(0,bw,0,h)
            bodyLbl.Size=UDim2.new(1,-26,0,h-26)
            relayout()
        end
        resize()
        bodyLbl:GetPropertyChangedSignal("TextBounds"):Connect(resize)
        table.insert(activeBanners,card)
        relayout()
        task.delay(7,function()
            TwS:Create(card,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Position=UDim2.new(0.5,0,0,-90),BackgroundTransparency=1}):Play()
            TwS:Create(st,TweenInfo.new(0.25),{Transparency=1}):Play()
            for _,c in ipairs(card:GetChildren()) do
                if c:IsA("TextLabel") then TwS:Create(c,TweenInfo.new(0.25),{TextTransparency=1}):Play() end
                if c:IsA("Frame") then TwS:Create(c,TweenInfo.new(0.25),{BackgroundTransparency=1}):Play() end
            end
            task.wait(0.3)
            for i,b in ipairs(activeBanners) do if b==card then table.remove(activeBanners,i);break end end
            card:Destroy();relayout()
        end)
    end
end

local shadow={Visible=false,Position=UDim2.new(.5,0,.5,0),BackgroundTransparency=1,Destroy=function()end}

local win=new("Frame",sg,{
    Size=UDim2.new(0,WW,0,WH),
    Position=UDim2.new(.5,0,.5,0),
    AnchorPoint=Vector2.new(.5,.5),
    BackgroundColor3=T.bg,BackgroundTransparency=0.12,
    BorderSizePixel=0,Visible=false
});corner(win,14);win.ClipsDescendants=true
ra("bg",win,"BackgroundColor3")
do
    local g=Instance.new("UIGradient")
    g.Rotation=145
    g.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,T.bg),
        ColorSequenceKeypoint.new(0.55,T.bgS),
        ColorSequenceKeypoint.new(1,T.bgT)
    })
    g.Parent=win
    _winGradRef=g
end
local winWrap=win

local winStroke=new("UIStroke",win,{Thickness=0.5,Color=T.bd,Transparency=0.5})
table.insert(reg.bd,winStroke)

local hdr=new("Frame",win,{
    Size=UDim2.new(1,0,0,HDR_H),Position=UDim2.new(0,0,0,0),
    BackgroundColor3=T.bgS,BackgroundTransparency=0.06,BorderSizePixel=0,ZIndex=1
});corner(hdr,14);ra("bS",hdr,"BackgroundColor3")
new("UIGradient",hdr,{
    Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.04),NumberSequenceKeypoint.new(1,0.2)}),
    Rotation=90
})

do
    -- 3D black hole logo (lightweight)
    local logoBg=new("Frame",hdr,{
        Size=UDim2.new(0,36,0,36),Position=UDim2.new(0,PAD,.5,-18),
        BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3
    })
    local vp=new("ViewportFrame",logoBg,{
        Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=4,
        Ambient=Color3.fromRGB(6,4,14),LightColor=Color3.fromRGB(255,240,255),LightDirection=Vector3.new(-0.25,-0.85,-0.4)
    })
    local vcam=Instance.new("Camera")
    vcam.FieldOfView=30
    vcam.Parent=vp
    vp.CurrentCamera=vcam
    local world=Instance.new("WorldModel")
    world.Parent=vp
    local bhModel=Instance.new("Model")
    bhModel.Name="CH_BlackHole"
    bhModel.Parent=world

    local horizon=Instance.new("Part")
    horizon.Name="Horizon"
    horizon.Anchored=true;horizon.CanCollide=false
    horizon.Material=Enum.Material.SmoothPlastic
    horizon.Color=Color3.fromRGB(0,0,0)
    horizon.Size=Vector3.new(0.72,0.72,0.72)
    horizon.Shape=Enum.PartType.Ball
    horizon.Parent=bhModel
    local photon=Instance.new("Part")
    photon.Anchored=true;photon.CanCollide=false
    photon.Material=Enum.Material.Neon
    photon.Color=T.ac
    photon.Transparency=0.5
    photon.Size=Vector3.new(0.95,0.95,0.95)
    photon.Shape=Enum.PartType.Ball
    photon.Parent=bhModel
    local photonHaze=Instance.new("Part")
    photonHaze.Anchored=true;photonHaze.CanCollide=false
    photonHaze.Material=Enum.Material.Neon
    photonHaze.Color=T.ac
    photonHaze.Transparency=0.82
    photonHaze.Size=Vector3.new(1.18,1.18,1.18)
    photonHaze.Shape=Enum.PartType.Ball
    photonHaze.Parent=bhModel

    -- Each ring is ONE model we rotate as a unit (cheap)
    local function buildRingModel(radius, tube, segments, col, baseTrans, yOff)
        local mdl=Instance.new("Model")
        mdl.Name="Ring"
        -- invisible center anchor so PivotTo spins around black hole core
        local anchor=Instance.new("Part")
        anchor.Name="Anchor"
        anchor.Anchored=true;anchor.CanCollide=false
        anchor.Transparency=1
        anchor.Size=Vector3.new(0.05,0.05,0.05)
        anchor.CFrame=CFrame.new(0, yOff, 0)
        anchor.Parent=mdl
        for i=1,segments do
            local a=(i/segments)*math.pi*2
            local x=math.cos(a)*radius
            local z=math.sin(a)*radius
            local p=Instance.new("Part")
            p.Anchored=true;p.CanCollide=false
            p.Material=Enum.Material.Neon
            p.Color=col
            p.Transparency=baseTrans
            p.Size=Vector3.new(tube*1.6, tube*1.6, tube*2.2)
            p.CFrame=CFrame.new(x, yOff, z)*CFrame.Angles(0, -a+math.pi/2, 0.12)
            p.Parent=mdl
            local m=Instance.new("SpecialMesh")
            m.MeshType=Enum.MeshType.Sphere
            m.Scale=Vector3.new(1,1,1.3)
            m.Parent=p
        end
        mdl.PrimaryPart=anchor
        mdl.Parent=bhModel
        return mdl
    end

    local ringModels={
        {m=buildRingModel(1.1, 0.09, 16, T.ac, 0.28, 0), speed=1.5},
        {m=buildRingModel(1.55, 0.08, 18, T.ac, 0.45, 0.02), speed=0.95},
        {m=buildRingModel(2.0, 0.06, 20, T.ac, 0.65, -0.01), speed=0.55},
    }
    bhModel.PrimaryPart=horizon
    vcam.CFrame=CFrame.new(Vector3.new(0.15, 0.85, 3.6), Vector3.new(0,0,0))

    do
        local t0=0
        local acc=0
        RS.RenderStepped:Connect(function(dt)
            if not bhModel or not bhModel.Parent then return end
            t0=t0+dt
            acc=acc+dt
            -- theme color ~4fps is enough
            if acc>=0.25 then
                acc=0
                local col=T.ac
                if photon and photon.Parent then photon.Color=col end
                if photonHaze and photonHaze.Parent then photonHaze.Color=col end
                for _,r in ipairs(ringModels) do
                    if r.m then
                        for _,p in ipairs(r.m:GetChildren()) do
                            if p:IsA("BasePart") then p.Color=col end
                        end
                    end
                end
            end
            -- spin whole model + each ring (3 PivotTos, not hundreds)
            pcall(function()
                bhModel:PivotTo(CFrame.Angles(math.rad(38), t0*0.3, math.rad(10)))
                for _,r in ipairs(ringModels) do
                    if r.m and r.m.PrimaryPart then
                        r.m:PivotTo(bhModel:GetPivot() * CFrame.Angles(0, t0*r.speed, 0))
                    end
                end
            end)
        end)
    end

    local title=new("TextLabel",hdr,{
        Size=UDim2.new(0,120,0,18),Position=UDim2.new(0,PAD+42,0,6),
        BackgroundTransparency=1,Text="ChudHub",
        TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=16,
        TextXAlignment=Enum.TextXAlignment.Left
    });ra("tx",title,"TextColor3")

    local cred=new("TextLabel",hdr,{
        Size=UDim2.new(0,160,0,14),Position=UDim2.new(0,PAD+42,0,24),
        BackgroundTransparency=1,Text="discord.gg/chudhub  ·  v1",
        TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,
        TextXAlignment=Enum.TextXAlignment.Left
    });ra("tD",cred,"TextColor3")

    -- Minimize button (settings moved to sidebar bottom)
    local minBtn=new("TextButton",hdr,{
        Size=UDim2.new(0,28,0,22),Position=UDim2.new(1,-PAD-70,.5,-11),
        BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
    });corner(minBtn,6);ra("bT",minBtn,"BackgroundColor3")
    local minIco=mkIcon(minBtn,"minus",14,{Position=UDim2.new(0.5,-7,0.5,-7),ImageColor3=T.txM,ZIndex=2})
    minBtn.MouseEnter:Connect(function()
        TwS:Create(minBtn,TweenInfo.new(0.1),{BackgroundColor3=T.wn}):Play()
        if minIco:IsA("ImageLabel") then TwS:Create(minIco,TweenInfo.new(0.1),{ImageColor3=T.bg}):Play() end
    end)
    minBtn.MouseLeave:Connect(function()
        TwS:Create(minBtn,TweenInfo.new(0.1),{BackgroundColor3=T.bgT}):Play()
        if minIco:IsA("ImageLabel") then TwS:Create(minIco,TweenInfo.new(0.1),{ImageColor3=T.txM}):Play() end
    end)
    minBtn.MouseButton1Click:Connect(function()
        if not S.minimized then
            winWrap.Visible=false;shadow.Visible=false
            S.minimized=true
            playSFX("close")
            showPopup("UI Hidden","Press [Insert] to restore",T.wn)
        else
            S.minimized=false
            winWrap.Visible=true;shadow.Visible=true
            playSFX("open")
            showPopup("UI Restored","Menu is back",T.ok)
        end
    end)

    local cb=new("TextButton",hdr,{
        Size=UDim2.new(0,28,0,22),Position=UDim2.new(1,-PAD-28,.5,-11),
        BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
    });corner(cb,6);ra("bT",cb,"BackgroundColor3")
    local cbIco=mkIcon(cb,"x",14,{Position=UDim2.new(0.5,-7,0.5,-7),ImageColor3=T.txM,ZIndex=2})
    cb.MouseEnter:Connect(function()
        TwS:Create(cb,TweenInfo.new(0.1),{BackgroundColor3=T.ng}):Play()
        if cbIco:IsA("ImageLabel") then TwS:Create(cbIco,TweenInfo.new(0.1),{ImageColor3=Color3.fromRGB(255,255,255)}):Play() end
    end)
    cb.MouseLeave:Connect(function()
        TwS:Create(cb,TweenInfo.new(0.1),{BackgroundColor3=T.bgT}):Play()
        if cbIco:IsA("ImageLabel") then TwS:Create(cbIco,TweenInfo.new(0.1),{ImageColor3=T.txM}):Play() end
    end)
    cb.MouseButton1Click:Connect(function()
        S.dead=true;S.spamOn=false;S.espOn=false;S.clickOn=false;S.spinOn=false
        S.fireGen=S.fireGen+1
        if S.flying then stopFly() end
        applySpin(false);S.spHkOn=false;applySpd();S.jpHkOn=false;applyJmp()
        applyInfJ(false);applyNC(false);applyGrav(false);applyChams(false)
        S.brightOn=false;S.fogOn=false;applyBright(false);applyFog(false);applyXR(false)
        applyHitbox(false);applyAntiAfk(false);applyOrbit(false);applyClean(false);applyNoShake(false);applyHitboxVis(false);applyExpSound(false)
        for _,p in pairs(Players:GetPlayers()) do stopBring(p) end
        applyOrbitSpecific(false,nil);applyNoExp(false);applyHideNametag(false)
        if S.spLkConn then S.spLkConn:Disconnect() end
        if S.jpLkConn then S.jpLkConn:Disconnect() end
        for _,d in pairs(S.espBoxes) do hideEB(d);pcall(function() for _,l in ipairs(d.br or {}) do if l then l:Remove() end end;for _,k in ipairs({"hbg","hbf","nt","dt","wt","ft","tr"}) do if d[k] then d[k]:Remove() end end end) end
        for _,d in pairs(S.vehESP) do hideVEB(d);pcall(function() for _,l in ipairs(d.br or {}) do if l then l:Remove() end end;for _,k in ipairs({"nt","dt","tr"}) do if d[k] then d[k]:Remove() end end end) end
        for _,c in ipairs(S.watchConns) do pcall(function() c:Disconnect() end) end
        if S.miniPanel then S.miniPanel:Destroy() end
        shadow:Destroy();sg:Destroy()
    end)

    do local dc,sp2,si
        hdr.InputBegan:Connect(function(inp)
            if inp.UserInputType~=Enum.UserInputType.MouseButton1 and inp.UserInputType~=Enum.UserInputType.Touch then return end
            sp2=winWrap.Position;si=inp.Position
            if dc then dc:Disconnect() end
            dc=UIS.InputChanged:Connect(function(mi)
                if mi.UserInputType==Enum.UserInputType.MouseMovement or mi.UserInputType==Enum.UserInputType.Touch then
                    local d=mi.Position-si
                    winWrap.Position=UDim2.new(sp2.X.Scale,sp2.X.Offset+d.X,sp2.Y.Scale,sp2.Y.Offset+d.Y)
                    shadow.Position=winWrap.Position
                end
            end)
            local ec;ec=inp.Changed:Connect(function()
                if inp.UserInputState==Enum.UserInputState.End then
                    if dc then dc:Disconnect();dc=nil end;ec:Disconnect()
                end
            end)
        end)
    end
end

-- Settings Popup with Keybinds, Theme Maker, and 5 Cosmetic Additions
-- ===== Right-side Settings Panel (slides out from main window) =====
local settingsPanel=nil
local function buildSettingsPanel()
    if settingsPanel then return settingsPanel end
    settingsPanel=new("Frame",winWrap,{
        Size=UDim2.new(0,SETTINGS_W,1,0),
        Position=UDim2.new(1,0,0,0),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.02,BorderSizePixel=0,ZIndex=25,ClipsDescendants=true
    });ra("bS",settingsPanel,"BackgroundColor3")
    corner(settingsPanel,12)
    mkStroke(settingsPanel,T.bd,1)

    local sHdr=new("Frame",settingsPanel,{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1})
    mkIcon(sHdr,"settings",16,{Position=UDim2.new(0,14,0.5,-8),ImageColor3=T.ac,ZIndex=2})
    new("TextLabel",sHdr,{Size=UDim2.new(1,-56,1,0),Position=UDim2.new(0,40,0,0),BackgroundTransparency=1,
        Text="Settings",TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left})
    local sClose=new("TextButton",sHdr,{Size=UDim2.new(0,28,0,28),Position=UDim2.new(1,-36,0.5,-14),
        BackgroundColor3=T.bgT,Text="",BorderSizePixel=0})
    mkIcon(sClose,"x",14,{Position=UDim2.new(0.5,-7,0.5,-7),ImageColor3=T.txM,ZIndex=2})
    corner(sClose,6)
    sClose.MouseButton1Click:Connect(function() toggleSettings(false) end)

    local sScroll=new("ScrollingFrame",settingsPanel,{
        Size=UDim2.new(1,-8,1,-50),Position=UDim2.new(0,4,0,44),
        BackgroundTransparency=1,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=26
    })
    local sy=8

    -- Keybinds
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="KEYBINDS",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});sy=sy+22
    local keyActions={
        {act="menuToggle",lbl="Menu Toggle"},{act="minimize",lbl="Minimize"},
        {act="altPalette",lbl="Alt Command Bar"},
        {act="fly",lbl="Fly"},{act="esp",lbl="ESP"},
        {act="spam",lbl="RPG Spam"},{act="speed",lbl="Speed"},
        {act="jump",lbl="Jump"},{act="infJump",lbl="Inf Jump"},{act="noClip",lbl="NoClip"},
        {act="lowGrav",lbl="Low Grav"},{act="spin",lbl="Spin"},{act="hitbox",lbl="Hitbox"},
        {act="chams",lbl="Chams"},{act="fullbright",lbl="Fullbright"},{act="noFog",lbl="No Fog"},
        {act="xray",lbl="X-Ray"},{act="antiAfk",lbl="Anti-AFK"},{act="orbit",lbl="Orbit"},
        {act="bring",lbl="Bring"},
    }
    for _,kinfo in ipairs(keyActions) do
        local act=kinfo.act
        local row=new("Frame",sScroll,{Size=UDim2.new(1,-16,0,28),Position=UDim2.new(0,8,0,sy),BackgroundColor3=T.bgT,BackgroundTransparency=0.3,BorderSizePixel=0})
        corner(row,6)
        new("TextLabel",row,{Size=UDim2.new(0.5,0,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Text=kinfo.lbl,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
        local curKey=S.keybinds[act] and S.keybinds[act].Name or "None"
        local keyLbl=new("TextLabel",row,{Size=UDim2.new(0.28,0,1,0),Position=UDim2.new(0.48,0,0,0),BackgroundTransparency=1,Text=curKey,TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=10})
        local reb=new("TextButton",row,{Size=UDim2.new(0.2,0,0.7,0),Position=UDim2.new(0.78,0,0.15,0),BackgroundColor3=T.off,Text="Set",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=10,BorderSizePixel=0})
        corner(reb,4)
        reb.MouseButton1Click:Connect(function()
            playSFX("click")
            reb.Text="..."
            local conn;conn=UIS.InputBegan:Connect(function(i2)
                if i2.KeyCode==Enum.KeyCode.Escape then
                    S.keybinds[act]=Enum.KeyCode.Unknown;keyLbl.Text="None";reb.Text="Set";conn:Disconnect();CHQueueSave();return
                end
                if i2.KeyCode~=Enum.KeyCode.Unknown then
                    S.keybinds[act]=i2.KeyCode;keyLbl.Text=i2.KeyCode.Name;reb.Text="Set";conn:Disconnect();playSFX("toggle_on");CHQueueSave()
                end
            end)
        end)
        sy=sy+32
    end

    -- Audio
    sy=sy+10
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="AUDIO",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});sy=sy+22
    local volRow=new("Frame",sScroll,{Size=UDim2.new(1,-16,0,48),Position=UDim2.new(0,8,0,sy),BackgroundColor3=T.bgT,BackgroundTransparency=0.3,BorderSizePixel=0})
    corner(volRow,8)
    new("TextLabel",volRow,{Size=UDim2.new(1,-16,0,16),Position=UDim2.new(0,8,0,4),BackgroundTransparency=1,Text="SFX Volume",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11})
    local volVal=new("TextLabel",volRow,{Size=UDim2.new(0.3,0,0,16),Position=UDim2.new(0.7,0,0,4),BackgroundTransparency=1,Text=tostring(math.floor((S.sfxVol or 0.45)*100)).."%",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right})
    local volTrk=new("Frame",volRow,{Position=UDim2.new(0,8,0,28),Size=UDim2.new(1,-16,0,6),BackgroundColor3=T.off,BorderSizePixel=0});corner(volTrk,3)
    local volFi=new("Frame",volTrk,{Size=UDim2.new(S.sfxVol or 0.45,0,1,0),BackgroundColor3=T.ac,BorderSizePixel=0});corner(volFi,3)
    volTrk.InputBegan:Connect(function(inp)
        if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end
        local function ox(x)
            local r2=mcl((x-volTrk.AbsolutePosition.X)/volTrk.AbsoluteSize.X,0,1)
            S.sfxVol=r2;volFi.Size=UDim2.new(r2,0,1,0);volVal.Text=tostring(math.floor(r2*100)).."%"
        end
        ox(UIS:GetMouseLocation().X)
        local mc2,ec
        mc2=UIS.InputChanged:Connect(function(mi) if mi.UserInputType==Enum.UserInputType.MouseMovement then ox(mi.Position.X) end end)
        ec=UIS.InputEnded:Connect(function(ei) if ei.UserInputType==Enum.UserInputType.MouseButton1 then mc2:Disconnect();ec:Disconnect() end end)
    end)
    sy=sy+56

    -- Window
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="WINDOW",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});sy=sy+22
    local transRow={label="Transparency",min=0,max=85,default=winTrans or 18,suffix="%",cb=function(v) winTrans=v;S.winTrans=v;win.BackgroundTransparency=v/100 end}
    -- inline mini slider
    do
        local c=new("Frame",sScroll,{Size=UDim2.new(1,-16,0,48),Position=UDim2.new(0,8,0,sy),BackgroundColor3=T.bgT,BackgroundTransparency=0.3,BorderSizePixel=0})
        corner(c,8)
        new("TextLabel",c,{Size=UDim2.new(.6,0,0,16),Position=UDim2.new(0,8,0,4),BackgroundTransparency=1,Text="Transparency",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11})
        local vl=new("TextLabel",c,{Size=UDim2.new(.35,0,0,16),Position=UDim2.new(0.6,0,0,4),BackgroundTransparency=1,Text=tostring(winTrans or 18).."%",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right})
        local trk=new("Frame",c,{Position=UDim2.new(0,8,0,28),Size=UDim2.new(1,-16,0,6),BackgroundColor3=T.off,BorderSizePixel=0});corner(trk,3)
        local fi=new("Frame",trk,{Size=UDim2.new((winTrans or 18)/85,0,1,0),BackgroundColor3=T.ac,BorderSizePixel=0});corner(fi,3)
        trk.InputBegan:Connect(function(inp)
            if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end
            local function ox(x)
                local r2=mcl((x-trk.AbsolutePosition.X)/trk.AbsoluteSize.X,0,1)
                local v=math.floor(r2*85);winTrans=v;S.winTrans=v;win.BackgroundTransparency=v/100;fi.Size=UDim2.new(r2,0,1,0);vl.Text=tostring(v).."%"
            end
            ox(UIS:GetMouseLocation().X)
            local mc2,ec
            mc2=UIS.InputChanged:Connect(function(mi) if mi.UserInputType==Enum.UserInputType.MouseMovement then ox(mi.Position.X) end end)
            ec=UIS.InputEnded:Connect(function(ei) if ei.UserInputType==Enum.UserInputType.MouseButton1 then mc2:Disconnect();ec:Disconnect() end end)
        end)
        sy=sy+56
    end

    -- Themes quick
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="THEMES",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});sy=sy+22
    local themeRow=new("Frame",sScroll,{Size=UDim2.new(1,-16,0,36),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1})
    for i=1,math.min(8,#TL) do
        local td=TL[i]
        local dot=new("TextButton",themeRow,{Size=UDim2.new(0,28,0,28),Position=UDim2.new(0,(i-1)*32,0,4),BackgroundColor3=td.ac,Text="",BorderSizePixel=0})
        corner(dot,14)
        dot.MouseButton1Click:Connect(function() playSFX("click");themeIdx=i;apTh(td,true);updCards() end)
    end
    sy=sy+44

    -- Theme editor lives in Styling tab
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,28),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="Full colour editor is in the Styling tab",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true});sy=sy+34

    -- Extra settings
    new("TextLabel",sScroll,{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,8,0,sy),BackgroundTransparency=1,
        Text="EXTRA",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});sy=sy+22
    local extraOpts={
        {lbl="Compact Mode",key="compactMode",fn=applyCompact},
        {lbl="Rainbow Accents",key="rainbowOn",fn=applyRainbow},
        {lbl="Custom Notifications",key="customNotifications",fn=function(v) S.customNotifications=v end},
        {lbl="ArrayList",key="arrayListOn",fn=function(v) S.arrayListOn=v;if arrayListFrame then arrayListFrame.Visible=v end end},
        {lbl="Keybinds List",key="keybindsListOn",fn=function(v) S.keybindsListOn=v;if keybindsHud then keybindsHud.Visible=v;if v and refreshKeybindsHud then refreshKeybindsHud() end end end},
        {lbl="Perf Stats",key="perfStatsOn",fn=function(v) S.perfStatsOn=v;if perfFrame then perfFrame.Visible=v end end},
        {lbl="Performance Mode",key="performanceMode",fn=applyPerformance},
    }
    for _,opt in ipairs(extraOpts) do
        local row=new("Frame",sScroll,{Size=UDim2.new(1,-16,0,30),Position=UDim2.new(0,8,0,sy),BackgroundColor3=T.bgT,BackgroundTransparency=0.3,BorderSizePixel=0})
        corner(row,6)
        new("TextLabel",row,{Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Text=opt.lbl,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
        local tf=new("Frame",row,{Size=UDim2.new(0,34,0,18),Position=UDim2.new(1,-42,0.5,-9),BackgroundColor3=S[opt.key] and T.ac or T.off,BorderSizePixel=0});corner(tf,9)
        local ci=new("Frame",tf,{Size=UDim2.new(0,14,0,14),Position=S[opt.key] and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7),BackgroundColor3=S[opt.key] and T.bg or T.txD,BorderSizePixel=0});corner(ci,7)
        local btn=new("TextButton",row,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""})
        btn.MouseButton1Click:Connect(function()
            S[opt.key]=not S[opt.key]
            playSFX(S[opt.key] and "toggle_on" or "toggle_off")
            tf.BackgroundColor3=S[opt.key] and T.ac or T.off
            ci.Position=S[opt.key] and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7)
            ci.BackgroundColor3=S[opt.key] and T.bg or T.txD
            if opt.fn then pcall(opt.fn,S[opt.key]) end
        end)
        sy=sy+36
    end

    -- Re-enable changelog
    local reLog=new("TextButton",sScroll,{
        Size=UDim2.new(1,-16,0,32),Position=UDim2.new(0,8,0,sy),
        BackgroundColor3=T.bgT,Text="Re-enable Changelog",TextColor3=T.tx,
        Font=Enum.Font.Gotham,TextSize=12,BorderSizePixel=0
    });corner(reLog,6);mkStroke(reLog,T.bd)
    reLog.MouseButton1Click:Connect(function()
        pcall(function()
            if isfile and isfile("CHUDHUB_changelog_v1.hide") and delfile then delfile("CHUDHUB_changelog_v1.hide") end
            if writefile then writefile("CHUDHUB_changelog_v1.hide","") end -- ensure removable
            if isfile and isfile("CHUDHUB_changelog_v1.hide") then
                -- try overwrite empty then delete via write nothing - some executors use delfile only
                pcall(function() delfile("CHUDHUB_changelog_v1.hide") end)
            end
        end)
        showPopup("Changelog","Will show on next reload",T.ok)
        playSFX("click")
    end)
    sy=sy+40

    sScroll.CanvasSize=UDim2.new(0,0,0,sy+20)
    return settingsPanel
end

function toggleSettings(force)
    local want=force
    if want==nil then want=not S.settingsOpen end
    S.settingsOpen=want
    local panel=buildSettingsPanel()
    playSFX(want and "open" or "close")
    if want then
        TwS:Create(panel,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
            Position=UDim2.new(1,-SETTINGS_W,0,0)
        }):Play()
    else
        TwS:Create(panel,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
            Position=UDim2.new(1,0,0,0)
        }):Play()
    end
end

function showSettingsPopup()
    toggleSettings(true)
end

-- ===== Circular colour picker panel (right side) =====
local COLOR_W=260
local colorPanel=nil
local colorCb=nil
local colorSetFromColor=nil
local function buildColorPanel()
    if colorPanel then return colorPanel end
    colorPanel=new("Frame",winWrap,{
        Size=UDim2.new(0,COLOR_W,1,0),
        Position=UDim2.new(1,0,0,0),
        BackgroundColor3=T.bgS,BorderSizePixel=0,ZIndex=40
    });ra("bS",colorPanel,"BackgroundColor3")
    corner(colorPanel,12);mkStroke(colorPanel,T.bd,1)
    local cHdr=new("Frame",colorPanel,{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1})
    mkIcon(cHdr,"palette",16,{Position=UDim2.new(0,14,0.5,-8),ImageColor3=T.ac,ZIndex=2})
    new("TextLabel",cHdr,{Size=UDim2.new(1,-60,1,0),Position=UDim2.new(0,40,0,0),BackgroundTransparency=1,
        Text="Colour Picker",TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left})
    local cClose=new("TextButton",cHdr,{Size=UDim2.new(0,28,0,28),Position=UDim2.new(1,-36,0.5,-14),BackgroundTransparency=1,Text=""})
    mkIcon(cClose,"x",14,{Position=UDim2.new(0.5,-7,0.5,-7),ImageColor3=T.txM,ZIndex=2})
    cClose.MouseButton1Click:Connect(function()
        S.colorPickerOpen=false
        TwS:Create(colorPanel,TweenInfo.new(0.18),{Position=UDim2.new(1,0,0,0)}):Play()
        playSFX("close")
    end)

    local body=new("Frame",colorPanel,{Size=UDim2.new(1,-24,1,-56),Position=UDim2.new(0,12,0,48),BackgroundTransparency=1})

    -- Colour wheel (polar grid) — hue matched to pick
    local wheelSize = 180
    local wheelWrap = new("Frame", body, {
        Size = UDim2.new(0, wheelSize, 0, wheelSize),
        Position = UDim2.new(0.5, -wheelSize / 2, 0, 4),
        BackgroundColor3 = Color3.fromRGB(12, 12, 16),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 41,
    })
    corner(wheelWrap, wheelSize / 2)

    do
        local rings = 18
        local segs = 48
        local cx, cy = wheelSize / 2, wheelSize / 2
        local maxR = wheelSize / 2 - 1
        for r = 1, rings do
            local sat = r / rings
            local radius = sat * maxR
            local count = math.max(8, math.floor(segs * sat))
            for i = 0, count - 1 do
                local h = i / count
                local ang = h * math.pi * 2
                local px = cx + math.cos(ang) * radius
                local py = cy + math.sin(ang) * radius
                local cell = Instance.new("Frame")
                cell.Size = UDim2.new(0, 8, 0, 8)
                cell.Position = UDim2.new(0, px - 4, 0, py - 4)
                cell.BackgroundColor3 = Color3.fromHSV(h, sat, 1)
                cell.BorderSizePixel = 0
                cell.ZIndex = 42
                cell.Parent = wheelWrap
                local uc = Instance.new("UICorner")
                uc.CornerRadius = UDim.new(1, 0)
                uc.Parent = cell
            end
        end
        local core = Instance.new("Frame")
        core.Size = UDim2.new(0, 16, 0, 16)
        core.Position = UDim2.new(0.5, -8, 0.5, -8)
        core.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        core.BorderSizePixel = 0
        core.ZIndex = 43
        core.Parent = wheelWrap
        local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(1, 0); cc.Parent = core
    end

    local pointer = new("Frame", wheelWrap, {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.85, 0, 0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 46,
    })
    corner(pointer, 7)
    mkStroke(pointer, Color3.fromRGB(0, 0, 0), 1.5)

    local wheelHit = new("TextButton", wheelWrap, {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 47,
    })

    -- Value (brightness) slider
    new("TextLabel", body, {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, wheelSize + 14),
        BackgroundTransparency = 1,
        Text = "Brightness",
        TextColor3 = T.txM,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local valTrack = new("Frame", body, {
        Size = UDim2.new(1, 0, 0, 12),
        Position = UDim2.new(0, 0, 0, wheelSize + 32),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 41,
    })
    corner(valTrack, 6)
    local vg = Instance.new("UIGradient")
    vg.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    })
    vg.Parent = valTrack
    local valKnob = new("TextButton", valTrack, {
        Size = UDim2.new(0, 14, 0, 16),
        Position = UDim2.new(1, -14, 0.5, -8),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Text = "",
        BorderSizePixel = 0,
        ZIndex = 45,
    })
    corner(valKnob, 4)
    mkStroke(valKnob, Color3.fromRGB(0, 0, 0), 1)

    -- Preview swatch
    local preview = new("Frame", body, {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 0, 0, wheelSize + 54),
        BackgroundColor3 = T.ac,
        BorderSizePixel = 0,
        ZIndex = 43,
    })
    corner(preview, 10)
    mkStroke(preview, Color3.fromRGB(255, 255, 255), 1.5)

    local hue, sat, val = 0, 1, 1
    local function hsvToRgb(h, s, v)
        return Color3.fromHSV(h, s, v)
    end

    local hexLbl = new("TextLabel", body, {
        Size = UDim2.new(1, -50, 0, 18),
        Position = UDim2.new(0, 48, 0, wheelSize + 58),
        BackgroundTransparency = 1,
        Text = "#7830CC",
        TextColor3 = T.tx,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local function applyColor()
        local c = hsvToRgb(hue, sat, val)
        preview.BackgroundColor3 = c
        vg.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(hue, 1, 1)),
        })
        local r, g, b = mfl(c.R * 255), mfl(c.G * 255), mfl(c.B * 255)
        hexLbl.Text = string.format("#%02X%02X%02X  ·  %d,%d,%d", r, g, b, r, g, b)
        if colorCb then pcall(colorCb, c) end
    end

    local dragging = false
    local function pickFromPos(absX, absY)
        local cx = wheelWrap.AbsolutePosition.X + wheelWrap.AbsoluteSize.X / 2
        local cy = wheelWrap.AbsolutePosition.Y + wheelWrap.AbsoluteSize.Y / 2
        local dx = absX - cx
        local dy = absY - cy
        local dist = math.sqrt(dx * dx + dy * dy)
        local radius = wheelWrap.AbsoluteSize.X / 2
        if radius < 1 then return end
        -- match polar cells: ang = hue*2pi, x=cos(ang), y=sin(ang)  (hue 0 at right)
        local ang = math.atan2(dy, dx)
        local h = ang / (2 * math.pi)
        if h < 0 then h = h + 1 end
        hue = h
        sat = mcl(dist / radius, 0, 1)
        local clamped = mcl(dist, 0, radius - 2)
        pointer.Position = UDim2.new(0.5, math.cos(ang) * clamped, 0.5, math.sin(ang) * clamped)
        applyColor()
    end
    wheelHit.MouseButton1Down:Connect(function()
        dragging = true
        pickFromPos(Mouse.X, Mouse.Y)
        playSFX("click", 0.1)
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            pickFromPos(i.Position.X, i.Position.Y)
        end
    end)

    local valDrag = false
    local function setValFromX(x)
        local rel = mcl(x / math.max(valTrack.AbsoluteSize.X, 1), 0, 1)
        val = rel
        valKnob.Position = UDim2.new(rel, -7, 0.5, -8)
        applyColor()
    end
    valKnob.MouseButton1Down:Connect(function() valDrag = true end)
    valTrack.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            valDrag = true
            setValFromX(i.Position.X - valTrack.AbsolutePosition.X)
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then valDrag = false end
    end)
    UIS.InputChanged:Connect(function(i)
        if valDrag and i.UserInputType == Enum.UserInputType.MouseMovement then
            setValFromX(i.Position.X - valTrack.AbsolutePosition.X)
        end
    end)

    applyColor()

    -- Presets
    new("TextLabel", body, {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, wheelSize + 100),
        BackgroundTransparency = 1,
        Text = "Presets",
        TextColor3 = T.txM,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local presets = {
        Color3.fromRGB(120, 47, 204), Color3.fromRGB(59, 130, 246), Color3.fromRGB(52, 211, 153),
        Color3.fromRGB(248, 113, 113), Color3.fromRGB(251, 191, 36), Color3.fromRGB(255, 150, 180),
        Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0),
    }
    for i, pc in ipairs(presets) do
        local col = i - 1
        local b = new("TextButton", body, {
            Size = UDim2.new(0, 24, 0, 24),
            Position = UDim2.new(0, col * 30, 0, wheelSize + 120),
            BackgroundColor3 = pc,
            Text = "",
            BorderSizePixel = 0,
        })
        corner(b, 6)
        b.MouseButton1Click:Connect(function()
            local h, s, v = pc:ToHSV()
            hue, sat, val = h, s, v
            local ang = h * 2 * math.pi
            local rr = sat * (wheelSize / 2 - 2)
            pointer.Position = UDim2.new(0.5, math.cos(ang) * rr, 0.5, math.sin(ang) * rr)
            valKnob.Position = UDim2.new(val, -7, 0.5, -8)
            applyColor()
            playSFX("click", 0.15)
        end)
    end

    local applyBtn=new("TextButton",body,{
        Size=UDim2.new(1,0,0,34),Position=UDim2.new(0,0,1,-40),
        BackgroundColor3=T.ac,Text="Apply",TextColor3=Color3.fromRGB(255,255,255),
        Font=Enum.Font.GothamBold,TextSize=13,BorderSizePixel=0
    });corner(applyBtn,CORNER)
    applyBtn.MouseButton1Click:Connect(function()
        applyColor()
        S.colorPickerOpen=false
        TwS:Create(colorPanel,TweenInfo.new(0.18),{Position=UDim2.new(1,0,0,0)}):Play()
        playSFX("click")
        showPopup("Colour","Applied",T.ok)
    end)

    colorSetFromColor = function(c)
        if typeof(c) ~= "Color3" then return end
        local h, s, v = c:ToHSV()
        hue, sat, val = h, s, v
        -- match polar cells: hue 0 at right
        local ang = h * 2 * math.pi
        local rr = sat * (wheelSize / 2 - 2)
        pointer.Position = UDim2.new(0.5, math.cos(ang) * rr, 0.5, math.sin(ang) * rr)
        valKnob.Position = UDim2.new(val, -7, 0.5, -8)
        applyColor()
    end

    return colorPanel
end

function openColorPicker(initial,cb)
    colorCb=cb
    if not colorPanel or not colorPanel.Parent then
        colorPanel=buildColorPanel()
    end
    S.colorPickerOpen=true
    if initial and typeof(initial)=="Color3" then
        if type(colorSetFromColor)=="function" then
            pcall(colorSetFromColor, initial)
        elseif colorCb then
            pcall(colorCb, initial)
        end
    end
    playSFX("open")
    TwS:Create(colorPanel,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(1,-COLOR_W,0,0)}):Play()
end


local hdrSep=new("Frame",win,{Size=UDim2.new(1,-28,0,1),Position=UDim2.new(0,14,0,HDR_H),BackgroundColor3=T.bd,BorderSizePixel=0,BackgroundTransparency=0.4});ra("bc",hdrSep,"BackgroundColor3")

local topNav=new("Frame",win,{
    Size=UDim2.new(1,-PAD*2,0,NAV_H),
    Position=UDim2.new(0,PAD,0,HDR_H+6),
    BackgroundColor3=T.bgT,BackgroundTransparency=0.15,
    BorderSizePixel=0,Visible=false
});corner(topNav,NAV_H/2);ra("bT",topNav,"BackgroundColor3")
mkStroke(topNav,T.bd)

local pill=new("Frame",topNav,{
    Size=UDim2.new(0,10,1,-6),Position=UDim2.new(0,3,0,3),
    BackgroundColor3=T.ac,BorderSizePixel=0,ZIndex=1
});corner(pill,NAV_H/2-3);ra("ac",pill,"BackgroundColor3")

local sideNav=new("Frame",win,{
    Size=UDim2.new(0,SW,1,-HDR_H-1),
    Position=UDim2.new(0,0,0,HDR_H+1),
    BackgroundColor3=T.bgS,BackgroundTransparency=0,
    BorderSizePixel=0,Visible=true,ZIndex=25,Active=true
});ra("bS",sideNav,"BackgroundColor3")

local sideIndicator=new("Frame",sideNav,{
    Size=UDim2.new(0,3,0,28),Position=UDim2.new(0,0,0,8),
    BackgroundColor3=T.ac,BorderSizePixel=0,ZIndex=6
});corner(sideIndicator,2);ra("ac",sideIndicator,"BackgroundColor3")

-- Bottom of sidebar: user + light mode + settings
local sideBottom=new("Frame",sideNav,{
    Size=UDim2.new(1,-8,0,124),Position=UDim2.new(0,4,1,-132),
    BackgroundTransparency=1,ZIndex=6
})
-- User button with profile picture icon
local userBtn=new("TextButton",sideBottom,{
    Size=UDim2.new(1,0,0,36),Position=UDim2.new(0,0,0,0),
    BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
});corner(userBtn,CORNER);ra("bT",userBtn,"BackgroundColor3")
local userIco=new("ImageLabel",userBtn,{
    Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,12,0.5,-11),
    BackgroundColor3=T.bgS,BorderSizePixel=0,ZIndex=7,
    Image=getAvatarThumb(plr.UserId,48)
});corner(userIco,11)
pcall(function() local st=Instance.new("UIStroke");st.Color=T.bd;st.Thickness=1;st.Parent=userIco end)
local userLbl=new("TextLabel",userBtn,{
    Size=UDim2.new(1,-44,1,0),Position=UDim2.new(0,40,0,0),BackgroundTransparency=1,
    Text="User",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=12,
    TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7
});ra("tM",userLbl,"TextColor3")
local toggleUserPanel=nil
userBtn.MouseButton1Click:Connect(function()
    playSFX("click")
    if toggleUserPanel then toggleUserPanel() end
end)
userBtn.MouseEnter:Connect(function()
    TwS:Create(userBtn,TweenInfo.new(0.1),{BackgroundColor3=T.ac}):Play()
    TwS:Create(userLbl,TweenInfo.new(0.1),{TextColor3=Color3.fromRGB(255,255,255)}):Play()
end)
userBtn.MouseLeave:Connect(function()
    TwS:Create(userBtn,TweenInfo.new(0.1),{BackgroundColor3=T.bgT}):Play()
    TwS:Create(userLbl,TweenInfo.new(0.1),{TextColor3=T.txM}):Play()
end)
local lightBtn=new("TextButton",sideBottom,{
    Size=UDim2.new(1,0,0,36),Position=UDim2.new(0,0,0,40),
    BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
});corner(lightBtn,CORNER);ra("bT",lightBtn,"BackgroundColor3")
local lightIco=mkIcon(lightBtn,"sun",18,{Position=UDim2.new(0,14,0.5,-9),ImageColor3=T.txM,ZIndex=7})
local lightLbl=new("TextLabel",lightBtn,{
    Size=UDim2.new(1,-44,1,0),Position=UDim2.new(0,40,0,0),BackgroundTransparency=1,
    Text="Light Mode",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=12,
    TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7
});ra("tM",lightLbl,"TextColor3")
if lightIco and lightIco:IsA("ImageLabel") then
    table.insert(reg.ico,{lightIco,"ImageColor3"})
    lightIco.ImageColor3=T.txM
end
local function applyLightMode(en)
    S.lightMode=en and true or false
    if not S.lightMode then
        -- full dark theme apply (explicitly drop light surfaces)
        local td=TL[themeIdx] or TL[1]
        -- temporary clear so apTh does not re-enter light branch
        local was=S.lightMode
        S.lightMode=false
        apTh(td,false)
        S.lightMode=false
        if lightIco and lightIco:IsA("ImageLabel") then lightIco.ImageColor3=T.txM end
        if lightLbl then lightLbl.TextColor3=T.txM end
        return
    end
    -- light surfaces, keep current accent
    local ac=T.ac
    T.bg=Color3.fromRGB(248,249,252);T.bgS=Color3.fromRGB(255,255,255);T.bgT=Color3.fromRGB(236,238,244)
    T.bd=Color3.fromRGB(200,205,215);T.off=Color3.fromRGB(190,195,205)
    T.tx=Color3.fromRGB(18,20,28);T.txM=Color3.fromRGB(55,58,70);T.txD=Color3.fromRGB(110,115,130)
    T.txSel=Color3.fromRGB(10,12,18)
    T.ac=ac
    for _,r in ipairs(reg.bg) do if r[1] and r[1].Parent then r[1][r[2]]=T.bg end end
    for _,r in ipairs(reg.bS) do if r[1] and r[1].Parent then r[1][r[2]]=T.bgS end end
    for _,r in ipairs(reg.bT) do if r[1] and r[1].Parent then r[1][r[2]]=T.bgT end end
    for _,r in ipairs(reg.tx) do if r[1] and r[1].Parent then r[1][r[2]]=T.tx end end
    for _,r in ipairs(reg.tM) do if r[1] and r[1].Parent then r[1][r[2]]=T.txM end end
    for _,r in ipairs(reg.tD) do if r[1] and r[1].Parent then r[1][r[2]]=T.txD end end
    for _,ic in ipairs(reg.ico) do if ic[1] and ic[1].Parent then ic[1][ic[2]]=T.txM end end
    for _,s in ipairs(reg.bd) do if s and s.Parent then s.Color=T.bd end end
    for _,r in ipairs(reg.tr) do if r[1] and r[1].Parent then r[1][r[2]]=T.off end end
    for _,r in ipairs(reg.ac) do if r[1] and r[1].Parent then r[1][r[2]]=T.ac end end
    for _,g in ipairs(reg.tog) do
        if g.f and g.f.Parent then g.f.BackgroundColor3=g.on() end
        if g.c and g.c.Parent then g.c.BackgroundColor3=g.cn() end
    end
    if _winGradRef and _winGradRef.Parent then
        _winGradRef.Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,T.bg),
            ColorSequenceKeypoint.new(0.5,T.bgS),
            ColorSequenceKeypoint.new(1,T.bgT)
        })
    end
    refreshAccentLines()
    refreshSidebarTheme()
    if lightIco and lightIco:IsA("ImageLabel") then lightIco.ImageColor3=T.wn end
    if lightLbl then lightLbl.TextColor3=T.tx end
    if userLbl then userLbl.TextColor3=T.txM end
    if sideGearLbl then sideGearLbl.TextColor3=T.txM end
    for _,sf in ipairs(reg.sb) do if sf and sf.Parent then sf.ScrollBarImageColor3=T.ac end end
    if S._layoutModePainters then for _,fn in ipairs(S._layoutModePainters) do pcall(fn) end end
    if type(S._applyUiStyle)=="function" then pcall(function() S._applyUiStyle(S.uiStyle or "Solid",true) end) end
end
lightBtn.MouseButton1Click:Connect(function()
    playSFX("click")
    applyLightMode(not S.lightMode)
    if lightIco:IsA("ImageLabel") then
        lightIco.ImageColor3=S.lightMode and T.wn or T.txM
    end
    lightLbl.TextColor3=S.lightMode and T.tx or T.txM
    showPopup("Theme",S.lightMode and "Light mode on" or "Dark mode on",T.ac)
end)

local sideGear=new("TextButton",sideBottom,{
    Size=UDim2.new(1,0,0,36),Position=UDim2.new(0,0,0,80),
    BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
});corner(sideGear,CORNER);ra("bT",sideGear,"BackgroundColor3")
local sideGearIco=mkIcon(sideGear,"settings",18,{Position=UDim2.new(0,14,0.5,-9),ImageColor3=T.txM,ZIndex=7})
local sideGearLbl=new("TextLabel",sideGear,{
    Size=UDim2.new(1,-44,1,0),Position=UDim2.new(0,40,0,0),BackgroundTransparency=1,
    Text="Settings",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=12,
    TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7
});ra("tM",sideGearLbl,"TextColor3")
if sideGearIco and sideGearIco:IsA("ImageLabel") then table.insert(reg.ico,{sideGearIco,"ImageColor3"}) end
sideGear.MouseButton1Click:Connect(function()
    playSFX("click")
    toggleSettings()
end)
sideGear.MouseEnter:Connect(function()
    TwS:Create(sideGear,TweenInfo.new(0.1),{BackgroundColor3=T.ac}):Play()
    if sideGearIco:IsA("ImageLabel") then TwS:Create(sideGearIco,TweenInfo.new(0.1),{ImageColor3=Color3.fromRGB(255,255,255)}):Play() end
    TwS:Create(sideGearLbl,TweenInfo.new(0.1),{TextColor3=Color3.fromRGB(255,255,255)}):Play()
end)
sideGear.MouseLeave:Connect(function()
    TwS:Create(sideGear,TweenInfo.new(0.1),{BackgroundColor3=T.bgT}):Play()
    if sideGearIco:IsA("ImageLabel") then TwS:Create(sideGearIco,TweenInfo.new(0.1),{ImageColor3=T.txM}):Play() end
    TwS:Create(sideGearLbl,TweenInfo.new(0.1),{TextColor3=T.txM}):Play()
end)

local sideEdge=new("Frame",win,{
    Size=UDim2.new(0,1,1,-HDR_H-1),Position=UDim2.new(0,SW,0,HDR_H+1),
    BackgroundColor3=T.bd,BorderSizePixel=0,BackgroundTransparency=0.6,Visible=true
});ra("bc",sideEdge,"BackgroundColor3")

local BOT_H=48
local function getCASize()
    -- when sidebar expanded, command bar is fully hidden → use full height
    local bot= (S.sideExpanded and S.navMode~="top") and 0 or BOT_H
    if S.navMode=="top" then
        return UDim2.new(1,0,1,-(HDR_H+NAV_H+14+bot)),UDim2.new(0,0,0,HDR_H+NAV_H+14)
    else
        return UDim2.new(1,-SW-1,1,-(HDR_H+1+bot)),UDim2.new(0,SW+1,0,HDR_H+1)
    end
end
local caS,caP=getCASize()
local ca2=new("Frame",win,{Size=caS,Position=caP,BackgroundTransparency=1,ClipsDescendants=true})

-- Title only (search removed — use bottom command bar)
local contentHdr=new("Frame",ca2,{Size=UDim2.new(1,0,0,34),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1})
local contTitle=new("TextLabel",contentHdr,{Size=UDim2.new(1,-20,0,22),Position=UDim2.new(0,14,0,8),BackgroundTransparency=1,
    Text=">_  commands",TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left});ra("tx",contTitle,"TextColor3")
-- ===== SEARCH POPOUT (above command bar) =====
local searchScroll=nil
local searchActive=false
local prevTabBeforeSearch=nil
local userScroll=nil
local userPanelOpen=false
local searchPop=nil
local tabC={}  -- must exist before search helpers run

local function ensureSearchPanel()
    if searchPop and searchPop.Parent then return searchPop end
    local parent = ca2 or win
    searchPop = new("Frame", parent, {
        Size = UDim2.new(1, 0, 1, -34),
        Position = UDim2.new(0, 0, 0, 34),
        BackgroundColor3 = T.bg,
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 40,
        ClipsDescendants = true,
    })
    ra("bg", searchPop, "BackgroundColor3")
    searchScroll = new("ScrollingFrame", searchPop, {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = T.ac,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ZIndex = 31,
    })
    return searchPop
end

local function hideAllContentPanels()
    -- force exclusive visibility — prevents tab/search overlap
    if type(tabC) == "table" then
        for _, t in pairs(tabC) do
            if t and t.scroll then t.scroll.Visible = false end
        end
    end
    if searchPop then searchPop.Visible = false end
    if userScroll then userScroll.Visible = false end
end

local function showOnlyTab(name)
    hideAllContentPanels()
    searchActive = false
    userPanelOpen = false
    if cmdBox and searchActive then end -- no-op, state cleared above
    if name and type(tabC) == "table" and tabC[name] and tabC[name].scroll then
        tabC[name].scroll.Visible = true
        curTab = name
        if contTitle then contTitle.Text = ">_  " .. name:lower() end
    elseif curTab and type(tabC) == "table" and tabC[curTab] and tabC[curTab].scroll then
        tabC[curTab].scroll.Visible = true
        if contTitle then contTitle.Text = ">_  " .. curTab:lower() end
    end
end

local function hideSearchPop()
    searchActive = false
    if searchPop then searchPop.Visible = false end
    -- restore only the active tab; never leave multiple scrolls on
    hideAllContentPanels()
    if curTab and type(tabC) == "table" and tabC[curTab] and tabC[curTab].scroll then
        tabC[curTab].scroll.Visible = true
        if contTitle then contTitle.Text = ">_  " .. curTab:lower() end
    end
end

local function hideSpecialPanels()
    hideSearchPop()
    userPanelOpen = false
end

local function selectTabByName(name)
    if not name or not tabC[name] then return false end
    local tab = tabC[name]
    if type(tab.select) == "function" then
        tab.select()
        return true
    elseif tab.sideBtn then
        pcall(function() tab.sideBtn.MouseButton1Click:Fire() end)
        return true
    end
    return false
end

local function openSearchPanelBlank()
    ensureSearchPanel()
    searchActive = true
    if botBar then botBar.Visible = true; botBar.BackgroundTransparency = 0 end
    if type(tabC) == "table" then
        for _, t in pairs(tabC) do
            if t and t.scroll then t.scroll.Visible = false end
        end
    end
    if userScroll then userScroll.Visible = false end
    for _, ch in ipairs(searchScroll:GetChildren()) do ch:Destroy() end
    new("TextLabel", searchScroll, {
        Size = UDim2.new(1, -12, 0, 36),
        Position = UDim2.new(0, 8, 0, 4),
        BackgroundTransparency = 1,
        ZIndex = 62,
        Text = "Type to search features…",
        TextColor3 = T.txD,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    searchScroll.CanvasSize = UDim2.new(0, 0, 0, 44)
    searchPop.Size = UDim2.new(1, 0, 1, -34)
    searchPop.Position = UDim2.new(0, 0, 0, 34)
    searchPop.Visible = true
    if contTitle then contTitle.Text = ">_  search" end
end

local function highlightFeatureFrame(frame)
    if not frame or not frame.Parent then return end
    -- remove prior highlight
    local old = frame:FindFirstChild("_chHighlight")
    if old then old:Destroy() end
    local hl = Instance.new("UIStroke")
    hl.Name = "_chHighlight"
    hl.Color = T.ac
    hl.Thickness = 2.5
    hl.Transparency = 0
    hl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hl.Parent = frame
    -- soft accent flash on bg
    local origBg = frame.BackgroundColor3
    local origTr = frame.BackgroundTransparency
    pcall(function()
        frame.BackgroundColor3 = T.ac
        frame.BackgroundTransparency = 0.82
    end)
    task.spawn(function()
        for i = 1, 8 do
            if not hl.Parent then break end
            hl.Transparency = i / 10
            task.wait(0.08)
        end
        if hl and hl.Parent then hl:Destroy() end
        pcall(function()
            if frame and frame.Parent then
                frame.BackgroundColor3 = origBg
                frame.BackgroundTransparency = origTr
            end
        end)
    end)
end

local function jumpToFeature(feat)
    if not feat then return false end
    searchActive = false
    userPanelOpen = false
    if searchPop then
        searchPop.Visible = false
        searchPop.Active = false
    end
    if cmdBox then cmdBox.Text = "" end
    local tname = feat.tab
    local frame = feat.frame
    if not tname and frame then
        for tn, tab in pairs(tabC) do
            if tab.scroll and frame.Parent and frame:IsDescendantOf(tab.scroll) then
                tname = tn
                break
            end
        end
    end
    if (not tname or not tabC[tname]) and feat.label then
        for _, f in ipairs(featureReg) do
            if f.label == feat.label and f.tab and tabC[f.tab] then
                tname = f.tab
                frame = f.frame or frame
                break
            end
        end
    end
    if not tname or not tabC[tname] then return false end
    local tab = tabC[tname]
    -- use real select so sidebar state / Move tab stays clickable
    if type(tab.select) == "function" then
        -- force switch even if already on this tab
        local prev = curTab
        curTab = nil
        searchActive = false
        tab.select()
        curTab = tname
    else
        if type(tabC) == "table" then
            for tn, t in pairs(tabC) do
                if t.scroll then t.scroll.Visible = false end
                if tn ~= tname then
                    pcall(function()
                        if t.setIcoColor then t.setIcoColor(T.txD) end
                        if t.sLbl then t.sLbl.TextColor3 = T.txD end
                        if t.sBg then t.sBg.BackgroundTransparency = 1 end
                    end)
                end
            end
        end
        if userScroll then userScroll.Visible = false end
        curTab = tname
        tab.scroll.Visible = true
        if tab.setIcoColor then tab.setIcoColor(T.ac) end
        if tab.sLbl then tab.sLbl.TextColor3 = T.ac end
        if tab.sBg then tab.sBg.BackgroundTransparency = 0.55 end
        if sideIndicator and tab.sY then
            sideIndicator.Visible = true
            sideIndicator.Position = UDim2.new(0, 0, 0, tab.sY + 8)
        end
        if contTitle then contTitle.Text = ">_  " .. tname:lower() end
    end
    task.spawn(function()
        task.wait(0.06)
        if frame and frame.Parent and tab.scroll then
            local y = frame.Position.Y.Offset
            pcall(function()
                local ay = frame.AbsolutePosition.Y - tab.scroll.AbsolutePosition.Y + tab.scroll.CanvasPosition.Y
                if typeof(ay) == "number" and ay == ay then y = ay end
            end)
            tab.scroll.CanvasPosition = Vector2.new(0, math.max(0, y - 24))
            highlightFeatureFrame(frame)
        end
    end)
    return true
end

local function runGlobalSearch(q)
    q = (q or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
    ensureSearchPanel()
    if not searchScroll then return end

    if q == "" then
        if searchActive then
            searchActive = false
            if searchPop then searchPop.Visible = false end
            if type(tabC) == "table" then
                for _, t in pairs(tabC) do
                    if t and t.scroll then t.scroll.Visible = false end
                end
            end
            if userScroll then userScroll.Visible = false end
            if curTab and tabC[curTab] and tabC[curTab].scroll then
                tabC[curTab].scroll.Visible = true
            end
            if contTitle and curTab then contTitle.Text = ">_  " .. curTab:lower() end
        end
        return
    end

    local searchTerm = q:match("^(%S+)") or q
    local results = {}
    local seen = {}
    for _, f in ipairs(featureReg) do
        if f.kind == "search" or f.kind == "cmd" then continue end
        local lbl = (f.label or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
        if lbl == "" or seen[lbl] then continue end
        if lbl:find(searchTerm, 1, true) then
            seen[lbl] = true
            results[#results + 1] = f
        end
    end
    table.sort(results, function(a, b) return #(a.label or "") < #(b.label or "") end)

    searchActive = true
    if type(tabC) == "table" then
        for _, t in pairs(tabC) do
            if t and t.scroll then t.scroll.Visible = false end
        end
    end
    if userScroll then userScroll.Visible = false end
    userPanelOpen = false
    if botBar then botBar.Visible = true end
    if contTitle then contTitle.Text = ">_  search" end

    for _, ch in ipairs(searchScroll:GetChildren()) do ch:Destroy() end
    local Y = 8
    new("TextLabel", searchScroll, {
        Size = UDim2.new(1, -16, 0, 18),
        Position = UDim2.new(0, 10, 0, Y),
        BackgroundTransparency = 1,
        ZIndex = 62,
        Text = (#results == 0 and "No matches" or (#results .. " features")) .. ' · "' .. q .. '"',
        TextColor3 = T.txM,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    Y = Y + 24

    if #results == 0 then
        new("TextLabel", searchScroll, {
            Size = UDim2.new(1, -16, 0, 22),
            Position = UDim2.new(0, 10, 0, Y),
            BackgroundTransparency = 1,
            ZIndex = 62,
            Text = "Try: fly, esp, aimbot, speed, jump…",
            TextColor3 = T.txD,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        Y = Y + 28
    else
        for i, f in ipairs(results) do
            if i > 80 then break end
            local kind = f.kind or "feature"

            if kind == "toggle" and f.set and f.get then
                local row = new("Frame", searchScroll, {
                    Size = UDim2.new(1, -16, 0, 40),
                    Position = UDim2.new(0, 8, 0, Y),
                    BackgroundColor3 = T.bgT,
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    ZIndex = 62,
                })
                corner(row, 8)
                local lblTxt = f.label or "?"
                if f.bindKey and S.keybinds[f.bindKey] and typeof(S.keybinds[f.bindKey])=="EnumItem" then
                    lblTxt = lblTxt .. "  [" .. S.keybinds[f.bindKey].Name .. "]"
                end
                local nameLbl = new("TextLabel", row, {
                    Size = UDim2.new(1, -130, 1, 0),
                    Position = UDim2.new(0, 12, 0, 0),
                    BackgroundTransparency = 1,
                    ZIndex = 63,
                    Text = lblTxt,
                    TextColor3 = T.tx,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                })
                -- pin
                local pinBtn = new("TextButton", row, {
                    Size = UDim2.new(0, 22, 0, 22),
                    Position = UDim2.new(1, -120, 0.5, -11),
                    BackgroundTransparency = 1, Text = "", ZIndex = 66,
                })
                local pinIco = mkIcon(pinBtn, "star", 13, {Position=UDim2.new(0.5,-6.5,0.5,-6.5),ImageColor3=T.txD,ZIndex=67})
                pinBtn.MouseButton1Click:Connect(function()
                    playSFX("click", 0.2)
                    local pinned = pinFeatureByName(f.label, f.togRef or {u=f.set,get=f.get,label=f.label,bindKey=f.bindKey})
                    if pinIco:IsA("ImageLabel") then pinIco.ImageColor3 = pinned and T.wn or T.txD end
                end)
                -- keybind
                local kbBtn = new("TextButton", row, {
                    Size = UDim2.new(0, 22, 0, 22),
                    Position = UDim2.new(1, -96, 0.5, -11),
                    BackgroundTransparency = 1, Text = "", ZIndex = 66,
                })
                local kbIco = mkIcon(kbBtn, "pencil", 12, {Position=UDim2.new(0.5,-6,0.5,-6),ImageColor3=T.txD,ZIndex=67})
                kbBtn.MouseButton1Click:Connect(function()
                    if not f.bindKey then
                        -- create a synthetic bind key from label
                        f.bindKey = (f.label or "feat"):lower():gsub("%s+","_")
                    end
                    nameLbl.Text = (f.label or "?") .. "  […]"
                    playSFX("click", 0.2)
                    local conn
                    conn = UIS.InputBegan:Connect(function(inp, gp)
                        if gp then return end
                        if inp.UserInputType == Enum.UserInputType.Keyboard then
                            if inp.KeyCode == Enum.KeyCode.Escape then
                                S.keybinds[f.bindKey] = nil
                                nameLbl.Text = f.label or "?"
                                conn:Disconnect()
                                showPopup("Keybind", (f.label or "?") .. " unbound", T.txM)
                                return
                            end
                            S.keybinds[f.bindKey] = inp.KeyCode
                            nameLbl.Text = (f.label or "?") .. "  [" .. inp.KeyCode.Name .. "]"
                            conn:Disconnect()
                            playSFX("toggle_on")
                            showPopup("Keybind", (f.label or "?") .. " → " .. inp.KeyCode.Name, T.ok)
                            CHQueueSave()
                        end
                    end)
                end)
                local on = false
                pcall(function() on = f.get() and true or false end)
                local pill = new("Frame", row, {
                    Size = UDim2.new(0, 44, 0, 22),
                    Position = UDim2.new(1, -54, 0.5, -11),
                    BackgroundColor3 = on and T.ac or T.off,
                    BorderSizePixel = 0,
                    ZIndex = 63,
                })
                corner(pill, 11)
                local knob = new("Frame", pill, {
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = UDim2.new(0, on and 24 or 2, 0.5, -9),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 64,
                })
                corner(knob, 9)
                local btn = new("TextButton", row, {
                    Size = UDim2.new(1, -130, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    ZIndex = 65,
                })
                btn.MouseButton1Click:Connect(function()
                    local cur = false
                    pcall(function() cur = f.get() and true or false end)
                    local nx = not cur
                    pcall(function() f.set(nx) end)
                    on = nx
                    TwS:Create(pill, TweenInfo.new(0.12), {BackgroundColor3 = on and T.ac or T.off}):Play()
                    TwS:Create(knob, TweenInfo.new(0.12), {Position = UDim2.new(0, on and 24 or 2, 0.5, -9)}):Play()
                    playSFX(on and "toggle_on" or "toggle_off")
                    if type(showToggleNotif) == "function" then
                        showToggleNotif(f.label, on)
                    else
                        showPopup(f.label, on and "ON" or "OFF", on and T.ok or T.txM)
                    end
                end)
                Y = Y + 44

            elseif kind == "slider" and f.set then
                local row = new("Frame", searchScroll, {
                    Size = UDim2.new(1, -16, 0, 48),
                    Position = UDim2.new(0, 8, 0, Y),
                    BackgroundColor3 = T.bgT,
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    ZIndex = 62,
                })
                corner(row, 8)
                new("TextLabel", row, {
                    Size = UDim2.new(0.5, 0, 0, 18),
                    Position = UDim2.new(0, 12, 0, 4),
                    BackgroundTransparency = 1,
                    ZIndex = 63,
                    Text = f.label or "?",
                    TextColor3 = T.tx,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                local cur = f.get and f.get() or (f.min or 0)
                local valLbl = new("TextLabel", row, {
                    Size = UDim2.new(0.4, 0, 0, 18),
                    Position = UDim2.new(0.55, 0, 0, 4),
                    BackgroundTransparency = 1,
                    ZIndex = 63,
                    Text = tostring(cur),
                    TextColor3 = T.ac,
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
                local track = new("Frame", row, {
                    Size = UDim2.new(1, -24, 0, 6),
                    Position = UDim2.new(0, 12, 0, 28),
                    BackgroundColor3 = T.off,
                    BorderSizePixel = 0,
                    ZIndex = 63,
                })
                corner(track, 3)
                local mn = f.min or 0
                local mx = f.max or 100
                local pct = (mx ~= mn) and mcl((cur - mn) / (mx - mn), 0, 1) or 0
                local fill = new("Frame", track, {
                    Size = UDim2.new(pct, 0, 1, 0),
                    BackgroundColor3 = T.ac,
                    BorderSizePixel = 0,
                    ZIndex = 64,
                })
                corner(fill, 3)
                local dragging = false
                local function setFromX(x)
                    local rel = mcl(x / math.max(track.AbsoluteSize.X, 1), 0, 1)
                    local v = mn + (mx - mn) * rel
                    v = mfl(v + 0.5)
                    pcall(function() f.set(v) end)
                    valLbl.Text = tostring(v)
                    fill.Size = UDim2.new(rel, 0, 1, 0)
                end
                track.InputBegan:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        setFromX(inp.Position.X - track.AbsolutePosition.X)
                    end
                end)
                UIS.InputEnded:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
                end)
                UIS.InputChanged:Connect(function(inp)
                    if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
                        setFromX(inp.Position.X - track.AbsolutePosition.X)
                    end
                end)
                Y = Y + 52

            else
                local row = new("TextButton", searchScroll, {
                    Size = UDim2.new(1, -16, 0, 34),
                    Position = UDim2.new(0, 8, 0, Y),
                    BackgroundColor3 = T.bgT,
                    BackgroundTransparency = 0.15,
                    Text = "",
                    BorderSizePixel = 0,
                    ZIndex = 62,
                })
                corner(row, 8)
                local tabHint = f.tab and ("  ·  " .. f.tab) or ""
                new("TextLabel", row, {
                    Size = UDim2.new(1, -20, 1, 0),
                    Position = UDim2.new(0, 12, 0, 0),
                    BackgroundTransparency = 1,
                    ZIndex = 63,
                    Text = (f.label or "?") .. tabHint,
                    TextColor3 = T.tx,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                })
                row.MouseButton1Click:Connect(function()
                    playSFX("click")
                    if f.run then
                        pcall(f.run)
                        showPopup(f.label or "Feature", "Activated", T.ac)
                    elseif f.set then
                        local cur = f.get and f.get() or false
                        pcall(function() f.set(not cur) end)
                        showPopup(f.label or "Feature", "Toggled", T.ac)
                    elseif type(jumpToFeature) == "function" then
                        jumpToFeature(f)
                    end
                end)
                Y = Y + 38
            end
        end
    end

    searchScroll.CanvasSize = UDim2.new(0, 0, 0, Y + 16)
    searchPop.Size = UDim2.new(1, 0, 1, -34)
    searchPop.Position = UDim2.new(0, 0, 0, 34)
    searchPop.Visible = true
    searchPop.Active = true
    searchScroll.Size = UDim2.new(1, 0, 1, 0)
    searchScroll.Position = UDim2.new(0, 0, 0, 0)
end

-- Adjust scrolls to start below contentHdr (title only)
-- tabC declared above search helpers
local function updateScrollPos()
    if not tabC then return end
    for _,t in pairs(tabC) do
        if t and t.scroll then
            t.scroll.Size=UDim2.new(1,0,1,-34)
            t.scroll.Position=UDim2.new(0,0,0,34)
        end
    end
    if searchPop and searchPop.Parent and searchPop.Visible then
        searchPop.Size=UDim2.new(1,0,1,-34)
        searchPop.Position=UDim2.new(0,0,0,34)
    end
    if userScroll and userScroll.Parent then
        userScroll.Size=UDim2.new(1,0,1,-34)
        userScroll.Position=UDim2.new(0,0,0,34)
    end
end

-- Bottom command bar like the image
local botBar=new("Frame",win,{
    Size=UDim2.new(1,-SW-1,0,BOT_H-8),Position=UDim2.new(0,SW+1,1,-(BOT_H-4)),
    BackgroundColor3=T.bgS,BackgroundTransparency=0.1,BorderSizePixel=0
});corner(botBar,CORNER);ra("bS",botBar,"BackgroundColor3")
local cmdIco=new("TextLabel",botBar,{Size=UDim2.new(0,24,0,24),Position=UDim2.new(0,10,0.5,-12),BackgroundTransparency=1,
    Text=">_",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=14});ra("ac",cmdIco,"TextColor3")
local cmdBox=new("TextBox",botBar,{Size=UDim2.new(1,-80,0,28),Position=UDim2.new(0,36,0.5,-14),
    BackgroundColor3=T.bgT,BackgroundTransparency=0.3,Text="",PlaceholderText="search features...",PlaceholderColor3=T.txD,
    TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,BorderSizePixel=0})
corner(cmdBox,CORNER);ra("bT",cmdBox,"BackgroundColor3");ra("tx",cmdBox,"TextColor3")
local cmdGo=new("TextButton",botBar,{Size=UDim2.new(0,32,0,28),Position=UDim2.new(1,-40,0.5,-14),
    BackgroundColor3=T.ac,Text="▶",TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.GothamBold,TextSize=12,BorderSizePixel=0})
corner(cmdGo,CORNER);ra("ac",cmdGo,"BackgroundColor3")
cmdBox:GetPropertyChangedSignal("Text"):Connect(function()
    runGlobalSearch(cmdBox.Text)
end)
cmdBox.Focused:Connect(function()
    openSearchPanelBlank()
end)
cmdBox.PlaceholderText="  search features / commands..."
cmdGo.MouseButton1Click:Connect(function()
    local t=cmdBox.Text
    if t~="" then
        playSFX("click")
        -- try command exec first, else search/filter
        if type(execCmd)=="function" then
            if not execCmd(t) then runGlobalSearch(t) end
        else
            runGlobalSearch(t)
        end
        cmdBox.Text=""
    end
end)
cmdBox.FocusLost:Connect(function(enter)
    if enter then cmdGo.MouseButton1Click:Fire() end
end)

local nf=new("Frame",sg,{Size=UDim2.new(0,330,0,64),AnchorPoint=Vector2.new(.5,0),
    Position=UDim2.new(.5,0,0,-80),BackgroundColor3=Color3.fromRGB(12,10,18),
    BorderSizePixel=0,ZIndex=20,Visible=false,BackgroundTransparency=0.08})
corner(nf,10);new("UIStroke",nf,{Color=T.wn,Thickness=1})
do
    new("Frame",nf,{Size=UDim2.new(0,3,1,-14),Position=UDim2.new(0,10,0,7),BackgroundColor3=T.wn,BorderSizePixel=0,ZIndex=21})
    new("TextLabel",nf,{Size=UDim2.new(1,-32,0,18),Position=UDim2.new(0,20,0,7),BackgroundTransparency=1,
        Text="Fire RPG into ground first",TextColor3=T.wn,Font=Enum.Font.GothamBold,TextSize=12,
        TextXAlignment=Enum.TextXAlignment.Left,ZIndex=21})
    new("TextLabel",nf,{Size=UDim2.new(1,-32,0,26),Position=UDim2.new(0,20,0,28),BackgroundTransparency=1,
        Text="Shoot the RPG once to initialise the remote.",
        TextColor3=Color3.fromRGB(175,165,210),Font=Enum.Font.Gotham,TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,ZIndex=21})
end
local nfA=false
local function showNotif()
    if nfA then return end;nfA=true;nf.Visible=true;nf.Position=UDim2.new(.5,0,0,-80)
    TwS:Create(nf,TweenInfo.new(.28,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(.5,0,0,10)}):Play()
    task.delay(4,function()
        TwS:Create(nf,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(.5,0,0,-80)}):Play()
        task.wait(.25);nf.Visible=false;nfA=false
    end)
end

-- ===== Custom bottom-right popup notifications =====
local toggleNotifQueue = {}
local function showPopup(title, subtitle, accent)
    rawset(_G,"CH_showPopup",showPopup)
    if not S.customNotifications then return end
    if S._suppressNotifs then
        local t=tostring(title or ""):lower()
        if not t:find("chudhub loaded",1,true) then return end
    end
    accent = accent or T.ac
    local baseY = 12 + #toggleNotifQueue * 56
    local notif = new("Frame",sg,{
        Size=UDim2.new(0,240,0,50),
        AnchorPoint=Vector2.new(1,1),
        Position=UDim2.new(1,260,1,-baseY),
        BackgroundColor3=T.bgS,
        BackgroundTransparency=0.08,
        BorderSizePixel=0,
        ZIndex=95,
    })
    corner(notif,8)
    local stroke=mkStroke(notif,accent,1.2)
    -- left accent bar
    local bar=new("Frame",notif,{
        Size=UDim2.new(0,3,1,-8),Position=UDim2.new(0,4,0,4),
        BackgroundColor3=accent,BorderSizePixel=0,ZIndex=96
    });corner(bar,2)
    local tLbl=new("TextLabel",notif,{
        Size=UDim2.new(1,-20,0,18),Position=UDim2.new(0,14,0,8),
        BackgroundTransparency=1,Text=title or "",
        TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=13,
        TextXAlignment=Enum.TextXAlignment.Left,ZIndex=96
    })
    local sLbl=new("TextLabel",notif,{
        Size=UDim2.new(1,-20,0,16),Position=UDim2.new(0,14,0,26),
        BackgroundTransparency=1,Text=subtitle or "",
        TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left,ZIndex=96
    })
    table.insert(toggleNotifQueue, notif)
    -- slide in from right
    TwS:Create(notif,TweenInfo.new(0.28,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
        Position=UDim2.new(1,-14,1,-baseY)
    }):Play()
    playSFX("notify",0.35)
    task.delay(2.6, function()
        if notif and notif.Parent then
            TwS:Create(notif,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
                Position=UDim2.new(1,260,1,-baseY),BackgroundTransparency=1
            }):Play()
            TwS:Create(tLbl,TweenInfo.new(0.2),{TextTransparency=1}):Play()
            TwS:Create(sLbl,TweenInfo.new(0.2),{TextTransparency=1}):Play()
            if stroke then TwS:Create(stroke,TweenInfo.new(0.2),{Transparency=1}):Play() end
            task.wait(0.28)
            notif:Destroy()
            for i,v in ipairs(toggleNotifQueue) do
                if v==notif then table.remove(toggleNotifQueue,i); break end
            end
        end
    end)
end
local function showToggleNotif(feature, state)
    showPopup(feature, state and "Enabled" or "Disabled", state and T.ok or T.ng)
end
UIS.InputBegan:Connect(function(inp,gp)
    if S.hasShot or gp then return end
    if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end
    local w=getRPG();if w and w.Parent==plr.Character then S.hasShot=true end
end)

-- Load banner (bottom-right popup instead of chat)
task.spawn(function()
    task.wait(1.4)
    showPopup("ChudHub Loaded",CH_VERSION.."  ·  by Proxy Phalanxs",T.ac)
    task.delay(0.6,function() S._suppressNotifs=false end)
end)

local function mkSL(par,y,txt)
    local r=new("Frame",par,{Size=UDim2.new(1,-PAD*2,0,SEC_H),Position=UDim2.new(0,PAD,0,y),BackgroundTransparency=1})
    local l=new("TextLabel",r,{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=txt:upper(),
        TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=10,
        TextXAlignment=Enum.TextXAlignment.Left});ra("tM",l,"TextColor3")
    -- accent gradient underline wave
    local und=new("Frame",r,{Size=UDim2.new(0,0,0,2),Position=UDim2.new(0,0,0,18),BackgroundColor3=T.ac,BorderSizePixel=0})
    corner(und,1)
    table.insert(reg.accentLines,und)
    local ug=Instance.new("UIGradient")
    ug.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,T.ac),
        ColorSequenceKeypoint.new(0.45,Color3.new(math.min(1,T.ac.R*1.4),math.min(1,T.ac.G*1.4),math.min(1,T.ac.B*1.4))),
        ColorSequenceKeypoint.new(1,Color3.new(T.ac.R*0.35,T.ac.G*0.35,T.ac.B*0.35))
    })
    ug.Parent=und
    task.defer(function()
        TwS:Create(und,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(0.35,0,0,2)}):Play()
    end)
    r.MouseEnter:Connect(function()
        TwS:Create(l,TweenInfo.new(0.2),{TextColor3=T.ac}):Play()
        TwS:Create(und,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{Size=UDim2.new(0.55,0,0,2)}):Play()
    end)
    r.MouseLeave:Connect(function()
        TwS:Create(l,TweenInfo.new(0.2),{TextColor3=T.txM}):Play()
        TwS:Create(und,TweenInfo.new(0.25),{Size=UDim2.new(0.35,0,0,2)}):Play()
    end)
    local sep=new("Frame",r,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=T.bd,BackgroundTransparency=0.55,BorderSizePixel=0});ra("bc",sep,"BackgroundColor3")
    return r
end

local function pinFeatureByName(name,togRef)
    S.pinnedFrames=S.pinnedFrames or {}
    if S.pinnedFrames[name] then
        -- unpin
        pcall(function() S.pinnedFrames[name]:Destroy() end)
        S.pinnedFrames[name]=nil
        showPopup("Pin",name.." unpinned",T.txM)
        return false
    end
    local count=0;for _ in pairs(S.pinnedFrames) do count=count+1 end
    local pf=new("Frame",sg,{
        Size=UDim2.new(0,180,0,52),Position=UDim2.new(0,16,0,80+count*60),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.08,BorderSizePixel=0,ZIndex=80
    });corner(pf,8);mkStroke(pf,T.ac,1)
    new("TextLabel",pf,{Size=UDim2.new(1,-28,0,18),Position=UDim2.new(0,8,0,4),BackgroundTransparency=1,
        Text=name,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
    local xBtn=new("TextButton",pf,{Size=UDim2.new(0,20,0,20),Position=UDim2.new(1,-24,0,4),BackgroundTransparency=1,Text="×",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=14})
    xBtn.MouseButton1Click:Connect(function() pf:Destroy();S.pinnedFrames[name]=nil end)
    if togRef and togRef.u then
        local st=new("TextButton",pf,{Size=UDim2.new(1,-16,0,24),Position=UDim2.new(0,8,0,24),
            BackgroundColor3=T.bgT,Text="Toggle",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,BorderSizePixel=0})
        corner(st,6)
        st.MouseButton1Click:Connect(function()
            local cur=togRef.get and togRef.get() or false
            togRef.u(not cur)
        end)
    end
    -- drag
    local dragging,ds,sp
    pf.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true;ds=inp.Position;sp=pf.Position
            local c;c=UIS.InputChanged:Connect(function(i)
                if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
                    local d=i.Position-ds
                    pf.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
                end
            end)
            local e;e=UIS.InputEnded:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false;if c then c:Disconnect() end;if e then e:Disconnect() end end
            end)
        end
    end)
    S.pinnedFrames[name]=pf
    showPopup("Pin",name.." pinned",T.ok)
    return true
end

local function mkTog(par,y,cfg)
    local h=TOG_H
    local c=new("Frame",par,{Size=UDim2.new(1,-PAD*2,0,h),Position=UDim2.new(0,PAD,0,y),
        BackgroundColor3=T.bgT,BackgroundTransparency=0.12,BorderSizePixel=0})
    corner(c,CORNER);mkStroke(c,T.bd,1)
    local baseLabel=(cfg.label or ""):gsub("%s*%[.-%]$",""):gsub("%s+$","")
    local function keySuffix()
        if not cfg.bindKey then return "" end
        local kn=S.keybinds[cfg.bindKey]
        if kn and typeof(kn)=="EnumItem" and kn.Name~="Unknown" then return "  ["..kn.Name.."]" end
        return ""
    end
    local l=new("TextLabel",c,{Size=UDim2.new(1,-110,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,TextColor3=T.tx,
        Font=Enum.Font.Gotham,TextSize=12,Text=baseLabel..keySuffix(),TextXAlignment=Enum.TextXAlignment.Left});ra("tx",l,"TextColor3")
    -- star (pin) button
    local starBtn=new("TextButton",c,{Size=UDim2.new(0,18,0,18),Position=UDim2.new(1,-28,0.5,-9),BackgroundTransparency=1,Text="",ZIndex=4})
    local star=mkIcon(starBtn,"star",14,{Position=UDim2.new(0.5,-7,0.5,-7),ImageColor3=T.txD,ZIndex=2})
    local pencilBtn=new("TextButton",c,{Size=UDim2.new(0,18,0,18),Position=UDim2.new(1,-48,0.5,-9),BackgroundTransparency=1,Text="",ZIndex=4})
    local pencil=mkIcon(pencilBtn,"pencil",13,{Position=UDim2.new(0.5,-6.5,0.5,-6.5),ImageColor3=T.txD,ZIndex=2})
    local slash=new("TextLabel",c,{Size=UDim2.new(0,12,0,16),Position=UDim2.new(1,-62,0.5,-8),BackgroundTransparency=1,
        Text="/",TextColor3=T.txD,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Center})
    local tf=new("Frame",c,{Size=UDim2.new(0,34,0,18),Position=UDim2.new(1,-102,.5,-9),
        BackgroundColor3=T.off,BorderSizePixel=0});corner(tf,9)
    local ci=new("Frame",tf,{Size=UDim2.new(0,14,0,14),Position=UDim2.new(0,2,.5,-7),
        BackgroundColor3=T.txD,BorderSizePixel=0});corner(ci,7)
    local en=cfg.default
    -- always live accent so theme switches update switches immediately
    local function getCol() return T.ac end
    table.insert(reg.tog,{f=tf,c=ci,on=function() return en and getCol() or T.off end,cn=function() return en and T.bg or T.txD end})
    ra("bT",c,"BackgroundColor3")
    local function refreshLabel()
        l.Text=baseLabel..keySuffix()
    end
    local function upd(v,sk)
        en=v
        local gp=en and UDim2.new(1,-16,.5,-7) or UDim2.new(0,2,.5,-7)
        local gb=en and getCol() or T.off;local gc=en and T.bg or T.txD
        if sk then ci.Position=gp;ci.BackgroundColor3=gc;tf.BackgroundColor3=gb
        else
            TwS:Create(ci,TweenInfo.new(0.12),{Position=gp,BackgroundColor3=gc}):Play()
            TwS:Create(tf,TweenInfo.new(0.12),{BackgroundColor3=gb}):Play()
            playSFX(en and "toggle_on" or "toggle_off")
            showToggleNotif(baseLabel, en)
        end
        if cfg.cb then cfg.cb(en) end
    end
    local togRef={u=upd,get=function() return en end,refreshLabel=refreshLabel,label=baseLabel,bindKey=cfg.bindKey}
    -- star: pin/unpin feature
    starBtn.MouseButton1Click:Connect(function()
        playSFX("click",0.2)
        local pinned=pinFeatureByName(baseLabel,togRef)
        if star:IsA("ImageLabel") then
            star.ImageColor3=pinned and T.wn or T.txD
        end
    end)
    -- pencil: rebind key (always available if bindKey provided; creates slot if nil)
    if cfg.bindKey then
        local listening=false
        pencilBtn.MouseButton1Click:Connect(function()
            if listening then return end
            listening=true
            l.Text=baseLabel.."  […]"
            playSFX("click",0.2)
            local conn
            conn=UIS.InputBegan:Connect(function(inp,gp)
                if gp then return end
                if inp.UserInputType==Enum.UserInputType.Keyboard then
                    if inp.KeyCode==Enum.KeyCode.Escape then
                        -- clear bind
                        S.keybinds[cfg.bindKey]=nil
                        listening=false;conn:Disconnect();refreshLabel()
                        showPopup("Keybind",baseLabel.." unbound",T.txM)
                        CHQueueSave();return
                    end
                    -- prevent binding UI keys
                    if inp.KeyCode==S.keybinds.menuToggle or inp.KeyCode==S.keybinds.minimize then
                        showPopup("Keybind","Reserved for UI",T.wn)
                        listening=false;conn:Disconnect();refreshLabel();return
                    end
                    S.keybinds[cfg.bindKey]=inp.KeyCode
                    listening=false;conn:Disconnect()
                    refreshLabel()
                    playSFX("toggle_on")
                    showPopup("Keybind",baseLabel.." → "..inp.KeyCode.Name,T.ok)
                    CHQueueSave()
                end
            end)
        end)
    end
    new("TextButton",tf,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""}).MouseButton1Click:Connect(function() upd(not en) end)
    local clicker=new("TextButton",c,{Size=UDim2.new(1,-108,1,0),BackgroundTransparency=1,Text="",ZIndex=3})
    clicker.MouseButton1Click:Connect(function() upd(not en) end)
    -- hover (instant leave so fast mouse moves don't leave stuck state)
    local st0=c:FindFirstChildOfClass("UIStroke")
    local hovered=false
    local function hoverOn()
        hovered=true
        c.BackgroundTransparency=0
        if st0 then st0.Color=T.ac; st0.Transparency=0.2 end
        l.TextColor3=T.ac
    end
    local function hoverOff()
        hovered=false
        c.BackgroundTransparency=0.12
        if st0 then st0.Color=T.bd; st0.Transparency=0 end
        l.TextColor3=T.tx
    end
    c.MouseEnter:Connect(hoverOn)
    c.MouseLeave:Connect(hoverOff)
    clicker.MouseEnter:Connect(hoverOn)
    clicker.MouseLeave:Connect(hoverOff)
    clicker.MouseButton1Down:Connect(function()
        if hovered then c.BackgroundTransparency=0.22 end
    end)
    clicker.MouseButton1Up:Connect(function()
        if hovered then c.BackgroundTransparency=0 end
    end)
    upd(cfg.default,true)
    regFeature({label=baseLabel,frame=c,kind="toggle",set=upd,get=function() return en end,bindKey=cfg.bindKey,refreshLabel=refreshLabel,togRef=togRef})
    return{t=c,u=upd,label=l,refreshLabel=refreshLabel,get=function() return en end}
end

local function mkSl(par,y,cfg)
    local h=SL_H
    local c=new("Frame",par,{Size=UDim2.new(1,-PAD*2,0,h),Position=UDim2.new(0,PAD,0,y),
        BackgroundColor3=T.bgT,BackgroundTransparency=0.08,BorderSizePixel=0})
    corner(c,CORNER);mkStroke(c,T.bd,1);ra("bT",c,"BackgroundColor3")
    local l=new("TextLabel",c,{Size=UDim2.new(.58,0,0,16),Position=UDim2.new(0,12,0,5),BackgroundTransparency=1,TextColor3=T.tx,
        Font=Enum.Font.Gotham,TextSize=12,Text=cfg.label,TextXAlignment=Enum.TextXAlignment.Left});ra("tx",l,"TextColor3")
    local vl2=new("TextLabel",c,{Size=UDim2.new(.42,-12,0,16),Position=UDim2.new(.58,0,0,5),BackgroundTransparency=1,
        TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Right});ra("ac",vl2,"TextColor3")
    local trk=new("Frame",c,{Position=UDim2.new(0,12,0,26),Size=UDim2.new(1,-24,0,5),
        BackgroundColor3=T.off,BorderSizePixel=0});corner(trk,3);ra("tr",trk,"BackgroundColor3")
    local fi=new("Frame",trk,{Size=UDim2.new(0,0,1,0),BackgroundColor3=T.ac,BorderSizePixel=0});corner(fi,3);ra("ac",fi,"BackgroundColor3")
    local th=new("Frame",trk,{Size=UDim2.new(0,12,0,12),AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(0,0,.5,0),BackgroundColor3=T.ac,ZIndex=2,BorderSizePixel=0});corner(th,6);ra("ac",th,"BackgroundColor3")
    new("UIStroke",th,{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.5})
    local sf=cfg.suffix or ""
    local curVal=cfg.default
    local function sv(nv,silent)
        local v=mcl(mfl(nv),cfg.min,cfg.max);local n=(v-cfg.min)/(cfg.max-cfg.min)
        fi.Size=UDim2.new(n,0,1,0);th.Position=UDim2.new(n,0,.5,0);vl2.Text=tostring(v)..sf;curVal=v
        if cfg.cb then cfg.cb(v) end
        if not silent then playSFX("slider",0.15) end
    end
    trk.InputBegan:Connect(function(inp)
        if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end
        playSFX("click",0.2)
        local function ox(x) local r2=mcl((x-trk.AbsolutePosition.X)/trk.AbsoluteSize.X,0,1);sv(cfg.min+r2*(cfg.max-cfg.min),true) end
        ox(UIS:GetMouseLocation().X);local mc2,ec
        mc2=UIS.InputChanged:Connect(function(mi) if mi.UserInputType==Enum.UserInputType.MouseMovement then ox(mi.Position.X) end end)
        ec=UIS.InputEnded:Connect(function(ei) if ei.UserInputType==Enum.UserInputType.MouseButton1 then mc2:Disconnect();ec:Disconnect();playSFX("slider",0.2) end end)
    end);sv(cfg.default,true)
    regFeature({label=cfg.label,frame=c,kind="slider",set=sv,get=function() return curVal end,min=cfg.min,max=cfg.max})
    return{s=c,u=sv}
end

local function mkBtn(par,y,txt,cb2,danger)
    local bg=danger and T.ng or T.bgT
    local b=new("TextButton",par,{Size=UDim2.new(1,-PAD*2,0,36),Position=UDim2.new(0,PAD,0,y),
        BackgroundColor3=bg,BackgroundTransparency=0.08,TextColor3=T.tx,Font=Enum.Font.GothamMedium,TextSize=12,Text=txt,BorderSizePixel=0})
    corner(b,CORNER)
    local st=mkStroke(b,danger and T.ng or T.bd,1)
    if not danger then ra("bT",b,"BackgroundColor3") end
    ra("tx",b,"TextColor3")
    b.MouseEnter:Connect(function()
        b.BackgroundTransparency=0
        b.BackgroundColor3=danger and T.ng or T.ac
        b.TextColor3=Color3.fromRGB(255,255,255)
        if st then st.Color=T.ac end
        playSFX("hover",0.08)
    end)
    b.MouseLeave:Connect(function()
        b.BackgroundTransparency=0.08
        b.BackgroundColor3=danger and T.ng or T.bgT
        b.TextColor3=T.tx
        if st then st.Color=danger and T.ng or T.bd end
    end)
    b.MouseButton1Click:Connect(function() playSFX("click");cb2() end)
    regFeature({label=txt,frame=b,kind="button"})
    return b
end

-- Proper dropdown (replaces cycling button lists)
local function mkDropdown(par,y,label,options,default,onChange)
    local wrap=new("Frame",par,{Size=UDim2.new(1,-PAD*2,0,52),Position=UDim2.new(0,PAD,0,y),BackgroundTransparency=1,ZIndex=5})
    local ddLbl=new("TextLabel",wrap,{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,
        Text=label,TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left});ra("tM",ddLbl,"TextColor3")
    local idx=1
    for i,o in ipairs(options) do if o==default then idx=i break end end
    local btn=new("TextButton",par,{
        Size=UDim2.new(1,-PAD*2,0,32),Position=UDim2.new(0,PAD,0,y+16),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.GothamMedium,TextSize=12,
        Text=options[idx] or "?",BorderSizePixel=0,TextXAlignment=Enum.TextXAlignment.Left,
        AutoButtonColor=false,ZIndex=6,Active=true
    });corner(btn,CORNER)
    local bst=mkStroke(btn,T.bd,1)
    new("UIPadding",btn,{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,30)})
    ra("bT",btn,"BackgroundColor3");ra("tx",btn,"TextColor3")
    local chev=mkIcon(btn,"chevron-down",14,{
        Position=UDim2.new(1,-22,0.5,-7),ImageColor3=T.txM,ZIndex=7
    })
    btn.MouseEnter:Connect(function()
        TwS:Create(btn,TweenInfo.new(0.12),{BackgroundColor3=T.bgS}):Play()
        if bst then TwS:Create(bst,TweenInfo.new(0.12),{Color=T.ac}):Play() end
    end)
    btn.MouseLeave:Connect(function()
        TwS:Create(btn,TweenInfo.new(0.12),{BackgroundColor3=T.bgT}):Play()
        if bst then TwS:Create(bst,TweenInfo.new(0.12),{Color=T.bd}):Play() end
    end)
    local open=false
    local menu=nil
    local awayConn=nil
    local function closeMenu()
        open=false
        if awayConn then awayConn:Disconnect();awayConn=nil end
        if menu then menu:Destroy();menu=nil end
        if chev and chev:IsA("GuiObject") then
            pcall(function() TwS:Create(chev,TweenInfo.new(0.15),{Rotation=0}):Play() end)
        end
    end
    btn.MouseButton1Click:Connect(function()
        playSFX("click",0.2)
        if open then closeMenu();return end
        open=true
        if chev and chev:IsA("GuiObject") then
            pcall(function() TwS:Create(chev,TweenInfo.new(0.15),{Rotation=180}):Play() end)
        end
        local itemH=28
        local maxH=math.min(#options*itemH+10, 200)
        local abs=btn.AbsolutePosition
        local abss=btn.AbsoluteSize
        local inset=Vector2.new(0,0)
        pcall(function() inset=game:GetService("GuiService"):GetGuiInset() end)
        -- AbsolutePosition is inset-aware for ScreenGui; mouse is not — normalize
        local host=sg
        local screenH=(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y) or 600
        local openUp=(abs.Y+abss.Y+maxH+12) > (screenH-24)
        local menuY=openUp and (abs.Y-maxH-4) or (abs.Y+abss.Y+4)
        menu=new("ScrollingFrame",host,{
            Size=UDim2.new(0,math.max(abss.X,120),0,maxH),
            Position=UDim2.new(0,abs.X,0,menuY),
            BackgroundColor3=T.bg,BorderSizePixel=0,ZIndex=1000,
            ScrollBarThickness=3,ScrollBarImageColor3=T.ac,
            CanvasSize=UDim2.new(0,0,0,#options*itemH+8),
            ClipsDescendants=true,Active=true,Selectable=true
        });corner(menu,8)
        mkStroke(menu,T.ac,1.2)
        for i,opt in ipairs(options) do
            local selected=(i==idx)
            local row=new("TextButton",menu,{
                Size=UDim2.new(1,-10,0,itemH-2),Position=UDim2.new(0,5,0,5+(i-1)*itemH),
                BackgroundColor3=selected and T.ac or T.bgT,
                BackgroundTransparency=selected and 0.3 or 0.45,
                Text=opt,TextColor3=T.tx,
                Font=Enum.Font.Gotham,TextSize=12,BorderSizePixel=0,ZIndex=1001,
                TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,Active=true
            });corner(row,5)
            new("UIPadding",row,{PaddingLeft=UDim.new(0,10)})
            row.MouseEnter:Connect(function()
                if i~=idx then row.BackgroundTransparency=0.2; row.BackgroundColor3=T.bgS end
            end)
            row.MouseLeave:Connect(function()
                if i~=idx then row.BackgroundTransparency=0.45; row.BackgroundColor3=T.bgT end
            end)
            row.MouseButton1Click:Connect(function()
                idx=i
                btn.Text=opt
                closeMenu()
                playSFX("click")
                if onChange then onChange(opt,i) end
            end)
        end
        -- delayed click-away so the open click doesn't immediately close
        task.delay(0.25, function()
            if not open then return end
            awayConn=UIS.InputBegan:Connect(function(inp)
                if not open or not menu or not menu.Parent then return end
                if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end
                local m=UIS:GetMouseLocation()
                local inset=Vector2.zero
                pcall(function() inset=game:GetService("GuiService"):GetGuiInset() end)
                local mx,my=m.X-inset.X,m.Y-inset.Y
                local function inside(gui)
                    if not gui then return false end
                    local p,s=gui.AbsolutePosition,gui.AbsoluteSize
                    return mx>=p.X and mx<=p.X+s.X and my>=p.Y and my<=p.Y+s.Y
                end
                if not inside(menu) and not inside(btn) then closeMenu() end
            end)
        end)
    end)
    regFeature({label=label,frame=wrap,kind="dropdown"})
    return wrap,function() return options[idx] end,function(v)
        for i,o in ipairs(options) do if o==v then idx=i;btn.Text=v;break end end
    end
end

-- Input on left + Set button on right
local function mkInputSet(par,y,placeholder,defaultText,onSet)
    local wrap=new("Frame",par,{
        Size=UDim2.new(1,-PAD*2,0,34),Position=UDim2.new(0,PAD,0,y),
        BackgroundTransparency=1
    })
    local box=new("TextBox",wrap,{
        Size=UDim2.new(1,-72,1,0),Position=UDim2.new(0,0,0,0),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,
        Text=tostring(defaultText or ""),PlaceholderText=placeholder or "Value",
        PlaceholderColor3=T.txD,BorderSizePixel=0,ClearTextOnFocus=false,
        TextXAlignment=Enum.TextXAlignment.Left
    });corner(box,CORNER);mkStroke(box,T.bd)
    new("UIPadding",box,{PaddingLeft=UDim.new(0,10)})
    ra("bT",box,"BackgroundColor3");ra("tx",box,"TextColor3")
    local setBtn=new("TextButton",wrap,{
        Size=UDim2.new(0,64,1,0),Position=UDim2.new(1,-64,0,0),
        BackgroundColor3=T.ac,Text="Set",TextColor3=Color3.fromRGB(255,255,255),
        Font=Enum.Font.GothamBold,TextSize=12,BorderSizePixel=0
    });corner(setBtn,CORNER);ra("ac",setBtn,"BackgroundColor3")
    setBtn.MouseEnter:Connect(function()
        TwS:Create(setBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.new(math.min(1,T.ac.R*1.15),math.min(1,T.ac.G*1.15),math.min(1,T.ac.B*1.15))}):Play()
    end)
    setBtn.MouseLeave:Connect(function()
        setBtn.BackgroundColor3=T.ac
    end)
    setBtn.MouseButton1Click:Connect(function()
        playSFX("click")
        if onSet then onSet(box.Text,box) end
    end)
    regFeature({label=placeholder or "input",frame=wrap,kind="inputset"})
    return wrap,box
end

local tabs={"Move","Weapon","RPG","Vis","World","Player","Vehicle","Misc","Online","Styling"}
local tabIcons={Move=ICO.Move,Weapon=ICO.Weapon,RPG=ICO.RPG,Vis=ICO.Vis,World="globe-2",Player=ICO.Player,Vehicle="settings-2",Misc=ICO.Misc,Online="globe",Styling=ICO.Layout}
-- tabC already declared earlier
local curTab=nil
local tabW=mfl((WW-PAD*2-6)/#tabs)
local tabH=36

for idx,name in ipairs(tabs) do
    local xOff=3+(idx-1)*tabW

    local topBtn=new("TextButton",topNav,{
        Size=UDim2.new(0,tabW,1,-6),Position=UDim2.new(0,xOff,0,3),
        BackgroundTransparency=1,TextColor3=T.txD,Font=Enum.Font.GothamBold,
        TextSize=10,Text=name,ZIndex=2
    });ra("tD",topBtn,"TextColor3")

    local sideBtn=new("TextButton",sideNav,{
        Size=UDim2.new(1,-8,0,tabH),Position=UDim2.new(0,4,0,8+(idx-1)*(tabH+4)),
        BackgroundTransparency=1,Text="",Active=true,AutoButtonColor=false,ZIndex=10
    })
    local sBg=new("Frame",sideBtn,{
        Size=UDim2.new(1,0,1,0),BackgroundColor3=T.bgT,BackgroundTransparency=1,
        BorderSizePixel=0,ZIndex=1
    });corner(sBg,CORNER)
    local iconName=tabIcons[name] or ICO[name] or "circle"
    local sIco=mkIcon(sideBtn,iconName,20,{
        Position=UDim2.new(0,14,0.5,-10),
        ImageColor3=T.txD,
        ZIndex=2,
    })
    -- color helper works for both ImageLabel and TextLabel fallback
    local function setIcoColor(col)
        if sIco:IsA("ImageLabel") then sIco.ImageColor3=col
        elseif sIco:IsA("TextLabel") then sIco.TextColor3=col end
    end
    local sLbl=new("TextLabel",sideBtn,{
        Size=UDim2.new(1,-48,0,18),Position=UDim2.new(0,42,0.5,-9),
        BackgroundTransparency=1,Text=name,
        TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=13,
        TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2
    });ra("tD",sLbl,"TextColor3")
    sideBtn.MouseEnter:Connect(function()
        if curTab~=name then
            sBg.BackgroundColor3=T.ac
            TwS:Create(sBg,TweenInfo.new(0.12),{BackgroundTransparency=0.82}):Play()
            setIcoColor(T.ac)
            TwS:Create(sLbl,TweenInfo.new(0.12),{TextColor3=T.ac}):Play()
        end
    end)
    sideBtn.MouseLeave:Connect(function()
        if curTab~=name then
            TwS:Create(sBg,TweenInfo.new(0.12),{BackgroundTransparency=1}):Play()
            setIcoColor(T.txD)
            TwS:Create(sLbl,TweenInfo.new(0.12),{TextColor3=T.txD}):Play()
        end
    end)

    local scroll=new("ScrollingFrame",ca2,{
        Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
        ScrollBarThickness=3,ScrollBarImageColor3=T.ac,ScrollBarImageTransparency=0.4,
        Visible=false,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0)
    });raScroll(scroll)

    tabC[name]={topBtn=topBtn,sideBtn=sideBtn,sIco=sIco,sLbl=sLbl,sBg=sBg,scroll=scroll,xOff=xOff,w=tabW,sY=8+(idx-1)*(tabH+4),setIcoColor=setIcoColor,select=selectTab}

    local function selectTab()
        local already = (curTab==name and not searchActive and not userPanelOpen)
        if not already then playSFX("tab",0.2) end
        if searchActive and cmdBox then cmdBox.Text="" end
        searchActive=false
        userPanelOpen=false
        if searchPop then searchPop.Visible=false end
        -- always force exclusive visibility (fixes stuck Move tab after search jump)
        if type(tabC)=="table" then
            for tn,t in pairs(tabC) do
                if t and t.scroll then t.scroll.Visible=false end
                if tn~=name and t then
                    pcall(function()
                        if t.topBtn then TwS:Create(t.topBtn,TweenInfo.new(0.12),{TextColor3=T.txD}):Play() end
                        if t.setIcoColor then t.setIcoColor(T.txD)
                        elseif t.sIco and t.sIco:IsA("ImageLabel") then TwS:Create(t.sIco,TweenInfo.new(0.12),{ImageColor3=T.txD}):Play()
                        elseif t.sIco then TwS:Create(t.sIco,TweenInfo.new(0.12),{TextColor3=T.txD}):Play() end
                        if t.sLbl then TwS:Create(t.sLbl,TweenInfo.new(0.12),{TextColor3=T.txD}):Play() end
                        if t.sBg then TwS:Create(t.sBg,TweenInfo.new(0.1),{BackgroundTransparency=1}):Play() end
                    end)
                end
            end
        end
        if userScroll then userScroll.Visible=false end
        curTab=name
        pill.Visible=true
        sideIndicator.Visible=true
        TwS:Create(topBtn,TweenInfo.new(0.12),{TextColor3=T.txSel}):Play()
        setIcoColor(T.ac)
        TwS:Create(sLbl,TweenInfo.new(0.12),{TextColor3=T.ac}):Play()
        TwS:Create(sBg,TweenInfo.new(0.1),{BackgroundTransparency=0.55}):Play()
        TwS:Create(pill,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,tabW-6,1,-6),
            Position=UDim2.new(0,xOff+3,0,3)
        }):Play()
        TwS:Create(sideIndicator,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
            Position=UDim2.new(0,0,0,tabC[name].sY+8)
        }):Play()
        scroll.Visible=true
        if contTitle then contTitle.Text=">_  "..name:lower() end
    end
    topBtn.MouseButton1Click:Connect(selectTab)
    sideBtn.MouseButton1Click:Connect(selectTab)
    tabC[name].select=selectTab
end

do
    pill.Visible=false
    sideIndicator.Visible=false
    curTab=nil
end
updateScrollPos()

-- Theme → sidebar live refresh (called from apTh)
S._themeSidebarRefresh = function()
    if type(tabC)~="table" then return end
    for name,t in pairs(tabC) do
        if t then
            local active=(curTab==name)
            pcall(function()
                if t.setIcoColor then t.setIcoColor(active and T.ac or T.txD) end
                if t.sLbl and t.sLbl.Parent then t.sLbl.TextColor3=active and T.ac or T.txD end
                if t.sBg and t.sBg.Parent then
                    t.sBg.BackgroundColor3=T.ac
                    t.sBg.BackgroundTransparency=active and 0.55 or 1
                end
                if t.topBtn and t.topBtn.Parent then
                    t.topBtn.TextColor3=active and T.txSel or T.txD
                end
            end)
        end
    end
    if sideIndicator and sideIndicator.Parent then sideIndicator.BackgroundColor3=T.ac end
    if pill and pill.Parent then pill.BackgroundColor3=T.ac end
    if lightLbl and lightLbl.Parent then lightLbl.TextColor3=S.lightMode and T.tx or T.txM end
    if lightIco and lightIco.Parent and lightIco:IsA("ImageLabel") then
        lightIco.ImageColor3=S.lightMode and T.wn or T.txM
    end
    if userLbl and userLbl.Parent then userLbl.TextColor3=T.txM end
    if sideGearLbl and sideGearLbl.Parent then sideGearLbl.TextColor3=T.txM end
    if sideGearIco and sideGearIco.Parent and sideGearIco:IsA("ImageLabel") then
        sideGearIco.ImageColor3=T.txM
    end
end

-- ===== M7-style hover expand sidebar =====
local function setSideExpanded(exp)
    if S.sideExpanded==exp then return end
    S.sideExpanded = exp
    local targetW = exp and SW_EXPANDED or SW_COLLAPSED
    SW = targetW
    playSFX("hover",0.12)
    TwS:Create(sideNav, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, targetW, 1, -HDR_H-1)
    }):Play()
    TwS:Create(sideEdge, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, targetW, 0, HDR_H+1)
    }):Play()
    local s,p = getCASize()
    TwS:Create(ca2, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = s, Position = p
    }):Play()
    -- fully hide command bar while sidebar is expanded (no translucent leftover)
    if botBar then
        if exp then
            botBar.Visible=false
            botBar.BackgroundTransparency=1
            if searchPanel then searchPanel.Visible=false end
            for _,ch in ipairs(botBar:GetChildren()) do
                if ch:IsA("TextLabel") or ch:IsA("TextBox") or ch:IsA("TextButton") then
                    ch.TextTransparency=1
                elseif ch:IsA("GuiObject") then
                    ch.Visible=false
                end
            end
        else
            botBar.Visible=true
            botBar.BackgroundTransparency=0
            botBar.Size=UDim2.new(1,-targetW-1,0,BOT_H-8)
            botBar.Position=UDim2.new(0,targetW+1,1,-(BOT_H-4))
            for _,ch in ipairs(botBar:GetChildren()) do
                if ch:IsA("TextLabel") or ch:IsA("TextBox") or ch:IsA("TextButton") then
                    ch.TextTransparency=0
                    ch.Visible=true
                elseif ch:IsA("GuiObject") then
                    ch.Visible=true
                end
            end
        end
    end
    for _,t in pairs(tabC) do
        if t.sLbl then
            t.sLbl.Visible = exp
            -- icons stay fixed at left (anchored) — only labels show/hide
            if t.sIco then
                t.sIco.Position = UDim2.new(0,14,0.5,-10)
                t.sIco.Size = UDim2.new(0,20,0,20)
            end
        end
    end
    -- bottom sidebar labels (icons stay put)
    if lightLbl then lightLbl.Visible=exp end
    if sideGearLbl then sideGearLbl.Visible=exp end
    if userLbl then userLbl.Visible=exp end
    if lightIco then lightIco.Position=UDim2.new(0,14,0.5,-9) end
    if sideGearIco then sideGearIco.Position=UDim2.new(0,14,0.5,-9) end
    if userIco then
        -- profile pic / icon stays left-anchored
        pcall(function() userIco.Position=UDim2.new(0,14,0.5,-9) end)
    end
end
-- start collapsed (icons only, fixed left)
for _,t in pairs(tabC) do
    if t.sLbl then t.sLbl.Visible=false end
    if t.sIco then t.sIco.Position=UDim2.new(0,14,0.5,-10) end
end
if lightLbl then lightLbl.Visible=false end
if sideGearLbl then sideGearLbl.Visible=false end
if userLbl then userLbl.Visible=false end
sideNav.MouseEnter:Connect(function() setSideExpanded(true) end)
sideNav.MouseLeave:Connect(function()
    task.delay(0.12, function() setSideExpanded(false) end)
end)

-- ===== Alt command palette (first image style) =====
-- ===== IY-style command registry + Alt palette =====
local PHONETIC={"Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","Xray","Yankee","Zulu"}

local function findClosestRPGGiver()
    local myRoot = hrp
    if not myRoot or not myRoot.Parent then
        local ch = plr.Character
        myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
    end
    local myPos = myRoot and myRoot.Position
    if not myPos then return nil, nil, nil, nil end
    local tycoonRoot = workspace:FindFirstChild("Tycoon")
    if not tycoonRoot then return nil, nil, nil, nil end
    local tycoons = tycoonRoot:FindFirstChild("Tycoons")
    if not tycoons then return nil, nil, nil, nil end
    local best, bestDist, bestName, bestPos = nil, math.huge, nil, nil
    for _, ty in ipairs(tycoons:GetChildren()) do
        local purchased = ty:FindFirstChild("PurchasedObjects")
        if not purchased then continue end
        for _, giverName in ipairs({"RPG Giver", "RPG Giver 2"}) do
            local giver = purchased:FindFirstChild(giverName)
            if giver then
                local prompt = giver:FindFirstChild("Prompt") or giver:FindFirstChildWhichIsA("ProximityPrompt", true)
                local part = giver:IsA("BasePart") and giver or giver:FindFirstChildWhichIsA("BasePart", true)
                local pos = part and part.Position
                if not pos and prompt and prompt.Parent and prompt.Parent:IsA("BasePart") then
                    pos = prompt.Parent.Position
                end
                if pos then
                    local d = (pos - myPos).Magnitude
                    if d < bestDist then
                        bestDist = d
                        best = prompt or giver
                        bestName = ty.Name .. " / " .. giverName
                        bestPos = pos
                    end
                end
            end
        end
    end
    return best, bestName, bestDist, bestPos
end

local function hasRPGInBackpack()
    local function scan(parent)
        if not parent then return false end
        for _,t in ipairs(parent:GetChildren()) do
            if t:IsA("Tool") then
                local l=t.Name:lower()
                if l:find("rpg") or l:find("rocket") then return true end
            end
        end
        return false
    end
    return scan(plr:FindFirstChild("Backpack")) or scan(plr.Character)
end

local function fireRPGGiverPrompt()
    local myRoot = hrp
    if not myRoot or not myRoot.Parent then
        local ch = plr.Character
        myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
    end
    if not myRoot then
        showPopup("RPG Grabber", "No character", T.wn)
        return false
    end
    local target, name, dist, giverPos = findClosestRPGGiver()
    if not target or not giverPos then
        showPopup("RPG Grabber", "No RPG Giver found", T.wn)
        return false
    end
    local originCF = myRoot.CFrame
    local ok = false
    pcall(function()
        myRoot.CFrame = CFrame.new(giverPos + Vector3.new(0, 3, 0))
        task.wait(0.15)
        local function firePrompt(pp)
            if not pp then return end
            if fireproximityprompt then fireproximityprompt(pp)
            else pcall(function() pp:InputHoldBegin();task.wait(0.1);pp:InputHoldEnd() end) end
        end
        if target:IsA("ProximityPrompt") then firePrompt(target); ok=true
        else firePrompt(target:FindFirstChildWhichIsA("ProximityPrompt", true)); ok=true end
        -- stay until RPG appears in backpack (or timeout)
        local got=false
        for _=1,25 do
            if hasRPGInBackpack and hasRPGInBackpack() then got=true; break end
            -- re-fire prompt a few times
            if target:IsA("ProximityPrompt") then firePrompt(target)
            else firePrompt(target:FindFirstChildWhichIsA("ProximityPrompt", true)) end
            task.wait(0.2)
        end
        -- only return home after check
        if myRoot and myRoot.Parent then myRoot.CFrame = originCF end
        ok = got or ok
    end)
    if hasRPGInBackpack and hasRPGInBackpack() then
        showPopup("RPG Grabber", "RPG secured · "..(name or "Giver"), T.ok)
    elseif ok then
        showPopup("RPG Grabber", string.format("%s (%.0fst) — check backpack", name or "Giver", dist or 0), T.wn)
    else
        pcall(function() if myRoot and myRoot.Parent then myRoot.CFrame = originCF end end)
        showPopup("RPG Grabber", "Failed to grab", T.ng)
    end
    return ok
end


local function grabRPGUntilFound(maxTries)
    maxTries=maxTries or 40
    if S._rpgGrabLoop then showPopup("RPG Grabber","Already running",T.wn);return end
    S._rpgGrabLoop=true
    task.spawn(function()
        showPopup("RPG Grabber","Grabbing until found…",T.ac)
        for i=1,maxTries do
            if S.dead or not S._rpgGrabLoop then break end
            if hasRPGInBackpack() then
                showPopup("RPG Grabber","RPG in backpack!",T.ok)
                S._rpgGrabLoop=false
                return
            end
            fireRPGGiverPrompt()
            task.wait(0.55)
        end
        S._rpgGrabLoop=false
        if hasRPGInBackpack() then
            showPopup("RPG Grabber","RPG secured",T.ok)
        else
            showPopup("RPG Grabber","Gave up — no RPG",T.ng)
        end
    end)
end


local CMD_LIST={
    {n="fly",d="Toggle fly",run=function() if flyTog then flyTog.u(not S.flying) else S.flying=not S.flying;if S.flying then startFly() else stopFly() end end end},
    {n="fly on",d="Enable fly",run=function() if flyTog then flyTog.u(true) else S.flying=true;startFly() end end},
    {n="fly off",d="Disable fly",run=function() if flyTog then flyTog.u(false) else S.flying=false;stopFly() end end},
    {n="esp",d="Toggle ESP",run=function() S.espOn=not S.espOn;if espTog then espTog.u(S.espOn) end end},
    {n="noclip",d="Toggle noclip",run=function() S.ncOn=not S.ncOn;applyNC(S.ncOn) end},
    {n="speed",d="Toggle speed hack",run=function() S.spHkOn=not S.spHkOn;applySpd() end},
    {n="jump",d="Toggle jump power",run=function() S.jpHkOn=not S.jpHkOn;applyJmp() end},
    {n="infjump",d="Toggle infinite jump",run=function() S.infJOn=not S.infJOn;applyInfJ(S.infJOn) end},
    {n="spin",d="Toggle spin bot",run=function() S.spinOn=not S.spinOn;applySpin(S.spinOn) end},
    {n="hitbox",d="Toggle hitbox expand",run=function() S.hitboxOn=not S.hitboxOn;applyHitbox(S.hitboxOn) end},
    {n="spam",d="Toggle RPG spam",run=function() S.spamOn=not S.spamOn;if mainTog then mainTog.u(S.spamOn) end end},
    {n="clickspam",d="Toggle click spam",run=function() S.clickOn=not S.clickOn;if clickTog then clickTog.u(S.clickOn) end end},
    {n="aimbot",d="Toggle aimbot",run=function() S.aimbotEnabled=not S.aimbotEnabled end},
    {n="fullbright",d="Toggle fullbright",run=function() S.brightOn=not S.brightOn;applyBright(S.brightOn) end},
    {n="nofog",d="Toggle no fog",run=function() S.fogOn=not S.fogOn;applyFog(S.fogOn) end},
    {n="xray",d="Toggle xray",run=function() S.xrayOn=not S.xrayOn;applyXR(S.xrayOn) end},
    {n="antiafk",d="Toggle anti-afk",run=function() S.antiAfkOn=not S.antiAfkOn;applyAntiAfk(S.antiAfkOn) end},
    {n="chams",d="Toggle chams",run=function() S.enemyChams=not S.enemyChams end},
    {n="radar",d="Toggle radar",run=function() S.espRadar=not S.espRadar;if S.radarFrame then S.radarFrame.Visible=S.espRadar end end},
    {n="skeleton",d="Toggle skeleton ESP",run=function() S.espSkeleton=not S.espSkeleton end},
    {n="headdot",d="Toggle head dots",run=function() S.espHeadDot=not S.espHeadDot end},
    {n="vehicleesp",d="Toggle vehicle ESP",run=function() S.vehEspOn=not S.vehEspOn;S.tgtTypes.Vehicles=S.vehEspOn end},
    {n="desync",d="Toggle desync",run=function() S.desyncEnabled=not S.desyncEnabled;S.desync=S.desyncEnabled end},
    {n="fling",d="Toggle fling",run=function() S.flingEnabled=not S.flingEnabled end},
    {n="flingall",d="Fling all players",run=function() S.flingAll=not S.flingAll end},
    {n="streamproof",d="Toggle streamproof",run=function() S.streamproof=not S.streamproof end},
    {n="arraylist",d="Toggle arraylist",run=function() S.arrayListOn=not S.arrayListOn end},
    {n="perfstats",d="Toggle perf stats",run=function() S.perfStatsOn=not S.perfStatsOn end},
    {n="targethud",d="Toggle target HUD",run=function() S.targetHudOn=not S.targetHudOn end},
    {n="focusmode",d="Toggle focus mode",run=function() S.focusMode=not S.focusMode end},
    {n="rejoin",d="Rejoin current server",run=function() pcall(function() TS:Teleport(game.PlaceId,plr) end) end},
    {n="serverhop",d="Hop to new server",run=function() pcall(function() TS:Teleport(game.PlaceId) end) end},
    {n="reset",d="Reset character",run=function() pcall(function() if hum then hum.Health=0 end end) end},
    {n="settings",d="Open settings panel",run=function() toggleSettings(true) end},
    {n="grab",d="Grab closest RPG Giver",run=function() fireRPGGiverPrompt() end},
    {n="rpggrab",d="Grab closest RPG Giver",run=function() fireRPGGiverPrompt() end},
}
local function execCmd(raw)
    local t=(raw or ""):lower():gsub("^%s+",""):gsub("%s+$","")
    if t=="" then return false end
    -- value setters: "speed 10", "fly 80", "walk 50", "jump 100", "fov 90", etc.
    local setters={
        {pat="^fly%s+([%d%.]+)", fn=function(v) S.flySpd=v;if flyTog then flyTog.u(true) end;showPopup("Fly Speed",tostring(v),T.ok) end},
        {pat="^speed%s+([%d%.]+)", fn=function(v) S.spHkV=v;S.spHkOn=true;applySpd();showPopup("Walk Speed",tostring(v),T.ok) end},
        {pat="^walk%s+([%d%.]+)", fn=function(v) S.spHkV=v;S.spHkOn=true;applySpd();showPopup("Walk Speed",tostring(v),T.ok) end},
        {pat="^jump%s+([%d%.]+)", fn=function(v) S.jpHkV=v;S.jpHkOn=true;applyJmp();showPopup("Jump",tostring(v),T.ok) end},
        {pat="^spin%s+([%d%.]+)", fn=function(v) S.spinSpd=v;showPopup("Spin",tostring(v).."°/s",T.ok) end},
        {pat="^fov%s+([%d%.]+)", fn=function(v) S.fovValue=v;S.fovEnabled=true;pcall(function() cam.FieldOfView=v end);showPopup("FOV",tostring(v),T.ok) end},
        {pat="^firerate%s+([%d%.]+)", fn=function(v) S.fireRate=v/1000;showPopup("Fire Rate",tostring(v).."ms",T.ok) end},
        {pat="^hitbox%s+([%d%.]+)", fn=function(v) S.hitboxSize=v;showPopup("Hitbox",tostring(v),T.ok) end},
        {pat="^gravity%s+([%d%.]+)", fn=function(v) S.gravMul=v/100;applyGrav(S.gravOn);showPopup("Gravity",tostring(v).."%",T.ok) end},
        {pat="^bring%s+([%d%.]+)", fn=function(v) S.bringDist=v;showPopup("Bring Dist",tostring(v),T.ok) end},
    }
    for _,s in ipairs(setters) do
        local n=t:match(s.pat)
        if n then local v=tonumber(n);if v then pcall(s.fn,v);playSFX("toggle_on");CHQueueSave();return true end end
    end
    for _,c in ipairs(CMD_LIST) do
        if t==c.n or t:find("^"..c.n.."%s") or c.n:find(t,1,true) then
            pcall(c.run);playSFX("toggle_on");return true
        end
    end
    -- toggle by feature name
    for _,f in ipairs(featureReg) do
        if f.kind=="toggle" and f.label and f.label:lower()==t and f.set then
            local cur=f.get and f.get() or false
            f.set(not cur)
            return true
        end
    end
    playSFX("error");return false
end

local cmdPalette = new("Frame",sg,{
    Size=UDim2.new(0,440,0,0), AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0.15,0),
    BackgroundColor3=T.bg, BackgroundTransparency=0.04, BorderSizePixel=0, Visible=false, ZIndex=80
});corner(cmdPalette,12);mkStroke(cmdPalette,T.bd,1)
local cmdInputRow = new("Frame",cmdPalette,{Size=UDim2.new(1,-16,0,42),Position=UDim2.new(0,8,0,8),BackgroundColor3=T.bgT,BorderSizePixel=0})
corner(cmdInputRow,10)
local cmdLock = new("TextLabel",cmdInputRow,{Size=UDim2.new(0,28,1,0),Position=UDim2.new(0,6,0,0),BackgroundTransparency=1,Text=ICO.Lock,TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=14})
local cmdInput = new("TextBox",cmdInputRow,{Size=UDim2.new(1,-44,1,0),Position=UDim2.new(0,34,0,0),BackgroundTransparency=1,
    Text="",PlaceholderText=">_ search commands...",PlaceholderColor3=T.txD,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false})
local cmdSuggestions = new("ScrollingFrame",cmdPalette,{Size=UDim2.new(1,-16,0,0),Position=UDim2.new(0,8,0,56),BackgroundTransparency=1,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0)})
local VALUE_HINTS={
    {n="speed 50",d="Set walk speed to 50"},
    {n="fly 80",d="Set fly speed to 80"},
    {n="jump 100",d="Set jump power to 100"},
    {n="spin 360",d="Set spin degrees/sec"},
    {n="fov 90",d="Set camera FOV"},
    {n="hitbox 20",d="Set hitbox size"},
    {n="gravity 50",d="Set gravity %"},
}
local function refreshSuggestions(q)
    for _,ch in ipairs(cmdSuggestions:GetChildren()) do ch:Destroy() end
    local y=0;local qq=(q or ""):lower():gsub("^%s+",""):gsub("%s+$","")

        if qq=="" then
        cmdSuggestions.Size=UDim2.new(1,-16,0,0)
        cmdSuggestions.CanvasSize=UDim2.new(0,0,0,0)
        TwS:Create(cmdPalette,TweenInfo.new(0.12),{Size=UDim2.new(0,440,0,58)}):Play()
        return
    end

    local function addRow(name,desc,onClick)
        local row=new("TextButton",cmdSuggestions,{Size=UDim2.new(1,0,0,32),Position=UDim2.new(0,0,0,y),BackgroundColor3=T.bgT,BackgroundTransparency=0.4,Text="",BorderSizePixel=0})
        corner(row,8)
        new("TextLabel",row,{Size=UDim2.new(0.45,0,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Text=name,TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
        new("TextLabel",row,{Size=UDim2.new(0.5,0,1,0),Position=UDim2.new(0.48,0,0,0),BackgroundTransparency=1,Text=desc,TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
        row.MouseButton1Click:Connect(function()
            playSFX("click")
            if onClick then onClick() end
            hideCmdPalette()
        end)
        y=y+36
    end

    for _,h in ipairs(VALUE_HINTS) do
        if h.n:find(qq,1,true) or h.d:lower():find(qq,1,true) then
            addRow("."..h.n,h.d,function() execCmd(h.n) end)
            if y>180 then break end
        end
    end
    for _,c in ipairs(CMD_LIST) do
        if y>180 then break end
        if c.n:find(qq,1,true) or (c.d and c.d:lower():find(qq,1,true)) then
            addRow("."..c.n,c.d or "command",function() execCmd(c.n) end)
        end
    end
    local seenF={}
    for _,f in ipairs(featureReg) do
        if y>180 then break end
        local lbl=(f.label or ""):lower():gsub("^%s+",""):gsub("%s+$","")
        if lbl=="" or seenF[lbl] then continue end
        if lbl:find(qq,1,true) then
            seenF[lbl]=true
            local tabHint=f.tab and ("→ "..f.tab) or (f.kind or "feature")
            addRow(f.label or "?", tabHint, function()
                if f.kind=="toggle" and f.set then
                    local cur=f.get and f.get() or false
                    f.set(not cur)
                    showPopup(f.label, (not cur) and "ON" or "OFF", T.ac)
                elseif type(jumpToFeature)=="function" then
                    jumpToFeature(f)
                end
            end)
        end
    end

    cmdSuggestions.Size=UDim2.new(1,-16,0,math.min(y,180))
    cmdSuggestions.CanvasSize=UDim2.new(0,0,0,y)
    TwS:Create(cmdPalette,TweenInfo.new(0.12),{Size=UDim2.new(0,440,0,60+math.min(y,180))}):Play()
end
local function showCmdPalette()
    playSFX("open")
    cmdPalette.Visible=true
    cmdInput.Text=""
    cmdInput:CaptureFocus()
    refreshSuggestions("")
end
local function hideCmdPalette()
    playSFX("close")
    TwS:Create(cmdPalette,TweenInfo.new(0.12),{Size=UDim2.new(0,440,0,0)}):Play()
    task.delay(0.13,function() cmdPalette.Visible=false end)
end
UIS.InputBegan:Connect(function(inp,gp)
    if gp then return end
    local altKey=S.keybinds.altPalette or Enum.KeyCode.LeftAlt
    if inp.KeyCode==altKey or (altKey==Enum.KeyCode.LeftAlt and inp.KeyCode==Enum.KeyCode.RightAlt) then
        if cmdPalette.Visible then hideCmdPalette() else showCmdPalette() end
    end
end)
cmdInput:GetPropertyChangedSignal("Text"):Connect(function()
    if cmdPalette.Visible then refreshSuggestions(cmdInput.Text) end
end)
cmdInput.FocusLost:Connect(function(enter)
    if enter then execCmd(cmdInput.Text) end
    hideCmdPalette()
end)

local function setNavMode(mode)
    S.navMode=mode
    topNav.Visible=(mode=="top")
    sideNav.Visible=(mode=="side")
    sideEdge.Visible=(mode=="side")
    local s,p=getCASize()
    ca2.Size=s;ca2.Position=p
    updateScrollPos()
    if botBar then
        if mode=="top" then
            botBar.Visible=true
            botBar.BackgroundTransparency=0
            botBar.Size=UDim2.new(1,-8,0,BOT_H-8)
            botBar.Position=UDim2.new(0,4,1,-(BOT_H-4))
        else
            local sideW = (S.sideExpanded and SW) or SW
            botBar.Visible=not S.sideExpanded
            botBar.Size=UDim2.new(1,-sideW-1,0,BOT_H-8)
            botBar.Position=UDim2.new(0,sideW+1,1,-(BOT_H-4))
        end
    end
end

local flyTog,spinTog,mainTog,clickTog,espTog

local function buildMove()
    _curBuildTab="Move"
    local s=tabC["Move"].scroll;local Y=8
    mkSL(s,Y,"Fly");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Speed",min=50,max=10000,default=S.flySpd,suffix=" st/s",cb=function(v) S.flySpd=v;CHQueueSave() end});Y=Y+SL_H+GAP
    flyTog=mkTog(s,Y,{label="Fly",bindKey="fly",default=false,color=T.ac,cb=function(en) if en then startFly() else stopFly() end;S.flying=en end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"Movement");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Speed",bindKey="speed",default=false,color=T.ac,cb=function(en) S.spHkOn=en;applySpd() end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Walk Speed",min=16,max=5000,default=50,suffix=" st/s",cb=function(v) S.spHkV=v;applySpd();CHQueueSave() end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Jump Power",bindKey="jump",default=false,color=T.ac,cb=function(en) S.jpHkOn=en;applyJmp() end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Jump Value",min=50,max=1000,default=100,cb=function(v) S.jpHkV=v;applyJmp();CHQueueSave() end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Inf Jump",bindKey="infJump",default=false,color=T.ac,cb=function(en) S.infJOn=en;applyInfJ(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="NoClip",bindKey="noClip",default=false,color=T.ac,cb=function(en) S.ncOn=en;applyNC(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Low Gravity",bindKey="lowGrav",default=false,color=T.ac,cb=function(en) S.gravOn=en;applyGrav(en) end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Gravity %",min=5,max=200,default=50,suffix="%",cb=function(v) S.gravMul=v/100;applyGrav(S.gravOn);CHQueueSave() end});Y=Y+SL_H+GAP
    mkSL(s,Y,"Spin Bot");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Speed",min=60,max=72000,default=360,suffix="°/s",cb=function(v) S.spinSpd=v;if S.spinBAV and S.spinBAV.Parent then S.spinBAV.AngularVelocity=Vector3.new(0,mrad(v),0) end;CHQueueSave() end});Y=Y+SL_H+GAP
    spinTog=mkTog(s,Y,{label="Spin",bindKey="spin",default=false,color=T.ac,cb=function(en) S.spinOn=en;applySpin(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Spin Client Lock (move freely)",default=false,color=T.ac,cb=function(en)
        S.spinClientLock=en
        showPopup("Spin Client Lock",en and "Local view unlocked" or "Full spin",T.ac)
    end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"Bhop");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Bhop (hold Space)",default=false,color=T.ac,cb=function(en)
        applyBhop(en)
        pcall(function()
            local ff=RepS:FindFirstChild("Freefall");if ff then ff:Destroy() end
            local ae=RepS:FindFirstChild("ACS_Engine")
            if ae then
                local evs=ae:FindFirstChild("Events")
                if evs then local fd=evs:FindFirstChild("FDMG");if fd then fd:Destroy() end end
            end
        end)
        showPopup("Bhop",en and "ON" or "OFF",T.ac)
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Snappy Mode",default=false,color=T.ac,cb=function(en)
        S.bhopSnappy=en;S.bhopMode=en and "Snappy" or "Classic"
        showPopup("Bhop",en and "Snappy" or "Classic",T.ac)
    end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Bhop Speed",min=16,max=200,default=16,suffix=" st/s",cb=function(v)
        S.bhopSpeed=v;S.bhopBaseSpeed=v
    end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Bhop Jump",min=50,max=300,default=50,cb=function(v) S.bhopJump=v end});Y=Y+SL_H+GAP
    s.CanvasSize=UDim2.new(0,0,0,Y+10)
end

local function buildWeapon()
    _curBuildTab="Weapon"
    local s = tabC["Weapon"].scroll
    local Y = 8

    -- Aimbot
    mkSL(s,Y,"Aimbot");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Enable Aimbot",default=false,color=T.ac,cb=function(en)
        S.aimbotEnabled=en
        if not en and S._aimFOV then S._aimFOV.Visible=false end
        showToggleNotif("Aimbot",en)
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Hold RMB to Aim",default=true,color=T.ac,cb=function(en)
        S.aimbotHoldRMB=en
        showPopup("Aimbot",en and "Hold right-click to aim" or "Always on while enabled",T.ac)
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Twizz Sensitivity Mode",default=true,color=T.ac,cb=function(en) S.aimbotUseSens=en end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Aim Sensitivity",min=9,max=99,default=50,cb=function(v) S.aimbotSensitivity=v end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Aim Offset",default=false,color=T.ac,cb=function(en) S.aimbotOffset=en end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Offset Amount",min=1,max=50,default=10,cb=function(v) S.aimbotOffsetAmt=v end});Y=Y+SL_H+GAP

    mkSl(s,Y,{label="FOV",min=20,max=400,default=S.aimbotFOV,cb=function(v) S.aimbotFOV=mfl(v) end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Smoothness",min=0,max=0.95,default=S.aimbotSmooth,cb=function(v) S.aimbotSmooth=v end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Prediction",min=0,max=1,default=S.predictionFactor,cb=function(v) S.predictionFactor=v end});Y=Y+SL_H+GAP
    mkDropdown(s,Y,"Target Part",{"Head","HumanoidRootPart","UpperTorso","LowerTorso"},S.aimbotPart,function(v) S.aimbotPart=v;S.bodyPartSelected=v end);Y=Y+56+GAP
    mkTog(s,Y,{label="Show FOV Circle",default=false,color=T.ac,cb=function(en) S.aimbotShowFOV=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Team Check",default=false,color=T.ac,cb=function(en) S.aimbotTeamCheck=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Aim Lock (sticky)",default=false,color=T.ac,cb=function(en)
        S.aimLockEnabled=en;S.lockEnabled=en
        if not en then S.isLockedOn=false;S.targetPlayer=nil end
    end});Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Toggle Lock On Nearest",function() toggleLockOnPlayer();showPopup("Aim Lock",S.isLockedOn and "Locked" or "Unlocked",T.ac) end);Y=Y+TOG_H+GAP


    -- ========== Silent Aim (PasteWare — exact core, ChudHub UI) ==========
    mkSL(s, Y, "Silent Aim"); Y = Y + SEC_H + GAP
    mkTog(s, Y, {label="Enable Silent Aim", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.Enabled = en
        S.silentAimEnabled = en
        if fov_circle then fov_circle.Visible = en and SilentAimSettings.FOVVisible end
        showToggleNotif("Silent Aim", en)
    end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Team Check", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.TeamCheck = en
        S.silentAimTeamCheck = en
    end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Bullet Teleport", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.BulletTP = en
        S.silentAimBulletTP = en
    end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Check For Fire Function", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.CheckForFireFunc = en
        S.silentAimCheckFireFunc = en
    end}); Y = Y + TOG_H + GAP
    mkDropdown(s, Y, "Target Part", {"Head","HumanoidRootPart","Random"}, SilentAimSettings.TargetPart or "HumanoidRootPart", function(v)
        SilentAimSettings.TargetPart = v
        S.silentAimTargetPart = v
    end); Y = Y + 56 + GAP
    mkDropdown(s, Y, "Silent Aim Method", {
        "Raycast","FindPartOnRay","FindPartOnRayWithIgnoreList","FindPartOnRayWithWhitelist","ViewportPointToRay","ScreenPointToRay"
    }, SilentAimSettings.SilentAimMethod or "Raycast", function(v)
        SilentAimSettings.SilentAimMethod = v
        S.silentAimMethod = v
    end); Y = Y + 56 + GAP
    mkSl(s, Y, {label="FOV Radius", min=0, max=360, default=SilentAimSettings.FOVRadius or 130, cb=function(v)
        SilentAimSettings.FOVRadius = mfl(v)
        S.silentAimFOV = SilentAimSettings.FOVRadius
        if fov_circle then fov_circle.Radius = SilentAimSettings.FOVRadius end
    end}); Y = Y + SL_H + GAP
    mkSl(s, Y, {label="Hit Chance", min=0, max=100, default=SilentAimSettings.HitChance or 100, suffix="%", cb=function(v)
        SilentAimSettings.HitChance = mfl(v)
        S.silentAimHitChance = SilentAimSettings.HitChance
    end}); Y = Y + SL_H + GAP
    mkSl(s, Y, {label="Multiply Unit By", min=0.1, max=10, default=SilentAimSettings.MultiplyUnitBy or 1, rounding=1, cb=function(v)
        SilentAimSettings.MultiplyUnitBy = v
        S.silentAimMultiplyUnitBy = v
    end}); Y = Y + SL_H + GAP
    mkTog(s, Y, {label="Show FOV Circle", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.FOVVisible = en
        S.silentAimFOVVisible = en
        if fov_circle then fov_circle.Visible = en and SilentAimSettings.Enabled end
    end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Show Silent Aim Target", default=false, color=T.ac, cb=function(en)
        SilentAimSettings.ShowSilentAimTarget = en
        S.silentAimShowTarget = en
        if not en then removeOldHighlight() end
    end}); Y = Y + TOG_H + GAP

    -- ========== Resolver ==========
    mkSL(s, Y, "Anti-Lock Resolver"); Y = Y + SEC_H + GAP
    mkTog(s, Y, {label="Anti-Lock Resolver", default=false, color=T.ac, cb=function(v) S.antiLockEnabled = v end}); Y = Y + TOG_H + GAP
    mkSl(s, Y, {label="Resolver Intensity", min=0, max=5, default=1, rounding=1, cb=function(v) S.resolverIntensity = v end}); Y = Y + SL_H + GAP
    mkDropdown(s, Y, "Resolver Method", {"Recalculate","Randomize","Invert"}, S.resolverMethod or "Recalculate", function(v) S.resolverMethod=v end); Y=Y+56+GAP

    -- ========== Desync (PasteWare pure) ==========
    mkSL(s, Y, "Desync / Anti-Lock"); Y = Y + SEC_H + GAP
    mkTog(s, Y, {label="Enable Desync", default=false, color=T.ac, cb=function(v) S.desyncEnabled = v end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Desync Active (keybind V)", default=false, color=T.ac, cb=function(v) S.desync = v end}); Y = Y + TOG_H + GAP
    mkSl(s, Y, {label="Velocity Intensity", min=1, max=10, default=5, cb=function(v) S.reverseResolveIntensity = v end}); Y = Y + SL_H + GAP

    -- Weapon Modifications (ACS)
    mkSL(s, Y, "Weapon Modifications (ACS)"); Y = Y + SEC_H + GAP
    mkTog(s, Y, {label="War Tycoon Mode", default=false, color=T.ac, cb=function(v) S.warTycoonMode = v end}); Y = Y + TOG_H + GAP
    mkTog(s, Y, {label="Apply to Weapon in Hands Only", default=false, color=T.ac, cb=function(v) S.weaponOnHands = v end}); Y = Y + TOG_H + GAP

    mkDropdown(s, Y, "Modify Method", {"Attribute","Require"}, S.weaponModMethod, function(v) S.weaponModMethod=v end); Y=Y+56+GAP

    -- Buttons
    mkBtn(s, Y, "INF AMMO", function() modifyWeaponSettings("Ammo", math.huge) end); Y = Y + TOG_H + GAP
    mkBtn(s, Y, "NO RECOIL + NO SPREAD", function()
        if S.weaponModMethod == "Attribute" then
            modifyWeaponSettings("VRecoil", Vector2.new(0,0))
            modifyWeaponSettings("HRecoil", Vector2.new(0,0))
        else
            modifyWeaponSettings("VRecoil", {0,0})
            modifyWeaponSettings("HRecoil", {0,0})
        end
        modifyWeaponSettings("MinSpread", 0)
        modifyWeaponSettings("MaxSpread", 0)
        modifyWeaponSettings("RecoilPunch", 0)
    end); Y = Y + TOG_H + GAP

    mkBtn(s, Y, "INFINITE BULLET DISTANCE", function() modifyWeaponSettings("Distance", 25000) end); Y = Y + TOG_H + GAP

    -- Input + Set rows
    mkSL(s, Y, "Weapon Properties"); Y = Y + SEC_H + GAP
    local _,frBox=mkInputSet(s,Y,"Fire Rate","",function(txt)
        local rate=tonumber(txt)
        if not rate then showPopup("Fire Rate","Enter a number",T.wn);return end
        modifyWeaponSettings("FireRate",rate)
        modifyWeaponSettings("ShootRate",rate)
        showPopup("Fire Rate",tostring(rate),T.ok)
    end);Y=Y+38+GAP
    local _,bsBox=mkInputSet(s,Y,"Bullet Speed","",function(txt)
        local spd=tonumber(txt)
        if not spd then showPopup("Bullet Speed","Enter a number",T.wn);return end
        modifyWeaponSettings("BSpeed",spd)
        modifyWeaponSettings("MuzzleVelocity",spd)
        showPopup("Bullet Speed",tostring(spd),T.ok)
    end);Y=Y+38+GAP
    local _,mbBox=mkInputSet(s,Y,"Multi Bullets","",function(txt)
        local cnt=tonumber(txt)
        if not cnt then showPopup("Multi Bullets","Enter a number",T.wn);return end
        modifyWeaponSettings("Bullets",cnt)
        showPopup("Multi Bullets",tostring(cnt),T.ok)
    end);Y=Y+38+GAP

    mkDropdown(s, Y, "Fire Mode", {"Auto","Semi","Burst","Safety"}, S.fireMode or "Auto", function(v)
        S.fireMode = v
        modifyWeaponSettings("Mode", v)
        showPopup("Fire Mode", tostring(v), T.ok)
    end); Y = Y + 56 + GAP
    mkBtn(s, Y, "Apply Fire Mode", function()
        modifyWeaponSettings("Mode", S.fireMode or "Auto")
        showPopup("Fire Mode", tostring(S.fireMode or "Auto"), T.ok)
    end); Y = Y + TOG_H + GAP

s.CanvasSize = UDim2.new(0,0,0,Y+10)
end
local function buildVehicle()
    _curBuildTab="Vehicle"
    local s = tabC["Vehicle"].scroll
    local Y = 8

    -- Vehicle Upgrades (attributes on any model under Workspace)
    mkSL(s, Y, "Vehicle Upgrades"); Y = Y + SEC_H + GAP

    local function collectVehicles()
        local list = {}
        local function scan(folder)
            if not folder then return end
            for _, ch in ipairs(folder:GetChildren()) do
                if ch:IsA("Model") then
                    -- models that have any of the upgrade attributes (or look like vehicles)
                    local has =
                        ch:GetAttribute("SpeedUpgrades") ~= nil
                        or ch:GetAttribute("FirepowerUpgrades") ~= nil
                        or ch:GetAttribute("HealthUpgrades") ~= nil
                        or ch:FindFirstChild("VehicleSeat")
                        or ch:FindFirstChildWhichIsA("VehicleSeat", true)
                        or ch:FindFirstChild("DriveSeat")
                        or ch:FindFirstChild("Owner")
                    if has then
                        list[#list+1] = ch
                    end
                elseif ch:IsA("Folder") or ch:IsA("Model") then
                    -- recurse into folders under workspace (e.g. Game Systems / Vehicle Workspace)
                    if ch.Name:lower():find("vehicle") or ch.Name:lower():find("workspace")
                        or ch.Name == "Game Systems" or ch.Name:lower():find("tank")
                        or ch.Name:lower():find("plane") or ch.Name:lower():find("heli") then
                        scan(ch)
                    end
                end
            end
        end
        -- scan whole workspace folders
        for _, root in ipairs(workspace:GetChildren()) do
            if root:IsA("Folder") or root:IsA("Model") then
                scan(root)
            elseif root:IsA("Model") then
                local has =
                    root:GetAttribute("SpeedUpgrades") ~= nil
                    or root:GetAttribute("FirepowerUpgrades") ~= nil
                    or root:GetAttribute("HealthUpgrades") ~= nil
                if has then list[#list+1] = root end
            end
        end
        -- also direct Vehicle Workspace path if present
        pcall(function()
            local vs = workspace:FindFirstChild("Game Systems")
            vs = vs and vs:FindFirstChild("Vehicle Workspace")
            if vs then
                for _, ch in ipairs(vs:GetChildren()) do
                    if ch:IsA("Model") then
                        local found = false
                        for _, e in ipairs(list) do if e == ch then found = true break end end
                        if not found then list[#list+1] = ch end
                    end
                end
            end
        end)
        return list
    end

    local function getVehTarget()
        if S.nearestVehicle and S.nearestVehicle.Parent then
            return S.nearestVehicle
        end
        return getNearestVehicle()
    end

    local function setVehAttr(name, val)
        local veh = getVehTarget()
        if not veh then
            showPopup("Vehicle", "No vehicle nearby", T.wn)
            return false
        end
        pcall(function() veh:SetAttribute(name, val) end)
        return true, veh
    end

    S.vehUpgradeLoop = S.vehUpgradeLoop or false
    S.vehSpeedUp = S.vehSpeedUp or 0
    S.vehFireUp = S.vehFireUp or 0
    S.vehHealthUp = S.vehHealthUp or 0

    local function mkUpgradeRow(label, attrName, stateKey)
        local _, box = mkInputSet(s, Y, label, "", function(txt)
            local n = tonumber(txt)
            if not n then showPopup("Vehicle", "Enter a number", T.wn); return end
            n = math.floor(n)
            S[stateKey] = n
            local ok, veh = setVehAttr(attrName, n)
            if ok then
                showPopup("Vehicle", label.." = "..tostring(n).." on "..veh.Name, T.ok)
            end
        end)
        Y = Y + 38 + GAP
        return box
    end

    mkUpgradeRow("Speed", "SpeedUpgrades", "vehSpeedUp")
    mkUpgradeRow("Firepower", "FirepowerUpgrades", "vehFireUp")
    mkUpgradeRow("Health", "HealthUpgrades", "vehHealthUp")

    mkTog(s, Y, {label="Loop Force Upgrades", default=false, color=T.ac, cb=function(en)
        S.vehUpgradeLoop = en
        if en then
            task.spawn(function()
                while S.vehUpgradeLoop and not S.dead do
                    pcall(function()
                        for _, veh in ipairs(collectVehicles()) do
                            pcall(function()
                                veh:SetAttribute("SpeedUpgrades", S.vehSpeedUp or 0)
                                veh:SetAttribute("FirepowerUpgrades", S.vehFireUp or 0)
                                veh:SetAttribute("HealthUpgrades", S.vehHealthUp or 0)
                            end)
                        end
                    end)
                    task.wait(0.15)
                end
            end)
            showPopup("Vehicle", "Upgrade loop ON", T.ok)
        else
            showPopup("Vehicle", "Upgrade loop OFF", T.txM)
        end
    end}); Y = Y + TOG_H + GAP

    mkBtn(s, Y, "Max All (Nearest)", function()
        S.vehSpeedUp, S.vehFireUp, S.vehHealthUp = 50, 50, 50
        local veh = getVehTarget()
        if not veh then showPopup("Vehicle", "No vehicle nearby", T.wn); return end
        pcall(function()
            veh:SetAttribute("SpeedUpgrades", 50)
            veh:SetAttribute("FirepowerUpgrades", 50)
            veh:SetAttribute("HealthUpgrades", 50)
        end)
        showPopup("Vehicle", "Maxed "..veh.Name, T.ok)
    end); Y = Y + TOG_H + GAP

    mkBtn(s, Y, "Apply to All Vehicles", function()
        local list = collectVehicles()
        local n = 0
        for _, veh in ipairs(list) do
            pcall(function()
                veh:SetAttribute("SpeedUpgrades", S.vehSpeedUp or 0)
                veh:SetAttribute("FirepowerUpgrades", S.vehFireUp or 0)
                veh:SetAttribute("HealthUpgrades", S.vehHealthUp or 0)
            end)
            n = n + 1
        end
        showPopup("Vehicle", "Applied to "..n.." vehicles", T.ok)
    end); Y = Y + TOG_H + GAP

    mkSL(s, Y, "Turret"); Y = Y + SEC_H + GAP
    mkTog(s, Y, {label="Inf Ammo", default=false, color=T.ok, cb=function(en)
        S.bulletCountZero = en
        if en then
            task.spawn(function()
                while S.bulletCountZero and not S.dead do
                    pcall(function()
                        local gs = workspace:FindFirstChild("Game Systems")
                        if not gs then return end
                        for _, obj in ipairs(gs:GetDescendants()) do
                            if obj:GetAttribute("BulletCount") ~= nil then
                                obj:SetAttribute("BulletCount", 0)
                            end
                        end
                    end)
                    task.wait()
                end
            end)
            showPopup("Vehicle", "Inf ammo ON", T.ok)
        else
            showPopup("Vehicle", "Inf ammo OFF", T.txM)
        end
    end}); Y = Y + TOG_H + GAP

    -- FireRate for any Settings module under Game Systems
    local _, frBox = mkInputSet(s, Y, "FireRate", "", function(txt)
        local n = tonumber(txt)
        if not n then showPopup("Vehicle", "Enter a number", T.wn); return end
        S.vehFireRate = n
        local count = 0
        pcall(function()
            local gs = workspace:FindFirstChild("Game Systems")
            if not gs then return end
            for _, d in ipairs(gs:GetDescendants()) do
                if d:IsA("ModuleScript") and d.Name == "Settings" then
                    local ok, cfg = pcall(require, d)
                    if ok and type(cfg) == "table" then
                        cfg.FireRate = n
                        cfg.CooldownTime = 0
                        cfg.OverheatIncrement = 0
                        cfg.OverheatCount = 99999
                        cfg.DepleteDelay = 0
                        count = count + 1
                    end
                end
            end
        end)
        showPopup("Vehicle", "FireRate="..tostring(n).." on "..count.." modules", T.ok)
    end); Y = Y + 38 + GAP

    mkTog(s, Y, {label="Loop FireRate", default=false, color=T.ac, cb=function(en)
        S.vehFireRateLoop = en
        if en then
            task.spawn(function()
                while S.vehFireRateLoop and not S.dead do
                    pcall(function()
                        local rate = S.vehFireRate
                        if not rate then return end
                        local gs = workspace:FindFirstChild("Game Systems")
                        if not gs then return end
                        for _, d in ipairs(gs:GetDescendants()) do
                            if d:IsA("ModuleScript") and d.Name == "Settings" then
                                local ok, cfg = pcall(require, d)
                                if ok and type(cfg) == "table" then
                                    cfg.FireRate = rate
                                    cfg.CooldownTime = 0
                                    cfg.OverheatIncrement = 0
                                    cfg.OverheatCount = 99999
                                    cfg.DepleteDelay = 0
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
            showPopup("Vehicle", "FireRate loop ON", T.ok)
        else
            showPopup("Vehicle", "FireRate loop OFF", T.txM)
        end
    end}); Y = Y + TOG_H + GAP

    mkSL(s, Y, "Vehicle Detection"); Y = Y + SEC_H + GAP

    local vehLabel = new("TextLabel", s, {
        Size = UDim2.new(1, -PAD*2, 0, 20),
        Position = UDim2.new(0, PAD, 0, Y),
        BackgroundTransparency = 1,
        Text = "Nearest Vehicle: None",
        TextColor3 = T.txM,
        Font = Enum.Font.Gotham,
        TextSize = 12
    })
    ra("tx", vehLabel, "TextColor3")
    Y = Y + 26

    task.spawn(function()
        while true do
            task.wait(1)
            if not vehLabel or not vehLabel.Parent then break end
            local ok, veh = pcall(getNearestVehicle)
            if ok and veh then
                local su = veh:GetAttribute("SpeedUpgrades")
                local fu = veh:GetAttribute("FirepowerUpgrades")
                local hu = veh:GetAttribute("HealthUpgrades")
                vehLabel.Text = string.format("Nearest: %s  |  S:%s F:%s H:%s",
                    veh.Name, tostring(su or "-"), tostring(fu or "-"), tostring(hu or "-"))
            else
                vehLabel.Text = "Nearest Vehicle: None"
            end
        end
    end)

    mkBtn(s, Y, "Refresh Nearest Vehicle", function()
        local veh = getNearestVehicle()
        if veh then
            vehLabel.Text = "Nearest: " .. veh.Name .. " (refreshed)"
            S.nearestVehicle = veh
        end
    end); Y = Y + TOG_H + GAP

    mkBtn(s, Y, "Debug: Print All Attributes", function()
        local veh = getNearestVehicle()
        if not veh then print("[Debug] No vehicle"); return end
        print("========== " .. veh.Name .. " ==========")
        for name, value in pairs(veh:GetAttributes()) do
            print(name .. " =", value)
        end
        print("=======================================")
    end); Y = Y + TOG_H + GAP

    mkSL(s, Y, "Stealer"); Y = Y + SEC_H + GAP
    mkBtn(s,Y,"Vehicle Stealer (Nearest)",function()
        if S._vehicleStealBusy then showPopup("Stealer","Already running",T.wn);return end
        local veh = S.nearestVehicle or getNearestVehicle()
        if not veh then showPopup("Stealer","No vehicle nearby",T.wn);return end
        local ownerName=nil
        pcall(function()
            local o=veh:FindFirstChild("Owner")
            if o and o.Value and o.Value~="" then ownerName=tostring(o.Value) end
        end)
        local ownerPlr=nil
        if ownerName then
            for _,p in ipairs(Players:GetPlayers()) do
                if p.Name==ownerName or p.DisplayName==ownerName then ownerPlr=p;break end
            end
        end
        if not ownerPlr then
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=plr and p.Character then
                    local h=p.Character:FindFirstChildOfClass("Humanoid")
                    if h and h.SeatPart and h.SeatPart:IsDescendantOf(veh) then ownerPlr=p;break end
                end
            end
        end
        S._vehicleStealBusy=true
        task.spawn(function()
            local myRoot=hrp or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"))
            if not myRoot then S._vehicleStealBusy=false;return end
            showPopup("Stealer","Engaging…",T.ac)
            -- eject driver from seat first so bring only moves the player
            if ownerPlr and ownerPlr.Character then
                local oh=ownerPlr.Character:FindFirstChildOfClass("Humanoid")
                if oh then pcall(function() oh.Sit=false; oh.Seated:Wait() end) end
                pcall(function()
                    local th=ownerPlr.Character:FindFirstChild("HumanoidRootPart")
                    if th then th.CFrame=th.CFrame+Vector3.new(0,6,0) end
                end)
            end
            task.wait(0.12)
            -- 1) teleport well under target
            local under
            if ownerPlr and ownerPlr.Character and ownerPlr.Character:FindFirstChild("HumanoidRootPart") then
                under=ownerPlr.Character.HumanoidRootPart.CFrame*CFrame.new(0,-18,0)
            else
                under=veh:GetPivot()*CFrame.new(0,-18,0)
            end
            pcall(function() myRoot.CFrame=under end)
            task.wait(0.12)
            -- 2) bring ONLY the player character HRP (not vehicle)
            if ownerPlr then
                pcall(function()
                    local th=ownerPlr.Character and ownerPlr.Character:FindFirstChild("HumanoidRootPart")
                    local oh=ownerPlr.Character and ownerPlr.Character:FindFirstChildOfClass("Humanoid")
                    if oh then oh.Sit=false end
                    if th and myRoot then
                        -- direct pin player only for a short window
                        for _=1,20 do
                            if not th.Parent then break end
                            th.CFrame=myRoot.CFrame*CFrame.new(0,0,-3)
                            task.wait(0.03)
                        end
                    end
                end)
            end
            -- 3) RPG them (with self anti)
            local wasAnti=S.antiRpgOn
            applyAntiRpg(true)
            local wep=getRPG()
            if not wep then
                -- try equip from backpack
                pcall(function()
                    for _,t in ipairs(plr.Backpack:GetChildren()) do
                        local l=t.Name:lower()
                        if t:IsA("Tool") and (l:find("rpg") or l:find("rocket")) then
                            t.Parent=plr.Character;wep=t;break
                        end
                    end
                end)
            end
            if ownerPlr and wep then
                showPopup("Stealer","RPG driver…",T.ng)
                for i=1,40 do
                    if S.dead then break end
                    local th=ownerPlr.Character and ownerPlr.Character:FindFirstChild("HumanoidRootPart")
                    local oh=ownerPlr.Character and ownerPlr.Character:FindFirstChildOfClass("Humanoid")
                    if not th or not oh or oh.Health<=0 then break end
                    pcall(function() clickFire(th.Position+Vector3.new(0,1.5,0),wep) end)
                    task.wait(0.04)
                end
            else
                showPopup("Stealer","No RPG / no driver — TP only",T.wn)
            end
            task.wait(0.2)
            if type(stopBring)=="function" and ownerPlr then pcall(function() stopBring(ownerPlr) end) end
            -- 4) enter vehicle
            local seat=nil
            pcall(function()
                for _,d in ipairs(veh:GetDescendants()) do
                    if d:IsA("VehicleSeat") then seat=d;break end
                end
                if not seat then
                    for _,d in ipairs(veh:GetDescendants()) do
                        if d:IsA("Seat") then seat=d;break end
                    end
                end
            end)
            pcall(function()
                myRoot=hrp or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"))
                if seat and myRoot then
                    myRoot.CFrame=seat.CFrame*CFrame.new(0,3,0)
                    task.wait(0.08)
                    local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                    if h then h.Sit=true end
                elseif myRoot then
                    myRoot.CFrame=veh:GetPivot()*CFrame.new(0,5,0)
                end
            end)
            if not wasAnti then applyAntiRpg(false) end
            S._vehicleStealBusy=false
            showPopup("Stealer","Done",T.ok)
        end)
    end);Y=Y+TOG_H+GAP

    s.CanvasSize = UDim2.new(0, 0, 0, Y + 20)
end
local function buildRPG()
    _curBuildTab="RPG"
    local s=tabC["RPG"].scroll;local Y=8
    mkSL(s,Y,"RPG Grabber");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Grab Closest RPG",function()
        playSFX("click")
        fireRPGGiverPrompt()
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Grab Until Found",function()
        playSFX("click")
        grabRPGUntilFound(50)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Stop Grab Loop",function()
        S._rpgGrabLoop=false
        showPopup("RPG Grabber","Stopped",T.txM)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Loop Grab (3s)",function()
        playSFX("click")
        task.spawn(function()
            for i=1,8 do
                if S.dead then break end
                fireRPGGiverPrompt()
                task.wait(0.4)
            end
        end)
    end);Y=Y+TOG_H+GAP
    mkSL(s,Y,"Auto Spam");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Fire Rate",min=1,max=1000,default=mfl(S.fireRate*1000),suffix=" ms",cb=function(v) S.fireRate=v/1000;CHQueueSave() end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Max Distance",min=50,max=5000,default=S.maxDist,suffix=" st",cb=function(v) S.maxDist=v;CHQueueSave() end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Rkt / Target",min=1,max=300,default=1,cb=function(v) S.rktPerTgt=v end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Spread",min=1,max=100,default=5,suffix=" st",cb=function(v) S.spread=v end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Simultaneous",default=S.simFire,color=T.ac,cb=function(en) S.simFire=en;CHQueueSave() end});Y=Y+TOG_H+GAP
    mainTog=mkTog(s,Y,{label="Enabled",bindKey="spam",default=false,color=T.ac,cb=function(en)
        if en and not S.hasShot then showNotif();mainTog.u(false);return end
        S.spamOn=en;if not en then S.fireGen=S.fireGen+1 end
    end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"RPG Combat");Y=Y+SEC_H+GAP
    --[[ Bullet TP / Auto Kill RPG removed
    mkTog(s,Y,{label="Bullet TP (Silent)",...});
    mkTog(s,Y,{label="Auto Kill RPG (Nearest)",...});
    --]]
    mkSL(s,Y,"Click Spam");Y=Y+SEC_H+GAP
    clickTog=mkTog(s,Y,{label="Click Mode  (LMB)",default=false,color=T.ac,cb=function(en) S.clickOn=en end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"Pattern");Y=Y+SEC_H+GAP
    local PATS={"None","Circle","Sphere","Cube","Spiral","Pyramid","Star","Cross","Heart","Penis","Swastika"}
    local _,getPat,setPat=mkDropdown(s,Y,"Pattern Mode",PATS,S.patMode or "None",function(v) S.patMode=v end);Y=Y+56+GAP
    mkSl(s,Y,{label="Pattern Size",min=10,max=2000,default=50,suffix=" st",cb=function(v) S.patSize=v end});Y=Y+SL_H+GAP
    -- Firework show
    mkSL(s,Y,"Firework Show");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Launch Strobe Firework",function()
        task.spawn(function()
            local wep=getRPG();if not wep then showPopup("Firework","Equip RPG first",T.wn);return end
            showPopup("Strobe Firework","Launching skyward…",T.ac)
            S.fireworkOn=true
            local origin=hrp and hrp.Position or Vector3.new()
            -- straight vertical column up very high
            local height=420
            for h=20,height,12 do
                if not S.fireworkOn then break end
                clickFire(origin+Vector3.new(0,h,0),wep)
                if h%36==0 then task.wait(0.02) end
            end
            -- apex explosion burst
            local apex=origin+Vector3.new(0,height+20,0)
            for i=1,48 do
                if not S.fireworkOn then break end
                local a=i*(math.pi*2/24)
                local r=8+i*0.9
                local y=math.sin(i*0.55)*18
                clickFire(apex+Vector3.new(math.cos(a)*r,y,math.sin(a)*r),wep)
                if i%6==0 then task.wait(0.03) end
            end
            -- secondary strobe rings falling slightly
            for pulse=1,10 do
                if not S.fireworkOn then break end
                local ang=pulse*0.7
                local rad=20+pulse*3
                local base=apex+Vector3.new(math.cos(ang)*rad,-pulse*4,math.sin(ang)*rad)
                for k=1,4 do
                    clickFire(base+Vector3.new(mra(-4,4),mra(-2,6),mra(-4,4)),wep)
                end
                task.wait(0.04)
            end
            S.fireworkOn=false
            showPopup("Strobe Firework","Boom",T.ok)
        end)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Stop Firework",function() S.fireworkOn=false;showPopup("Firework","Stopped",T.txM) end);Y=Y+TOG_H+GAP
    mkSL(s,Y,"Custom Text");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Custom Text Mode",default=false,color=T.ac,cb=function(en)
        if en then S.patMode="Custom Text"
        else S.patMode=getPat and getPat() or "None"; if setPat then setPat(S.patMode) end end
    end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Text Size",min=10,max=500,default=50,suffix=" st",cb=function(v) S.txtSize=v end});Y=Y+SL_H+GAP
    local ti=new("TextBox",s,{Size=UDim2.new(1,-PAD*2,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,
        Text="HELLO",PlaceholderText="Enter text...",PlaceholderColor3=T.txD,
        ClearTextOnFocus=false,BorderSizePixel=0});corner(ti,8)
    new("UIPadding",ti,{PaddingLeft=UDim.new(0,8)});mkStroke(ti,T.bd)
    ra("bT",ti,"BackgroundColor3");ra("tx",ti,"TextColor3");Y=Y+TOG_H+GAP
    ti.FocusLost:Connect(function() if ti.Text~="" then S.custTxt=ti.Text else ti.Text=S.custTxt end end)
    mkSL(s,Y,"Targets");Y=Y+SEC_H+GAP
    for _,t in ipairs({
        {key="Players",label="Players",color=Color3.fromRGB(96,165,250)},
        {key="Vehicles",label="Vehicles",color=Color3.fromRGB(251,191,36)},
        {key="BaseShields",label="Base Shields",color=Color3.fromRGB(34,211,238)},
        {key="ElectricalBoxes",label="Power Boxes",color=Color3.fromRGB(253,224,71)},
    }) do mkTog(s,Y,{label=t.label,default=S.tgtTypes[t.key],color=t.color,cb=function(en) S.tgtTypes[t.key]=en end});Y=Y+TOG_H+GAP end
    s.CanvasSize=UDim2.new(0,0,0,Y+10)
end

local function buildVis()
    _curBuildTab="Vis"
    local s=tabC["Vis"].scroll;local Y=8
    mkSL(s,Y,"ESP");Y=Y+SEC_H+GAP
    espTog=mkTog(s,Y,{label="ESP",bindKey="esp",default=false,color=T.ac,cb=function(en) S.espOn=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Names",default=true,color=T.ac,cb=function(en) S.espNames=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Distance",default=true,color=T.ac,cb=function(en) S.espDist=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Health Bar",default=true,color=T.ac,cb=function(en) S.espHealth=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Tracers",default=true,color=T.ac,cb=function(en) S.espTracers=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Boxes",default=true,color=T.ac,cb=function(en) S.espLines=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Skeleton ESP",default=false,color=T.ac,cb=function(en) S.espSkeleton=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Head Dot",default=true,color=T.ac,cb=function(en) S.espHeadDot=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Avatar Icons (ESP)",default=true,color=T.ac,cb=function(en) S.espAvatar=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Faction",default=false,color=T.ac,cb=function(en) S.espFaction=en end});Y=Y+TOG_H+GAP
    local function applyRadarStyle()
        if not S.radarFrame then return end
        for _,ch in ipairs(S.radarFrame:GetChildren()) do
            if not ch:IsA("UICorner") and not ch:IsA("UIStroke") then ch:Destroy() end
        end
        local style=S.radarStyle or "Default"
        local st=S.radarFrame:FindFirstChildOfClass("UIStroke")
        if style=="Minimal" then
            S.radarFrame.BackgroundTransparency=0.85
            if st then st.Thickness=1;st.Transparency=0.5 end
            corner(S.radarFrame,8)
        elseif style=="Grid" then
            S.radarFrame.BackgroundTransparency=0.2
            if st then st.Thickness=1.5 end
            corner(S.radarFrame,6)
            for i=1,3 do
                new("Frame",S.radarFrame,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,i/4,0),BackgroundColor3=T.ac,BackgroundTransparency=0.7,BorderSizePixel=0,ZIndex=50})
                new("Frame",S.radarFrame,{Size=UDim2.new(0,1,1,0),Position=UDim2.new(i/4,0,0,0),BackgroundColor3=T.ac,BackgroundTransparency=0.7,BorderSizePixel=0,ZIndex=50})
            end
        elseif style=="Cross" then
            S.radarFrame.BackgroundTransparency=0.3
            corner(S.radarFrame,4)
            new("Frame",S.radarFrame,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=T.ac,BackgroundTransparency=0.4,BorderSizePixel=0,ZIndex=50})
            new("Frame",S.radarFrame,{Size=UDim2.new(0,1,1,0),Position=UDim2.new(0.5,0,0,0),BackgroundColor3=T.ac,BackgroundTransparency=0.4,BorderSizePixel=0,ZIndex=50})
        elseif style=="Dot" then
            S.radarFrame.BackgroundTransparency=0.4
            corner(S.radarFrame,70)
        elseif style=="Ring" then
            S.radarFrame.BackgroundTransparency=0.55
            corner(S.radarFrame,70)
            new("Frame",S.radarFrame,{Size=UDim2.new(0.7,0,0.7,0),Position=UDim2.new(0.15,0,0.15,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=50})
            local ring=new("Frame",S.radarFrame,{Size=UDim2.new(0.7,0,0.7,0),Position=UDim2.new(0.15,0,0.15,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=50})
            mkStroke(ring,T.ac,1)
            corner(ring,70)
        elseif style=="Square" then
            S.radarFrame.BackgroundTransparency=0.2
            corner(S.radarFrame,4)
        elseif style=="Hex" then
            S.radarFrame.BackgroundTransparency=0.3
            corner(S.radarFrame,16)
            new("Frame",S.radarFrame,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0.33,0),BackgroundColor3=T.ac,BackgroundTransparency=0.65,BorderSizePixel=0,ZIndex=50})
            new("Frame",S.radarFrame,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0.66,0),BackgroundColor3=T.ac,BackgroundTransparency=0.65,BorderSizePixel=0,ZIndex=50})
        else
            S.radarFrame.BackgroundTransparency=0.25
            corner(S.radarFrame,70)
        end
        local c=new("Frame",S.radarFrame,{Size=UDim2.new(0,5,0,5),Position=UDim2.new(0.5,-2.5,0.5,-2.5),BackgroundColor3=T.ac,BorderSizePixel=0,ZIndex=51})
        corner(c,style=="Cross" and 1 or 3)
    end
    mkTog(s,Y,{label="Vehicle ESP",default=false,color=T.ac,cb=function(en)
        S.vehEspOn=en
        S.tgtTypes.Vehicles=en
        if not en then
            for _,d in pairs(S.vehESP) do hideVEB(d) end
        end
    end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"ESP Visibility");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="ESP Transparency",min=0,max=90,default=math.floor((S.espVisAlpha or 0)*100),suffix="%",cb=function(v)
        S.espVisAlpha=v/100
    end});Y=Y+SL_H+GAP
    mkSL(s,Y,"ESP Colours");Y=Y+SEC_H+GAP
    local boxPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espBoxCol,BorderSizePixel=0});corner(boxPrev,6)
    mkBtn(s,Y,"ESP Box Colour  →",function()
        S.colorPickerTarget="espBox"
        if openColorPicker then openColorPicker(S.espBoxCol,function(c)
            S.espBoxCol=c;S.espBoxR=mfl(c.R*255);S.espBoxG=mfl(c.G*255);S.espBoxB=mfl(c.B*255)
            boxPrev.BackgroundColor3=c
        end) end
    end);Y=Y+TOG_H+GAP
    local trPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espTracerCol,BorderSizePixel=0});corner(trPrev,6)
    mkBtn(s,Y,"ESP Tracer Colour  →",function()
        S.colorPickerTarget="espTracer"
        if openColorPicker then openColorPicker(S.espTracerCol,function(c)
            S.espTracerCol=c;S.espTrR=mfl(c.R*255);S.espTrG=mfl(c.G*255);S.espTrB=mfl(c.B*255)
            trPrev.BackgroundColor3=c
        end) end
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Accent Colour  →",function()
        S.colorPickerTarget="accent"
        if openColorPicker then openColorPicker(T.ac,function(c)
            T.ac=c
            for _,r in ipairs(reg.ac) do if r[1] and r[1].Parent then r[1][r[2]]=c end end
        end) end
    end);Y=Y+TOG_H+GAP
    -- per-visual colour pickers
    local skelPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espSkeletonCol or S.espBoxCol,BorderSizePixel=0});corner(skelPrev,6)
    mkBtn(s,Y,"Skeleton Colour  →",function()
        if openColorPicker then openColorPicker(S.espSkeletonCol or S.espBoxCol,function(c)
            S.espSkeletonCol=c;skelPrev.BackgroundColor3=c
        end) end
    end);Y=Y+TOG_H+GAP
    local headPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espHeadDotCol or S.espBoxCol,BorderSizePixel=0});corner(headPrev,6)
    mkBtn(s,Y,"Head Dot Colour  →",function()
        if openColorPicker then openColorPicker(S.espHeadDotCol or S.espBoxCol,function(c)
            S.espHeadDotCol=c;headPrev.BackgroundColor3=c
        end) end
    end);Y=Y+TOG_H+GAP
    local chamPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espChamsCol or S.espBoxCol,BorderSizePixel=0});corner(chamPrev,6)
    mkBtn(s,Y,"Chams Colour  →",function()
        if openColorPicker then openColorPicker(S.espChamsCol or S.espBoxCol,function(c)
            S.espChamsCol=c;chamPrev.BackgroundColor3=c
            if S.chamsHL then S.chamsHL.FillColor=c end
        end) end
    end);Y=Y+TOG_H+GAP
    local radPrev=new("Frame",s,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,PAD,0,Y+4),BackgroundColor3=S.espRadarCol or T.ac,BorderSizePixel=0});corner(radPrev,6)
    mkBtn(s,Y,"Radar Colour  →",function()
        if openColorPicker then openColorPicker(S.espRadarCol or T.ac,function(c)
            S.espRadarCol=c;radPrev.BackgroundColor3=c
        end) end
    end);Y=Y+TOG_H+GAP
    mkDropdown(s,Y,"Faction Mode",{"tag","name"},S.espFactionMode,function(v) S.espFactionMode=v end);Y=Y+56+GAP
    mkSL(s,Y,"Chams");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Self Chams",bindKey="chams",default=false,color=T.ac,cb=function(en) S.chamsOn=en;applyChams(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Enemy Chams",default=false,color=T.ac,cb=function(en)
        S.enemyChams=en
        if not en then
            for _,p in pairs(Players:GetPlayers()) do
                if p~=plr and p.Character then
                    for _,part in pairs(p.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local h=part:FindFirstChild("CH_Chams")
                            if h then h:Destroy() end
                        end
                    end
                end
            end
        end
    end});Y=Y+TOG_H+GAP

    -- 3D Visuals preview (rotating dummy + live ESP overlays)
    mkSL(s,Y,"Visuals Preview");Y=Y+SEC_H+GAP
    local prevFrame=new("Frame",s,{
        Size=UDim2.new(1,-PAD*2,0,200),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,BorderSizePixel=0,ClipsDescendants=true
    });corner(prevFrame,CORNER);mkStroke(prevFrame,T.bd);Y=Y+208
    local vp=new("ViewportFrame",prevFrame,{
        Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(8,10,16),BorderSizePixel=0
    })
    local ov=new("Frame",prevFrame,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,ZIndex=5})
    local box=new("Frame",ov,{Size=UDim2.new(0,54,0,100),Position=UDim2.new(0.5,-27,0.5,-55),BackgroundTransparency=1,BorderSizePixel=0})
    local boxSt=new("UIStroke",box,{Color=S.espBoxCol or T.ac,Thickness=1.5})
    local headDot=new("Frame",ov,{Size=UDim2.new(0,8,0,8),Position=UDim2.new(0.5,-4,0.5,-62),BackgroundColor3=S.espBoxCol or T.ac,BorderSizePixel=0});corner(headDot,4)
    local hpBg=new("Frame",ov,{Size=UDim2.new(0,4,0,100),Position=UDim2.new(0.5,-35,0.5,-55),BackgroundColor3=Color3.fromRGB(20,20,28),BorderSizePixel=0})
    local hpFill=new("Frame",hpBg,{Size=UDim2.new(1,0,0.72,0),Position=UDim2.new(0,0,0.28,0),BackgroundColor3=Color3.fromRGB(80,220,100),BorderSizePixel=0})
    local nameLbl=new("TextLabel",ov,{Size=UDim2.new(0,120,0,16),Position=UDim2.new(0.5,-60,0.5,-78),BackgroundTransparency=1,
        Text="Preview",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=12})
    local distLbl=new("TextLabel",ov,{Size=UDim2.new(0,40,0,14),Position=UDim2.new(0.5,30,0.5,-10),BackgroundTransparency=1,
        Text="42m",TextColor3=Color3.fromRGB(165,170,195),Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
    local avPrev=new("ImageLabel",ov,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0.5,-11,0.5,-90),BackgroundColor3=T.bgS,BorderSizePixel=0,Image=getAvatarThumb(plr.UserId,48)});corner(avPrev,11)
    local tracer=new("Frame",ov,{Size=UDim2.new(0,2,0,36),Position=UDim2.new(0.5,-1,1,-40),BackgroundColor3=S.espTracerCol or T.ac,BorderSizePixel=0})
    local skLines={}
    local skPts={{0.5,-50,0.5,-20},{0.5,-20,0.5,10},{0.5,-20,0.35,-5},{0.35,-5,0.28,15},{0.5,-20,0.65,-5},{0.65,-5,0.72,15},{0.5,10,0.4,40},{0.4,40,0.38,55},{0.5,10,0.6,40},{0.6,40,0.62,55}}
    for _,pt in ipairs(skPts) do
        local ln=new("Frame",ov,{BackgroundColor3=S.espBoxCol or T.ac,BorderSizePixel=0,ZIndex=6})
        skLines[#skLines+1]={ln,pt}
    end
    local vBox=new("Frame",ov,{Size=UDim2.new(0,48,0,28),Position=UDim2.new(0.78,-10,0.55,-14),BackgroundTransparency=1,BorderSizePixel=0})
    local vSt=new("UIStroke",vBox,{Color=Color3.fromRGB(255,190,40),Thickness=1.5})
    local vName=new("TextLabel",ov,{Size=UDim2.new(0,70,0,12),Position=UDim2.new(0.78,-20,0.55,-28),BackgroundTransparency=1,Text="Tank",TextColor3=Color3.fromRGB(255,200,80),Font=Enum.Font.GothamBold,TextSize=10})
    local vDist=new("TextLabel",ov,{Size=UDim2.new(0,40,0,12),Position=UDim2.new(0.78,30,0.55,-6),BackgroundTransparency=1,Text="85m",TextColor3=Color3.fromRGB(255,190,40),Font=Enum.Font.Gotham,TextSize=9,TextXAlignment=Enum.TextXAlignment.Left})
    task.spawn(function()
        while ov and ov.Parent do
            local c=S.espBoxCol or T.ac
            boxSt.Color=c;headDot.BackgroundColor3=c;tracer.BackgroundColor3=S.espTracerCol or c
            box.Visible=S.espLines~=false;headDot.Visible=S.espHeadDot~=false
            nameLbl.Visible=S.espNames~=false;distLbl.Visible=S.espDist~=false
            hpBg.Visible=S.espHealth~=false;avPrev.Visible=S.espAvatar~=false;tracer.Visible=S.espTracers~=false
            local skOn=S.espSkeleton==true
            for _,item in ipairs(skLines) do
                local ln,pt=item[1],item[2]
                ln.Visible=skOn
                if skOn then
                    local x1,y1,x2,y2=pt[1],pt[2],pt[3],pt[4]
                    local dx=(x2-x1)*(ov.AbsoluteSize.X>0 and ov.AbsoluteSize.X or 200)
                    local dy=y2-y1
                    local len=math.sqrt(dx*dx+dy*dy)
                    ln.BackgroundColor3=S.espSkeletonCol or c
                    ln.Size=UDim2.new(0,math.max(1,len),0,2)
                    ln.Position=UDim2.new(x1,-1,0.5,y1)
                    ln.Rotation=math.deg(math.atan2(dy,dx))
                    ln.AnchorPoint=Vector2.new(0,0.5)
                end
            end
            local vehOn=S.vehEspOn==true
            vBox.Visible=vehOn;vName.Visible=vehOn;vDist.Visible=vehOn and S.espDist~=false
            task.wait(0.25)
        end
    end)
    task.spawn(function()
        pcall(function()
            local world=Instance.new("WorldModel");world.Parent=vp
            local dummy=Instance.new("Model");dummy.Name="PreviewDummy";dummy.Parent=world
            local function part(name,size,cf,col)
                local p=Instance.new("Part")
                p.Name=name;p.Size=size;p.CFrame=cf;p.Anchored=true;p.CanCollide=false
                p.Color=col or Color3.fromRGB(160,165,190);p.Material=Enum.Material.SmoothPlastic
                p.TopSurface=Enum.SurfaceType.Smooth;p.BottomSurface=Enum.SurfaceType.Smooth
                p.Parent=dummy;return p
            end
            -- Proper R6 humanoid proportions
            local torso=part("Torso",Vector3.new(2,2,1),CFrame.new(0,1,0),Color3.fromRGB(91,154,76))
            local head=part("Head",Vector3.new(1.2,1.2,1.2),CFrame.new(0,2.6,0),Color3.fromRGB(245,205,148))
            local face=Instance.new("Decal");face.Texture="rbxasset://textures/face.png";face.Face=Enum.NormalId.Front;face.Parent=head
            part("Left Arm",Vector3.new(1,2,1),CFrame.new(-1.5,1,0),Color3.fromRGB(245,205,148))
            part("Right Arm",Vector3.new(1,2,1),CFrame.new(1.5,1,0),Color3.fromRGB(245,205,148))
            part("Left Leg",Vector3.new(1,2,1),CFrame.new(-0.5,-1,0),Color3.fromRGB(82,124,174))
            part("Right Leg",Vector3.new(1,2,1),CFrame.new(0.5,-1,0),Color3.fromRGB(82,124,174))
            local hum2=Instance.new("Humanoid");hum2.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None;hum2.Parent=dummy
            dummy.PrimaryPart=torso
            local cam2=Instance.new("Camera");cam2.Parent=vp;vp.CurrentCamera=cam2
            cam2.CFrame=CFrame.new(Vector3.new(0,1.2,5.2),Vector3.new(0,1.0,0))
            local ang=0
            RS.RenderStepped:Connect(function(dt)
                if not vp.Parent then return end
                ang=ang+dt*0.65
                pcall(function()
                    dummy:SetPrimaryPartCFrame(CFrame.new(0,0.9,0)*CFrame.Angles(0,ang,0))
                end)
            end)
        end)
    end)

    -- Nebula Theme (PasteWare)
    mkSL(s,Y,"Nebula Theme");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Nebula Theme",default=false,color=T.ac,cb=function(en)
        S.nebulaEnabled = en
        pcall(function()
            if en then
                local b = Instance.new("BloomEffect")
                b.Name = "NebulaBloom"
                b.Intensity = 0.6
                b.Size = 40
                b.Threshold = 0.9
                b.Parent = Li
                local c = Instance.new("ColorCorrectionEffect")
                c.Name = "NebulaColorCorrection"
                c.TintColor = S.nebulaThemeColor or Color3.fromRGB(173,216,230)
                c.Saturation = 0.2
                c.Contrast = 0.1
                c.Parent = Li
                local a = Instance.new("Atmosphere")
                a.Name = "NebulaAtmosphere"
                a.Density = 0.3
                a.Offset = 0.25
                a.Color = S.nebulaThemeColor or Color3.fromRGB(173,216,230)
                a.Decay = Color3.fromRGB(100,120,180)
                a.Glare = 0.2
                a.Haze = 1.5
                a.Parent = Li
                local col = S.nebulaThemeColor or Color3.fromRGB(173,216,230)
                if not S._nebulaOrig then
                    S._nebulaOrig = {
                        Ambient = Li.Ambient,
                        OutdoorAmbient = Li.OutdoorAmbient,
                        FogStart = Li.FogStart,
                        FogEnd = Li.FogEnd,
                        FogColor = Li.FogColor,
                    }
                end
                Li.Ambient = col
                Li.OutdoorAmbient = col
                Li.FogStart = 0
                Li.FogEnd = 1000
                Li.FogColor = col
            else
                for _, name in ipairs({"NebulaBloom","NebulaColorCorrection","NebulaAtmosphere"}) do
                    local o = Li:FindFirstChild(name)
                    if o then o:Destroy() end
                end
                if S._nebulaOrig then
                    Li.Ambient = S._nebulaOrig.Ambient
                    Li.OutdoorAmbient = S._nebulaOrig.OutdoorAmbient
                    Li.FogStart = S._nebulaOrig.FogStart
                    Li.FogEnd = S._nebulaOrig.FogEnd
                    Li.FogColor = S._nebulaOrig.FogColor
                end
            end
        end)
        showToggleNotif("Nebula", en)
    end});Y=Y+TOG_H+GAP

    mkSL(s,Y,"Performance");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Clean Explosions",default=false,color=T.ac,cb=function(en) S.cleanOn=en;applyClean(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Remove All Explosions",default=false,color=T.ac,cb=function(en) applyNoExp(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Mute Explosions",default=false,color=T.ac,cb=function(en) applyExpSound(en) end});Y=Y+TOG_H+GAP
    mkSL(s,Y,"Camera");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="No Screen Shake",default=false,color=T.ac,cb=function(en) S.noShakeOn=en;applyNoShake(en) end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Field of View",min=60,max=120,default=70,suffix="°",cb=function(v) cam.FieldOfView=v end});Y=Y+SL_H+GAP
        mkSL(s,Y,"Radar");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Radar (minimap)",default=false,color=T.ac,cb=function(en)
        S.espRadar=en
        if en then
            if not S.radarFrame then
                S.radarFrame=new("Frame",sg,{
                    Size=UDim2.new(0,140,0,140),Position=UDim2.new(1,-156,0,60),
                    BackgroundColor3=T.bg,BackgroundTransparency=0.25,BorderSizePixel=0,ZIndex=50
                });mkStroke(S.radarFrame,T.ac,1)
            end
            applyRadarStyle()
            S.radarFrame.Visible=true
        elseif S.radarFrame then S.radarFrame.Visible=false end
    end});Y=Y+TOG_H+GAP
    mkDropdown(s,Y,"Radar Style",{"Default","Dot","Cross","Grid","Minimal","Ring","Square","Hex"},S.radarStyle or "Default",function(v)
        S.radarStyle=v
        if S.radarFrame then applyRadarStyle() end
    end);Y=Y+56+GAP
    mkSl(s,Y,{label="Radar Range",min=50,max=1000,default=S.radarRange or 250,suffix=" st",cb=function(v) S.radarRange=v end});Y=Y+SL_H+GAP
s.CanvasSize=UDim2.new(0,0,0,Y+10)
end

local function buildWorld()
    _curBuildTab="World"
    local s=tabC["World"].scroll;local Y=8
mkSL(s,Y,"World");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Fullbright",bindKey="fullbright",default=false,color=T.ac,cb=function(en) S.brightOn=en;applyBright(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="No Fog",bindKey="noFog",default=false,color=T.ac,cb=function(en) S.fogOn=en;applyFog(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="X-Ray",bindKey="xray",default=false,color=T.ac,cb=function(en) S.xrayOn=en;applyXR(en) end});Y=Y+TOG_H+GAP

    mkSL(s,Y,"World Editor");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Time of Day",min=0,max=24,default=12,suffix="h",cb=function(v)
        S.lockedClockTime=v;Li.ClockTime=v
        if S.clockLock or S.nightModeOn then S.clockLock=true end
    end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Lock Time of Day (anti-reset)",default=false,color=T.ac,cb=function(en)
        S.clockLock=en
        if en then
            S.lockedClockTime=Li.ClockTime or S.lockedClockTime or 12
            Li.ClockTime=S.lockedClockTime
        end
        showPopup("Clock Lock",en and ("Locked @ "..string.format("%.1f",S.lockedClockTime)) or "Unlocked",T.ac)
    end});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Brightness",min=0,max=10,default=2,cb=function(v) Li.Brightness=v end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Fog Start",min=0,max=1000,default=0,cb=function(v) Li.FogStart=v end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Fog End",min=50,max=100000,default=100000,cb=function(v) Li.FogEnd=v end});Y=Y+SL_H+GAP
    mkBtn(s,Y,"Fog Colour  →",function()
        if openColorPicker then openColorPicker(Li.FogColor,function(c) Li.FogColor=c end) end
    end);Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Haze Density",min=0,max=1,default=0.3,cb=function(v)
        S.hazeDensity=v
        applyHaze(v,nil,nil)
    end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Haze Strength",min=0,max=10,default=0,cb=function(v)
        S.hazeStrength=v
        applyHaze(nil,v,nil)
    end});Y=Y+SL_H+GAP
    mkBtn(s,Y,"Haze Colour  →",function()
        local a=ensureAtmosphere()
        if openColorPicker then openColorPicker(a.Color,function(c) a.Color=c;S.hazeColor=c end) end
    end);Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Night Mode",default=false,color=T.ac,cb=function(en)
        S.nightModeOn=en
        if en then
            S.clockLock=true
            S.lockedClockTime=0
            Li.ClockTime=0
        else
            S.lockedClockTime=14
            Li.ClockTime=14
        end
        showPopup("Night Mode",en and "Permanent night" or "Day",T.ac)
    end});Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Clear Fog",function() Li.FogEnd=1e6;Li.FogStart=0;showPopup("World","Fog cleared",T.ok) end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Reset Haze (soft look)",function()
        local a=ensureAtmosphere()
        a.Density=0.3;a.Haze=0;a.Color=Color3.fromRGB(199,199,199)
        a.Decay=Color3.fromRGB(92,92,92);a.Glare=0;a.Offset=0
        S.hazeDensity=0.3;S.hazeStrength=0
        showPopup("World","Soft haze restored",T.ok)
    end);Y=Y+TOG_H+GAP
    mkDropdown(s,Y,"Skybox",{
        "Game's Default","Blue Horizon","Cloudy","Sunset Gold","Midnight",
        "Pink Dusk","Storm Grey","Deep Space","Arctic Ice","Roblox Classic","Crimson Night","Nebula Purple"
    },S.skyboxSelected or "Game's Default",function(v)
        S.skyboxSelected=v
        pcall(function()
            local function ensureSky()
                local sky=Li:FindFirstChildOfClass("Sky")
                if not sky then sky=Instance.new("Sky");sky.Parent=Li end
                return sky
            end
            local function setSky(bk,dn,ft,lf,rt,up)
                local sky=ensureSky()
                sky.SkyboxBk=bk;sky.SkyboxDn=dn;sky.SkyboxFt=ft
                sky.SkyboxLf=lf;sky.SkyboxRt=rt;sky.SkyboxUp=up
                sky.CelestialBodiesShown=true
            end
            -- Working / normalized rbxassetid packs (6 faces)
            if v=="Game's Default" then
                local sky=Li:FindFirstChildOfClass("Sky")
                if sky then sky:Destroy() end
            elseif v=="Blue Horizon" then
                setSky(
                    "rbxassetid://591058823","rbxassetid://591059876","rbxassetid://591058104",
                    "rbxassetid://591057861","rbxassetid://591057625","rbxassetid://591059642"
                )
            elseif v=="Cloudy" then
                setSky(
                    "rbxassetid://600830446","rbxassetid://600831635","rbxassetid://600832720",
                    "rbxassetid://600886090","rbxassetid://600833862","rbxassetid://600835177"
                )
            elseif v=="Sunset Gold" then
                setSky(
                    "rbxassetid://458016711","rbxassetid://458016826","rbxassetid://458016791",
                    "rbxassetid://458016655","rbxassetid://458016782","rbxassetid://458016792"
                )
            elseif v=="Midnight" then
                setSky(
                    "rbxassetid://12064107","rbxassetid://12064152","rbxassetid://12064121",
                    "rbxassetid://12064115","rbxassetid://12064125","rbxassetid://12064131"
                )
            elseif v=="Pink Dusk" then
                setSky(
                    "rbxassetid://271042516","rbxassetid://271077191","rbxassetid://271042556",
                    "rbxassetid://271042310","rbxassetid://271042467","rbxassetid://271077958"
                )
            elseif v=="Storm Grey" then
                setSky(
                    "rbxassetid://153095369","rbxassetid://153095394","rbxassetid://153095420",
                    "rbxassetid://153095442","rbxassetid://153095462","rbxassetid://153095488"
                )
            elseif v=="Deep Space" then
                setSky(
                    "rbxassetid://159454299","rbxassetid://159454296","rbxassetid://159454286",
                    "rbxassetid://159454293","rbxassetid://159454288","rbxassetid://159454300"
                )
            elseif v=="Arctic Ice" then
                setSky(
                    "rbxassetid://225469390","rbxassetid://225469395","rbxassetid://225469403",
                    "rbxassetid://225469450","rbxassetid://225469471","rbxassetid://225469481"
                )
            elseif v=="Roblox Classic" then
                setSky(
                    "rbxasset://textures/sky/sky512_bk.tex","rbxasset://textures/sky/sky512_dn.tex","rbxasset://textures/sky/sky512_ft.tex",
                    "rbxasset://textures/sky/sky512_lf.tex","rbxasset://textures/sky/sky512_rt.tex","rbxasset://textures/sky/sky512_up.tex"
                )
            elseif v=="Crimson Night" then
                setSky(
                    "rbxassetid://401664839","rbxassetid://401664862","rbxassetid://401664877",
                    "rbxassetid://401664901","rbxassetid://401664922","rbxassetid://401664937"
                )
            elseif v=="Nebula Purple" then
                setSky(
                    "rbxassetid://1496034655","rbxassetid://1496034655","rbxassetid://1496034655",
                    "rbxassetid://1496034655","rbxassetid://1496034655","rbxassetid://1496034655"
                )
            end
        end)
        showPopup("Skybox",tostring(v),T.ac)
    end);Y=Y+56+GAP

    
    mkSL(s,Y,"Map Tools");Y=Y+SEC_H+GAP
    local ds=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,16),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Owner / Laser Doors",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});ra("tM",ds,"TextColor3");Y=Y+18
    local function isLaserDoor(n) local l=n:lower();return l:find("owner") or l:find("laser") end
    local function rmDoors()
        local n=0
        local tf=workspace:FindFirstChild("Tycoon");if not tf then return 0 end
        for _,d in ipairs(tf:GetDescendants()) do
            if d:IsA("BasePart") or d:IsA("Model") then
                if isLaserDoor(d.Name) then pcall(function() d:Destroy() end);n=n+1 end
            end
        end
        return n
    end
    mkBtn(s,Y,"Remove Owner / Laser Doors",function()
        ds.Text="Scanning..."
        task.spawn(function()
            local r=rmDoors()
            ds.Text=r>0 and("Removed "..r.." object(s) ✓") or"None found"
        end)
    end);Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Destroy Buildings/Bridges",default=false,color=T.ng,cb=function(en)
        S.destroyBuildings=en
        if en then showPopup("World","Building destroy ON",T.ng) end
    end});Y=Y+TOG_H+GAP
    s.CanvasSize=UDim2.new(0,0,0,Y+40)
end

function buildPlayer()
    _curBuildTab="Player"
    local s=tabC["Player"].scroll;local Y=8

    -- Hitbox
    mkSL(s,Y,"Hitbox");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Box Size",min=5,max=60,default=20,suffix=" st",cb=function(v) S.hitboxSize=v;CHQueueSave() end});Y=Y+SL_H+GAP
    mkTog(s,Y,{label="Hitbox Expand",bindKey="hitbox",default=false,color=T.ac,cb=function(en) S.hitboxOn=en;applyHitbox(en) end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Hitbox (Visual)",bindKey="hitboxVis",default=false,color=T.ac,cb=function(en) S.hitboxVisOn=en;applyHitboxVis(en) end});Y=Y+TOG_H+GAP
    mkDropdown(s,Y,"Hitbox Part",{"Body","Head"},S.hitboxVisPart,function(v)
        S.hitboxVisPart=v
        if S.hitboxVisOn then applyHitboxVis(false);applyHitboxVis(true) end
    end);Y=Y+56+GAP

    -- Combat extras
    mkSL(s,Y,"Combat");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Fling All Players",default=false,color=T.ng,cb=function(en)
        S.flingAll=en
        if S.flingConn then S.flingConn:Disconnect();S.flingConn=nil end
        if en then
            S.flingConn=RS.Heartbeat:Connect(function()
                if not S.flingAll or not hrp then return end
                for _,p in pairs(Players:GetPlayers()) do
                    if p~=plr and p.Character then
                        local th=p.Character:FindFirstChild("HumanoidRootPart")
                        if th then
                            pcall(function()
                                -- sit on them briefly and apply velocity (classic fling)
                                local bv=Instance.new("BodyVelocity")
                                bv.MaxForce=Vector3.new(1e5,1e5,1e5)
                                bv.Velocity=Vector3.new(mra(-1e4,1e4),1e4,mra(-1e4,1e4))
                                bv.Parent=th
                                task.delay(0.1,function() if bv then bv:Destroy() end end)
                            end)
                        end
                    end
                end
            end)
            showPopup("Fling","All players ON",T.ng)
        else
            showPopup("Fling","OFF",T.txM)
        end
    end});Y=Y+TOG_H+GAP

    -- Target HUD / Focus
    mkSL(s,Y,"Target HUD / Focus");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Focus Mode (ESP / Aim / RPG → focused only)",default=false,color=T.ac,cb=function(en)
        S.focusMode=en
        showPopup("Focus Mode",en and "ON — ESP, aimbot & RPG locked to focused" or "OFF — all players",T.ac)
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Show Target HUD",default=false,color=T.ac,cb=function(en)
        S.targetHudOn=en
        if en then
            if not S.targetHudFrame then
                S.targetHudFrame=new("Frame",sg,{
                    Size=UDim2.new(0,220,0,0),Position=UDim2.new(0.5,-110,0,80),
                    BackgroundColor3=T.bg,BackgroundTransparency=0.12,BorderSizePixel=0,ZIndex=55
                });corner(S.targetHudFrame,10);mkStroke(S.targetHudFrame,T.ac,1.5)
                S.targetHudList=new("Frame",S.targetHudFrame,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1})
            end
            S.targetHudFrame.Visible=true
        elseif S.targetHudFrame then S.targetHudFrame.Visible=false end
    end});Y=Y+TOG_H+GAP
    local focusLbl=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,16),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Focused: none",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left});ra("tM",focusLbl,"TextColor3")
    Y=Y+20
    local function refreshFocusLbl()
        local names={}
        for n,v in pairs(S.focusTargets) do if v then names[#names+1]=n end end
        if focusLbl and focusLbl.Parent then
            focusLbl.Text=#names>0 and ("Focused: "..table.concat(names,", ")) or "Focused: none"
        end
        -- update HUD
        if S.targetHudOn and not S.targetHudFrame then
            S.targetHudFrame=new("Frame",sg,{
                Size=UDim2.new(0,220,0,80),Position=UDim2.new(0.5,-110,0,80),
                BackgroundColor3=T.bg,BackgroundTransparency=0.12,BorderSizePixel=0,ZIndex=55
            });corner(S.targetHudFrame,10);mkStroke(S.targetHudFrame,T.ac,1.5)
            S.targetHudList=new("Frame",S.targetHudFrame,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1})
        end
        if S.targetHudFrame and S.targetHudList then
            S.targetHudFrame.Visible=S.targetHudOn or next(S.focusTargets)~=nil
            S.targetHudList:ClearAllChildren()
            local hy=8
            new("TextLabel",S.targetHudList,{Size=UDim2.new(1,-12,0,16),Position=UDim2.new(0,8,0,hy),BackgroundTransparency=1,
                Text="TARGET HUD",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
            hy=hy+20
            if #names==0 then
                new("TextLabel",S.targetHudList,{Size=UDim2.new(1,-12,0,14),Position=UDim2.new(0,8,0,hy),BackgroundTransparency=1,
                    Text="No targets focused",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10})
                hy=hy+20
            else
                for _,n in ipairs(names) do
                    local p=Players:FindFirstChild(n)
                    local row=new("Frame",S.targetHudList,{Size=UDim2.new(1,-12,0,28),Position=UDim2.new(0,6,0,hy),BackgroundColor3=T.bgT,BorderSizePixel=0})
                    corner(row,6)
                    if p then
                        local img=new("ImageLabel",row,{Size=UDim2.new(0,22,0,22),Position=UDim2.new(0,4,0.5,-11),BackgroundTransparency=1,Image=getAvatarThumb(p.UserId,48)})
                        corner(img,11)
                    end
                    new("TextLabel",row,{Size=UDim2.new(1,-36,1,0),Position=UDim2.new(0,30,0,0),BackgroundTransparency=1,
                        Text=n,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
                    hy=hy+32
                end
            end
            S.targetHudFrame.Size=UDim2.new(0,220,0,hy+8)
        end
    end
    local focusList=new("ScrollingFrame",s,{Position=UDim2.new(0,PAD,0,Y),Size=UDim2.new(1,-PAD*2,0,120),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.05})
    corner(focusList,8);mkStroke(focusList,T.bd);ra("bS",focusList,"BackgroundColor3");raScroll(focusList);Y=Y+128
    local function refFocusList()
        focusList:ClearAllChildren();local cy=4
        for _,p in ipairs(Players:GetPlayers()) do if p~=plr then
            local row=new("Frame",focusList,{Size=UDim2.new(1,-8,0,32),Position=UDim2.new(0,4,0,cy),BackgroundColor3=T.bgT,BackgroundTransparency=0.15,BorderSizePixel=0});ra("bT",row,"BackgroundColor3")
            corner(row,6)
            local img=new("ImageLabel",row,{Size=UDim2.new(0,24,0,24),Position=UDim2.new(0,6,0.5,-12),BackgroundTransparency=1,Image=getAvatarThumb(p.UserId,48)})
            corner(img,12)
            new("TextLabel",row,{Size=UDim2.new(1,-100,1,0),Position=UDim2.new(0,36,0,0),BackgroundTransparency=1,
                Text=p.Name,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
            local on=S.focusTargets[p.Name]==true
            local tb=new("TextButton",row,{Size=UDim2.new(0,56,0,22),Position=UDim2.new(1,-62,0.5,-11),
                BackgroundColor3=on and T.ac or T.bgS,Text=on and "ON" or "Focus",TextColor3=on and Color3.new(1,1,1) or T.tx,
                Font=Enum.Font.GothamBold,TextSize=10,BorderSizePixel=0});corner(tb,5)
            tb.MouseButton1Click:Connect(function()
                S.focusTargets[p.Name]=not S.focusTargets[p.Name]
                if S.focusTargets[p.Name]==false then S.focusTargets[p.Name]=nil end
                playSFX("click");refFocusList();refreshFocusLbl()
            end)
            cy=cy+36
        end end
        focusList.CanvasSize=UDim2.new(0,0,0,cy+4)
        refreshFocusLbl()
    end
    refFocusList()
    refreshTargetHud=refreshFocusLbl
    mkBtn(s,Y,"Clear All Focus",function()
        S.focusTargets={};refFocusList();refreshFocusLbl();showPopup("Focus","Cleared",T.txM)
    end);Y=Y+TOG_H+GAP
    Players.PlayerAdded:Connect(function() task.defer(refFocusList) end)
    Players.PlayerRemoving:Connect(function(p) S.focusTargets[p.Name]=nil;task.defer(refFocusList) end)

    -- Spectate
    mkSL(s,Y,"Spectate / POV");Y=Y+SEC_H+GAP
    local specLbl=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,16),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Target: none",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
    Y=Y+20
    local function cycleSpec(dir)
        local list={}
        for _,p in ipairs(Players:GetPlayers()) do if p~=plr then list[#list+1]=p end end
        if #list==0 then showPopup("Spectate","No players",T.wn);return end
        local idx=1
        if S.spectateTarget then
            for i,p in ipairs(list) do if p==S.spectateTarget then idx=i;break end end
            idx=((idx-1+dir)%#list)+1
        end
        S.spectateTarget=list[idx];S.spectating=true
        local c=S.spectateTarget.Character
        local h=c and c:FindFirstChildOfClass("Humanoid")
        if h then cam.CameraSubject=h end
        specLbl.Text="Target: "..S.spectateTarget.Name
        showPopup("Spectating",S.spectateTarget.Name,T.ac)
    end
    mkBtn(s,Y,"Spectate Next",function() cycleSpec(1) end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Spectate Prev",function() cycleSpec(-1) end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Stop Spectating",function()
        S.spectating=false;S.spectateTarget=nil
        if hum then cam.CameraSubject=hum end
        specLbl.Text="Target: none"
        showPopup("Spectate","Back to self",T.ok)
    end);Y=Y+TOG_H+GAP

    -- Teleport
    mkSL(s,Y,"Teleport to Player");Y=Y+SEC_H+GAP
    local tpList=new("ScrollingFrame",s,{Position=UDim2.new(0,PAD,0,Y),Size=UDim2.new(1,-PAD*2,0,110),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,ScrollBarImageTransparency=0.3,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.1})
    corner(tpList,8);mkStroke(tpList,T.bd);ra("bS",tpList,"BackgroundColor3");Y=Y+114
    local function refTp()
        tpList:ClearAllChildren();local cy=2
        for _,p in pairs(Players:GetPlayers()) do if p~=plr then
            local row=new("Frame",tpList,{Size=UDim2.new(1,0,0,32),Position=UDim2.new(0,0,0,cy),BackgroundTransparency=1})
            local av=new("ImageLabel",row,{Size=UDim2.new(0,24,0,24),Position=UDim2.new(0,6,0.5,-12),BackgroundTransparency=1,Image=getAvatarThumb(p.UserId,48)})
            corner(av,12)
            new("TextLabel",row,{Size=UDim2.new(1,-100,1,0),Position=UDim2.new(0,36,0,0),BackgroundTransparency=1,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,Text=p.Name,TextXAlignment=Enum.TextXAlignment.Left})
            local tp2=p
            local tb=new("TextButton",row,{Size=UDim2.new(0,60,0,22),Position=UDim2.new(1,-64,0.5,-11),BackgroundColor3=Color3.fromRGB(60,120,220),TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.GothamBold,TextSize=10,Text="Teleport",BorderSizePixel=0});corner(tb,4)
            tb.MouseButton1Click:Connect(function()
                local tR=getCharRoot(tp2);if not tR then return end
                local myR=char and char:FindFirstChild("HumanoidRootPart");if not myR then return end
                myR.CFrame=tR.CFrame*CFrame.new(0,3,0)
            end)
            cy=cy+34
        end end
        tpList.CanvasSize=UDim2.new(0,0,0,cy)
    end
    Players.PlayerAdded:Connect(refTp);Players.PlayerRemoving:Connect(refTp);refTp()

    -- Bring
    mkSL(s,Y,"Bring Players");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Bring Distance",min=0,max=20,default=3,suffix=" st",cb=function(v) S.bringDist=v;CHQueueSave() end});Y=Y+SL_H+GAP
    local bringList=new("ScrollingFrame",s,{Position=UDim2.new(0,PAD,0,Y),Size=UDim2.new(1,-PAD*2,0,120),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,ScrollBarImageTransparency=0.3,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.1})
    corner(bringList,8);mkStroke(bringList,T.bd);ra("bS",bringList,"BackgroundColor3");Y=Y+124
    local function refBring()
        bringList:ClearAllChildren();local cy=2
        for _,p in pairs(Players:GetPlayers()) do if p~=plr then
            local row=new("Frame",bringList,{Size=UDim2.new(1,0,0,28),Position=UDim2.new(0,0,0,cy),BackgroundTransparency=1})
            new("TextLabel",row,{Size=UDim2.new(1,-72,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,Text=p.Name,TextXAlignment=Enum.TextXAlignment.Left})
            local target=p
            local bb=new("TextButton",row,{Size=UDim2.new(0,60,0,20),Position=UDim2.new(1,-64,0,4),BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=10,Text="Bring",BorderSizePixel=0});corner(bb,4);mkStroke(bb,T.bd)
            local function updBtn() if bringLoops[target] then bb.BackgroundColor3=T.ac;bb.TextColor3=Color3.fromRGB(0,0,0);bb.Text="Bringing" else bb.BackgroundColor3=T.bgT;bb.TextColor3=T.tx;bb.Text="Bring" end end
            bb.MouseButton1Click:Connect(function() if bringLoops[target] then stopBring(target) else startBring(target) end;updBtn() end)
            updBtn();cy=cy+30
        end end
        bringList.CanvasSize=UDim2.new(0,0,0,cy)
    end
    Players.PlayerAdded:Connect(refBring);Players.PlayerRemoving:Connect(function(p) stopBring(p);refBring() end);refBring()

    -- Orbit
    mkSL(s,Y,"Orbit Player");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Orbit Radius",min=5,max=200,default=20,suffix=" st",cb=function(v) S.orbitSpecDist=v;CHQueueSave() end});Y=Y+SL_H+GAP
    mkSl(s,Y,{label="Orbit Speed",min=10,max=720,default=90,suffix="°/s",cb=function(v) S.orbitSpecSpd=v;CHQueueSave() end});Y=Y+SL_H+GAP
	local orbitList=new("ScrollingFrame",s,{Position=UDim2.new(0,PAD,0,Y),Size=UDim2.new(1,-PAD*2,0,120),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,ScrollBarImageTransparency=0.3,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.1})
    corner(orbitList,8);mkStroke(orbitList,T.bd);ra("bS",orbitList,"BackgroundColor3");Y=Y+124
    mkSL(s,Y,"Utility");Y=Y+SEC_H+GAP
    mkTog(s, Y, {label = "Anti-AFK", default = false, color = T.ac, cb = function(en) S.antiAfkOn = en; applyAntiAfk(en) end}); Y = Y + TOG_H + GAP
    local orbitRows={}
    local function stopOrbitSpec() applyOrbitSpecific(false,nil);for _,r in ipairs(orbitRows) do if r.btn and r.btn.Parent then r.btn.BackgroundColor3=T.bgT;r.btn.TextColor3=T.tx;r.btn.Text="Orbit" end end end
    local function refOrbit()
        orbitList:ClearAllChildren();orbitRows={};local cy=2
        for _,p in pairs(Players:GetPlayers()) do if p~=plr then
            local row=new("Frame",orbitList,{Size=UDim2.new(1,0,0,28),Position=UDim2.new(0,0,0,cy),BackgroundTransparency=1})
            new("TextLabel",row,{Size=UDim2.new(1,-72,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,Text=p.Name,TextXAlignment=Enum.TextXAlignment.Left})
            local target=p
            local ob=new("TextButton",row,{Size=UDim2.new(0,60,0,20),Position=UDim2.new(1,-64,0,4),BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=10,Text="Orbit",BorderSizePixel=0});corner(ob,4);mkStroke(ob,T.bd)
            orbitRows[#orbitRows+1]={p=p,btn=ob}
            ob.MouseButton1Click:Connect(function()
                if S.orbitSpecTarget==target then stopOrbitSpec()
                else stopOrbitSpec();applyOrbitSpecific(true,target);ob.BackgroundColor3=T.ac;ob.TextColor3=Color3.fromRGB(0,0,0);ob.Text="Orbiting" end
            end);cy=cy+30
        end end
        orbitList.CanvasSize=UDim2.new(0,0,0,cy)
    end
    Players.PlayerAdded:Connect(refOrbit);Players.PlayerRemoving:Connect(function(p) if S.orbitSpecTarget==p then stopOrbitSpec() end;refOrbit() end);refOrbit()

    -- Whitelist
    mkSL(s,Y,"Whitelist");Y=Y+SEC_H+GAP
    local wf=new("ScrollingFrame",s,{Position=UDim2.new(0,PAD,0,Y),Size=UDim2.new(1,-PAD*2,0,120),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,ScrollBarImageTransparency=0.3,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.1})
    corner(wf,8);mkStroke(wf,T.bd);ra("bS",wf,"BackgroundColor3");Y=Y+124
    local function refWL()
        wf:ClearAllChildren();local cy=2
        for _,p in pairs(Players:GetPlayers()) do if p~=plr then
            local pn=p.Name
            local row=new("Frame",wf,{Size=UDim2.new(1,0,0,28),Position=UDim2.new(0,0,0,cy),BackgroundTransparency=1})
            new("TextLabel",row,{Size=UDim2.new(1,-54,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,Text=pn,TextXAlignment=Enum.TextXAlignment.Left});
            local en=S.wlist[pn] or false
            local tf=new("Frame",row,{Size=UDim2.new(0,42,0,22),Position=UDim2.new(1,-46,0,3),BackgroundColor3=en and T.ok or T.off,BorderSizePixel=0});corner(tf,11)
            local ci=new("Frame",tf,{Size=UDim2.new(0,16,0,16),Position=en and UDim2.new(1,-19,.5,-8) or UDim2.new(0,3,.5,-8),BackgroundColor3=en and Color3.fromRGB(255,255,255) or T.txD,BorderSizePixel=0});corner(ci,8)
            local btn=new("TextButton",tf,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""})
            btn.MouseButton1Click:Connect(function()
                en=not en;S.wlist[pn]=en and true or nil
                TwS:Create(tf,TweenInfo.new(0.12),{BackgroundColor3=en and T.ok or T.off}):Play()
                TwS:Create(ci,TweenInfo.new(0.12),{Position=en and UDim2.new(1,-19,.5,-8) or UDim2.new(0,3,.5,-8),BackgroundColor3=en and Color3.fromRGB(255,255,255) or T.txD}):Play()
            end)
            cy=cy+30
        end end
        wf.CanvasSize=UDim2.new(0,0,0,cy)
    end
    Players.PlayerAdded:Connect(refWL);Players.PlayerRemoving:Connect(refWL);refWL()

    mkSL(s,Y,"Nametag");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Hide Nametag  (server)",default=false,color=T.ng,cb=function(en) applyHideNametag(en) end});Y=Y+TOG_H+GAP


    mkSL(s,Y,"Voice Chat");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"VC Unlocker",function()
        task.spawn(function()
            local ok,err=pcall(function()
                local vcs=game:GetService("VoiceChatService")
                if vcs then
                    pcall(function() vcs:joinVoice() end)
                    pcall(function()
                        -- common executor unlock paths
                        if getconnections then
                            for _,c in pairs(getconnections(vcs.ParticipantsStateChanged or Instance.new("BindableEvent").Event)) do
                                pcall(function() c:Disable() end)
                            end
                        end
                    end)
                end
                -- Force-enable voice UI / mic
                pcall(function()
                    local StarterGui=game:GetService("StarterGui")
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat,true)
                end)
                S.vcUnlocked=true
            end)
            if ok then showPopup("VC Unlocker","Voice chat unlocked",T.ok)
            else showPopup("VC Unlocker",tostring(err):sub(1,40),T.wn) end
        end)
    end);Y=Y+TOG_H+GAP

    mkSL(s,Y,"World / Utility");Y=Y+SEC_H+GAP
    
    mkTog(s,Y,{label="Instant Medkit",default=false,color=T.ac,cb=function(en) S.instantMedkit=en end});Y=Y+TOG_H+GAP


    s.CanvasSize=UDim2.new(0,0,0,Y+12)
end

local function buildMisc()
    _curBuildTab="Misc"
    local s=tabC["Misc"].scroll;local Y=8

    -- ===== Load External Exploits (grid) =====
    mkSL(s,Y,"Load Exploit");Y=Y+SEC_H+GAP
    local exploits={
        {n="Infinite Yield",  ico="terminal",  u="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
        {n="Dex Explorer",    ico="folder-tree",u="https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"},
        {n="SimpleSpy V3",    ico="bug",       u="https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
        {n="Hydroxide",       ico="flask-conical",u="https://raw.githubusercontent.com/upio/hydroxide/revision/init.lua"},
        {n="RemoteSpy",       ico="radar",     u="https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"},
        {n="Unnamed ESP",     ico="eye",       u="https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"},
        {n="DarkDex V4",      ico="box",       u="https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"},
        {n="Orca",            ico="fish",      u="https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"},
        {n="Twizz Aimbot",    ico="crosshair", u="https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua"},
    }
    local function loadExploit(ex)
        showPopup("Loading…",ex.n,T.wn)
        task.spawn(function()
            local ok,err=pcall(function()
                local src
                pcall(function() src=game:HttpGet(ex.u) end)
                if not src or src=="" then error("HttpGet failed") end
                local fn,cerr=loadstring(src)
                if not fn then error(cerr or "compile error") end
                fn()
            end)
            if ok then showPopup("Loaded",ex.n.." ready",T.ok)
            else showPopup("Failed",tostring(err):sub(1,48),T.ng) end
        end)
    end
    local COLS=2
    local CARD_H=56
    local CARD_GAP=8
    local gridW -- full width inside pad
    for i,ex in ipairs(exploits) do
        local col=(i-1)%COLS
        local row=mfl((i-1)/COLS)
        local card=new("TextButton",s,{
            Size=UDim2.new(0.5,-(PAD+CARD_GAP/2),0,CARD_H),
            Position=UDim2.new(col*0.5,PAD+(col>0 and CARD_GAP/2 or 0),0,Y+row*(CARD_H+CARD_GAP)),
            BackgroundColor3=T.bgT,BackgroundTransparency=0.1,Text="",BorderSizePixel=0
        });corner(card,CORNER);mkStroke(card,T.bd)
        ra("bT",card,"BackgroundColor3")
        local ico=mkIcon(card,ex.ico or "package",22,{
            Position=UDim2.new(0,12,0.5,-11),ImageColor3=T.ac,ZIndex=2
        })
        local exLbl=new("TextLabel",card,{
            Size=UDim2.new(1,-50,1,0),Position=UDim2.new(0,42,0,0),BackgroundTransparency=1,
            Text=ex.n,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,
            TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd
        });ra("tx",exLbl,"TextColor3")
        if ico and ico:IsA("ImageLabel") then ra("ac",ico,"ImageColor3") end
        card.MouseEnter:Connect(function()
            TwS:Create(card,TweenInfo.new(0.1),{BackgroundTransparency=0}):Play()
            playSFX("hover",0.08)
        end)
        card.MouseLeave:Connect(function()
            TwS:Create(card,TweenInfo.new(0.1),{BackgroundTransparency=0.1}):Play()
        end)
        card.MouseButton1Click:Connect(function()
            playSFX("click")
            loadExploit(ex)
        end)
        regFeature({label=ex.n,frame=card,kind="exploit"})
    end
    Y=Y+math.ceil(#exploits/COLS)*(CARD_H+CARD_GAP)+GAP

    mkSL(s,Y,"Utility");Y=Y+SEC_H+GAP
    
    mkSL(s,Y,"Server");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Rejoin Server",function() TS:TeleportToPlaceInstance(game.PlaceId,game.JobId) end);Y=Y+TOG_H+GAP
    local hopBtn=mkBtn(s,Y,"Server Hop",function()
        local hopBtn2
        task.spawn(function()
            local ok,err=pcall(function()
                local servers={}
                local cursor=""
                local HttpGet=game.HttpGet or (syn and syn.request) or request
                local url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                if cursor~="" then url=url.."&cursor="..cursor end
                local body
                pcall(function() body=game:HttpGet(url) end)
                if not body then return end
                local data=game:GetService("HttpService"):JSONDecode(body)
                if data and data.data then
                    for _,sv in ipairs(data.data) do
                        if sv.playing and sv.maxPlayers and sv.playing<sv.maxPlayers and sv.id~=game.JobId then
                            servers[#servers+1]=sv.id
                        end
                    end
                end
                if #servers>0 then
                    TS:TeleportToPlaceInstance(game.PlaceId,servers[mra(1,#servers)])
                else
                    TS:Teleport(game.PlaceId)
                end
            end)
            if not ok then pcall(function() TS:Teleport(game.PlaceId) end) end
        end)
    end);Y=Y+TOG_H+GAP
    local sidLbl=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,14),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,Text="Server ID:",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left});ra("tM",sidLbl,"TextColor3");Y=Y+16
    local sib=new("TextBox",s,{Size=UDim2.new(1,-PAD*2,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,
        Text="",PlaceholderText="Paste Server ID here...",PlaceholderColor3=T.txD,
        ClearTextOnFocus=false,BorderSizePixel=0});corner(sib,8)
    new("UIPadding",sib,{PaddingLeft=UDim.new(0,8)});mkStroke(sib,T.bd);ra("bT",sib,"BackgroundColor3");ra("tx",sib,"TextColor3");Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Join Server",function() local j=sib.Text;if j~="" then TS:TeleportToPlaceInstance(game.PlaceId,j) end end);Y=Y+TOG_H+GAP
    local cpb=mkBtn(s,Y,"Copy My Server ID",function() local j=game.JobId;if j~="" then setclipboard(j);cpb.Text="Copied!";task.delay(2,function() cpb.Text="Copy My Server ID" end) end end);Y=Y+TOG_H+GAP
    
    -- Voice Chat Unlocker
    
    mkSL(s,Y,"Extra Features");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Admin/Staff Notify",default=false,color=T.wn,cb=function(en)
        S.adminNotifyEnabled=en
        if en then
            Players.PlayerAdded:Connect(function(p)
                if S.adminNotifyEnabled then
                    local name=p.Name:lower()
                    if name:find("admin") or name:find("mod") or name:find("staff") or name:find("owner") then
                        pcall(function()
                            game:GetService("StarterGui"):SetCore("SendNotification",{
                                Title="⚠ Admin Joined",
                                Text=p.Name.." joined the server!",
                                Duration=5
                            })
                        end)
                    end
                end
            end)
        end
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Remove Gamepass Buttons",default=false,color=T.ac,cb=function(en)
        S.removeGamepassButtons=en
        if en then
            task.spawn(function()
                for _,gui in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    if gui:IsA("TextButton") or gui:IsA("ImageButton") then
                        if gui.Name:lower():find("gamepass") or gui.Name:lower():find("pass") then
                            pcall(function() gui:Destroy() end)
                        end
                    end
                end
            end)
        end
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Performance Mode",default=false,color=T.ac,cb=function(en)
        applyPerformance(en)
        showPopup("Performance",en and "Textures/particles stripped" or "Restored",T.ac)
    end});Y=Y+TOG_H+GAP
    

    -- Blur / Streamproof / Pins
    mkSL(s,Y,"UI Extras");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Blur Background",default=false,color=T.ac,cb=function(en)
        S.blurOn=en
        local blur=Li:FindFirstChild("CH_Blur")
        if en then
            if not blur then blur=Instance.new("BlurEffect");blur.Name="CH_Blur";blur.Parent=Li end
            blur.Size=24
        elseif blur then blur:Destroy() end
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Streamproof UI",default=true,color=T.ac,cb=function(en)
        applyStreamproof(en)
        showPopup("Streamproof",en and "Re-parented to hidden GUI" or "PlayerGui",T.ac)
    end});Y=Y+TOG_H+GAP
    
    mkTog(s,Y,{label="Anti RPG Spam",default=false,color=T.ng,cb=function(en)
        applyAntiRpg(en)
        showPopup("Anti RPG",en and "Protecting" or "Off",en and T.ok or T.txM)
    end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Exploiter Alert",default=false,color=T.wn,cb=function(en)
        S.exploiterAlertOn=en
        showPopup("Exploiter Alert",en and "Scanning…" or "Off",T.ac)
    end});Y=Y+TOG_H+GAP
    -- Universal pin any feature
    mkSL(s,Y,"Pin Feature");Y=Y+SEC_H+GAP
    local pinables={
        {n="Fly Speed",kind="slider",get=function() return S.flySpd end,set=function(v) S.flySpd=v;CHQueueSave() end,min=16,max=5000},
        {n="Pattern",kind="cycle",opts={"None","Circle","Sphere","Cube","Spiral","Pyramid","Star","Cross","Heart","Penis","Swastika"},get=function() return S.patMode end,set=function(v) S.patMode=v end},
        {n="Fire Rate",kind="slider",get=function() return S.fireRate end,set=function(v) S.fireRate=v end,min=0.001,max=1},
        {n="ESP",kind="toggle",get=function() return S.espOn end,set=function(v) S.espOn=v;if espTog then espTog.u(v) end end},
        {n="Fly",kind="toggle",get=function() return S.flying end,set=function(v) if flyTog then flyTog.u(v) end end},
        {n="Spam",kind="toggle",get=function() return S.spamOn end,set=function(v) S.spamOn=v;if mainTog then mainTog.u(v) end end},
        {n="Speed Hack",kind="slider",get=function() return S.spHkV end,set=function(v) S.spHkV=v end,min=16,max=500},
        {n="Hitbox Size",kind="slider",get=function() return S.hitboxSize end,set=function(v) S.hitboxSize=v end,min=2,max=50},
    }
    local pinNames={}
    for _,p in ipairs(pinables) do pinNames[#pinNames+1]=p.n end
    local pinIdx=1
    mkDropdown(s,Y,"Feature to Pin",pinNames,pinNames[1],function(v,i) pinIdx=i or 1 end);Y=Y+56+GAP
    S.pinnedFrames=S.pinnedFrames or {}
    mkBtn(s,Y,"Pin Selected Feature",function()
        local feat=pinables[pinIdx]
        if S.pinnedFrames[feat.n] then showPopup("Pin",feat.n.." already pinned",T.wn);return end
        local count=0;for _ in pairs(S.pinnedFrames) do count=count+1 end
        local pf=new("Frame",sg,{
            Size=UDim2.new(0,190,0,feat.kind=="slider" and 72 or 56),
            Position=UDim2.new(0,16,0,80+count*80),
            BackgroundColor3=T.bgS,BackgroundTransparency=0.08,BorderSizePixel=0,ZIndex=80
        });corner(pf,8);mkStroke(pf,T.ac,1)
        new("TextLabel",pf,{Size=UDim2.new(1,-28,0,18),Position=UDim2.new(0,8,0,4),BackgroundTransparency=1,
            Text=feat.n,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
        local xBtn=new("TextButton",pf,{Size=UDim2.new(0,20,0,20),Position=UDim2.new(1,-24,0,4),
            BackgroundTransparency=1,Text="×",TextColor3=T.txM,Font=Enum.Font.GothamBold,TextSize=14})
        xBtn.MouseButton1Click:Connect(function() pf:Destroy();S.pinnedFrames[feat.n]=nil end)
        if feat.kind=="toggle" then
            local b=new("TextButton",pf,{Size=UDim2.new(1,-16,0,26),Position=UDim2.new(0,8,0,26),
                BackgroundColor3=feat.get() and T.ok or T.off,Text=feat.get() and "ON" or "OFF",
                TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.GothamBold,TextSize=12,BorderSizePixel=0})
            corner(b,6)
            b.MouseButton1Click:Connect(function()
                local nv=not feat.get();feat.set(nv)
                b.Text=nv and "ON" or "OFF";b.BackgroundColor3=nv and T.ok or T.off
                playSFX(nv and "toggle_on" or "toggle_off")
            end)
        elseif feat.kind=="cycle" then
            local opts=feat.opts;local ci2=1
            for i,o in ipairs(opts) do if o==feat.get() then ci2=i break end end
            local b=new("TextButton",pf,{Size=UDim2.new(1,-16,0,26),Position=UDim2.new(0,8,0,26),
                BackgroundColor3=T.bgT,Text=feat.get(),TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,BorderSizePixel=0})
            corner(b,6)
            mkIcon(b,"chevron-down",12,{Position=UDim2.new(1,-18,0.5,-6),ImageColor3=T.txM,ZIndex=2})
            b.MouseButton1Click:Connect(function()
                ci2=ci2%#opts+1;feat.set(opts[ci2]);b.Text=opts[ci2];playSFX("click",0.2)
            end)
        else
            local vl=new("TextLabel",pf,{Size=UDim2.new(1,-16,0,14),Position=UDim2.new(0,8,0,24),BackgroundTransparency=1,
                Text=tostring(feat.get()),TextColor3=T.ac,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
            local track=new("Frame",pf,{Size=UDim2.new(1,-16,0,6),Position=UDim2.new(0,8,0,48),BackgroundColor3=T.off,BorderSizePixel=0});corner(track,3)
            local fill=new("Frame",track,{Size=UDim2.new(mcl((feat.get()-feat.min)/(feat.max-feat.min),0,1),0,1,0),BackgroundColor3=T.ac,BorderSizePixel=0});corner(fill,3)
            local knob=new("TextButton",track,{Size=UDim2.new(0,12,0,12),Position=UDim2.new(fill.Size.X.Scale,0,0.5,-6),
                BackgroundColor3=Color3.fromRGB(255,255,255),Text="",BorderSizePixel=0,ZIndex=2});corner(knob,6)
            local dragging=false
            local function setFromX(x)
                local rel=mcl(x/track.AbsoluteSize.X,0,1)
                local val=feat.min+(feat.max-feat.min)*rel
                feat.set(val);vl.Text=tostring(mfl(val*100)/100)
                fill.Size=UDim2.new(rel,0,1,0);knob.Position=UDim2.new(rel,0,0.5,-6)
            end
            knob.MouseButton1Down:Connect(function() dragging=true end)
            UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
            UIS.InputChanged:Connect(function(i)
                if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
                    setFromX(i.Position.X-track.AbsolutePosition.X)
                end
            end)
        end
        -- drag whole panel
        local dragging,dstart,pstart=false,nil,nil
        pf.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true;dstart=i.Position;pstart=pf.Position end end)
        UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
        UIS.InputChanged:Connect(function(i)
            if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
                local d=i.Position-dstart
                pf.Position=UDim2.new(pstart.X.Scale,pstart.X.Offset+d.X,pstart.Y.Scale,pstart.Y.Offset+d.Y)
            end
        end)
        S.pinnedFrames[feat.n]=pf
        showPopup("Pinned",feat.n,T.ok)
    end);Y=Y+TOG_H+GAP

    -- Hide other game UI (snapshot only what was visible; never force-enable on script start)
    mkSL(s,Y,"UI Control");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Hide Game UI (keep ChudHub)",default=false,color=T.ac,cb=function(en)
        S.hideGameUI=en
        local StarterGui=game:GetService("StarterGui")
        local coreTypes={
            Enum.CoreGuiType.Chat,
            Enum.CoreGuiType.PlayerList,
            Enum.CoreGuiType.Backpack,
            Enum.CoreGuiType.Health,
            Enum.CoreGuiType.EmotesMenu,
            Enum.CoreGuiType.Captures,
        }
        pcall(function()
            local pg=plr:FindFirstChild("PlayerGui")
            if en then
                -- SNAPSHOT current visibility, then hide only what was on
                S.hideUISnapshot={}
                S.hideCoreSnapshot={}
                if pg then
                    for _,g in ipairs(pg:GetChildren()) do
                        if g:IsA("ScreenGui") and g~=sg and g.Name~="ChudHubUI" then
                            S.hideUISnapshot[g]=g.Enabled
                            if g.Enabled then g.Enabled=false end
                        end
                    end
                end
                for _,ct in ipairs(coreTypes) do
                    local was=true
                    pcall(function() was=StarterGui:GetCoreGuiEnabled(ct) end)
                    S.hideCoreSnapshot[ct]=was
                    if was then pcall(function() StarterGui:SetCoreGuiEnabled(ct,false) end) end
                end
            else
                -- RESTORE only what the snapshot says was on
                if S.hideUISnapshot then
                    for g,was in pairs(S.hideUISnapshot) do
                        if g and g.Parent then pcall(function() g.Enabled=was end) end
                    end
                    S.hideUISnapshot=nil
                end
                if S.hideCoreSnapshot then
                    for ct,was in pairs(S.hideCoreSnapshot) do
                        pcall(function() StarterGui:SetCoreGuiEnabled(ct,was) end)
                    end
                    S.hideCoreSnapshot=nil
                end
            end
        end)
        showPopup("Game UI",en and "Hidden (snapshot saved)" or "Restored from snapshot",T.ac)
    end});Y=Y+TOG_H+GAP

    
    -- Emotes (Infinite Yield animation IDs)
    mkSL(s,Y,"Emotes");Y=Y+SEC_H+GAP
    local function isR15Char(c)
        return c and c:FindFirstChild("UpperTorso")~=nil
    end
    local function stopAllEmotes()
        S._jorkin=false
        if S._jerkTrack then pcall(function() S._jerkTrack:Stop() end);S._jerkTrack=nil end
        if S._jerkLoop then pcall(function() task.cancel(S._jerkLoop) end);S._jerkLoop=nil end
        if S._bangTrack then pcall(function() S._bangTrack:Stop() end);S._bangTrack=nil end
        if S._bangConn then pcall(function() S._bangConn:Disconnect() end);S._bangConn=nil end
        if S._bangDied then pcall(function() S._bangDied:Disconnect() end);S._bangDied=nil end
    end
    -- IY Jerk Off: tool + animation loop
    mkBtn(s,Y,"Jerk Off",function()
        stopAllEmotes()
        local c=plr.Character;if not c then showPopup("Emote","No character",T.wn);return end
        local humanoid=c:FindFirstChildWhichIsA("Humanoid")
        local backpack=plr:FindFirstChildWhichIsA("Backpack")
        if not humanoid or not backpack then return end
        -- remove old tool
        for _,t in ipairs(backpack:GetChildren()) do if t.Name=="Jerk Off" then t:Destroy() end end
        if c:FindFirstChild("Jerk Off") then c["Jerk Off"]:Destroy() end
        local tool=Instance.new("Tool")
        tool.Name="Jerk Off"
        tool.ToolTip="IY-style emote"
        tool.RequiresHandle=false
        tool.Parent=backpack
        local jorkin=false
        local track=nil
        local function stopTomfoolery()
            jorkin=false;S._jorkin=false
            if track then pcall(function() track:Stop() end);track=nil;S._jerkTrack=nil end
        end
        tool.Equipped:Connect(function() jorkin=true;S._jorkin=true end)
        tool.Unequipped:Connect(stopTomfoolery)
        humanoid.Died:Connect(stopTomfoolery)
        S._jerkLoop=task.spawn(function()
            while tool and tool.Parent do
                task.wait()
                if not jorkin then continue end
                local r15=isR15Char(plr.Character)
                if not track then
                    local anim=Instance.new("Animation")
                    anim.AnimationId=not r15 and "rbxassetid://72042024" or "rbxassetid://698251653"
                    local ok,tr=pcall(function() return humanoid:LoadAnimation(anim) end)
                    if ok and tr then track=tr;S._jerkTrack=tr else continue end
                end
                pcall(function()
                    track:Play()
                    track:AdjustSpeed(r15 and 0.7 or 0.65)
                    track.TimePosition=0.6
                end)
                task.wait(0.1)
                while track and track.IsPlaying and track.TimePosition<(not r15 and 0.65 or 0.7) do
                    task.wait(0.05)
                end
                if track then pcall(function() track:Stop() end);track=nil;S._jerkTrack=nil end
            end
        end)
        showPopup("Jerk Off","Equip the tool in your hotbar",T.ac)
    end);Y=Y+TOG_H+GAP

    mkBtn(s,Y,"Bang",function()
        stopAllEmotes()
        local c=plr.Character;if not c then return end
        local humanoid=c:FindFirstChildWhichIsA("Humanoid");if not humanoid then return end
        local bangAnim=Instance.new("Animation")
        bangAnim.AnimationId=not isR15Char(c) and "rbxassetid://148840371" or "rbxassetid://5918726674"
        local ok,bang=pcall(function() return humanoid:LoadAnimation(bangAnim) end)
        if not ok or not bang then showPopup("Bang","Anim failed",T.ng);return end
        bang:Play(0.1,1,1)
        bang:AdjustSpeed(3)
        S._bangTrack=bang
        S._bangDied=humanoid.Died:Connect(function()
            pcall(function() bang:Stop() end)
            if S._bangConn then S._bangConn:Disconnect();S._bangConn=nil end
        end)
        -- optional: stick to nearest focused / nearest player
        local target=S.orbitSpecTarget or S.spectateTarget
        if not target then
            local best,bd=nil,40
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=plr and isFocusTarget(p) and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and hrp then
                    local d=(p.Character.HumanoidRootPart.Position-hrp.Position).Magnitude
                    if d<bd then best=p;bd=d end
                end
            end
            target=best
        end
        if target then
            local bangOffset=CFrame.new(0,0,1.1)
            S._bangConn=RS.Stepped:Connect(function()
                pcall(function()
                    local other=target.Character and (target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso") or target.Character:FindFirstChild("UpperTorso"))
                    local myRoot=plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if other and myRoot then
                        myRoot.CFrame=other.CFrame*bangOffset
                    end
                end)
            end)
            showPopup("Bang","On "..target.Name,T.ac)
        else
            showPopup("Bang","Playing (no target nearby)",T.ac)
        end
    end);Y=Y+TOG_H+GAP

    mkBtn(s,Y,"Stop Emote",function()
        stopAllEmotes()
        if S._penisModel then pcall(function() S._penisModel:Destroy() end);S._penisModel=nil end
        -- also unequip jerk tool
        pcall(function()
            local t=plr.Character and plr.Character:FindFirstChild("Jerk Off")
            if t then t.Parent=plr.Backpack end
        end)
        showPopup("Emote","Stopped",T.txM)
    end);Y=Y+TOG_H+GAP

    -- Client-side meme prop (detailed, local only)
    mkBtn(s,Y,"Penis",function()
        if S._penisModel and S._penisModel.Parent then
            S._penisModel:Destroy();S._penisModel=nil
            showPopup("Meme","Removed",T.txM);return
        end
        local c=plr.Character;if not c then return end
        local torso=c:FindFirstChild("LowerTorso") or c:FindFirstChild("Torso") or c:FindFirstChild("HumanoidRootPart")
        if not torso then return end
        local model=Instance.new("Model");model.Name="CH_Meme";model.Parent=c
        local skin=Color3.fromRGB(255,200,175)
        local tipCol=Color3.fromRGB(255,150,145)
        local function addPart(name,size,shape)
            local p=Instance.new("Part")
            p.Name=name;p.Size=size;p.Color=skin;p.Material=Enum.Material.SmoothPlastic
            p.CanCollide=false;p.Massless=true;p.CastShadow=false;p.Anchored=false
            if shape=="ball" then p.Shape=Enum.PartType.Ball end
            p.Parent=model
            return p
        end
                local shaft=addPart("Shaft",Vector3.new(1.15,0.26,0.26))
        local sm=Instance.new("SpecialMesh")
        sm.MeshType=Enum.MeshType.Cylinder
        sm.Parent=shaft
        local weld=Instance.new("Weld")
        weld.Part0=torso
        weld.Part1=shaft
                        weld.C0=CFrame.new(0,-0.5,-0.95)*CFrame.Angles(0,math.rad(90),0)*CFrame.Angles(math.rad(-15),0,0)
        weld.Parent=shaft
        local tip=addPart("Tip",Vector3.new(0.36,0.36,0.36),"ball")
        tip.Color=tipCol
        local wt=Instance.new("Weld");wt.Part0=shaft;wt.Part1=tip
        wt.C0=CFrame.new(0.62,0,0);wt.Parent=tip
        local ridge=addPart("Ridge",Vector3.new(0.1,0.32,0.32))
        local rm=Instance.new("SpecialMesh");rm.MeshType=Enum.MeshType.Cylinder;rm.Parent=ridge
        local wr=Instance.new("Weld");wr.Part0=shaft;wr.Part1=ridge
        wr.C0=CFrame.new(0.45,0,0);wr.Parent=ridge
        local b1=addPart("BallL",Vector3.new(0.34,0.34,0.34),"ball")
        b1.Color=Color3.fromRGB(245,190,165)
        local wb1=Instance.new("Weld");wb1.Part0=shaft;wb1.Part1=b1
        wb1.C0=CFrame.new(-0.52,0.16,0.06);wb1.Parent=b1
        local b2=addPart("BallR",Vector3.new(0.34,0.34,0.34),"ball")
        b2.Color=Color3.fromRGB(245,190,165)
        local wb2=Instance.new("Weld");wb2.Part0=shaft;wb2.Part1=b2
        wb2.C0=CFrame.new(-0.52,-0.16,0.06);wb2.Parent=b2
        S._penisModel=model
        showPopup("Meme","Client-only prop (only you see it)",T.wn)
    end);Y=Y+TOG_H+GAP

    -- More Infinite Yield inspired tools
    mkSL(s,Y,"IY-Style Tools");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Refresh Character",function()
        pcall(function()
            local c=plr.Character
            if not c then showPopup("Refresh","No character",T.wn);return end
            local hum2=c:FindFirstChildOfClass("Humanoid")
            local root=c:FindFirstChild("HumanoidRootPart")
            if not hum2 or not root then showPopup("Refresh","Missing parts",T.wn);return end
            local tools={}
            for _,t in ipairs(plr.Backpack:GetChildren()) do
                if t:IsA("Tool") then
                    local cl=t:Clone();table.insert(tools,cl)
                end
            end
            for _,t in ipairs(c:GetChildren()) do
                if t:IsA("Tool") then
                    local cl=t:Clone();table.insert(tools,cl)
                end
            end
            S._refreshRestore={tools=tools,cf=root.CFrame}
            hum2.Health=0
        end)
        showPopup("Refresh","Soft refresh (keep tools + pos)",T.ok)
    end);Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Lag Switch (outgoing throttle)",default=false,color=T.ng,cb=function(en)
        applyLagSwitch(en)
        showPopup("Lag Switch",en and "ON — packets throttled" or "OFF",en and T.ng or T.ok)
    end});Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Rejoin Server",function()
        pcall(function() TS:TeleportToPlaceInstance(game.PlaceId,game.JobId,plr) end)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Server Hop",function()
        task.spawn(function()
            local ok,res=pcall(function()
                return game:GetService("HttpService"):JSONDecode(game:HttpGet(
                    "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=25"
                ))
            end)
            if ok and res and res.data then
                for _,srv in ipairs(res.data) do
                    if srv.id~=game.JobId and srv.playing<srv.maxPlayers then
                        pcall(function() TS:TeleportToPlaceInstance(game.PlaceId,srv.id,plr) end)
                        return
                    end
                end
            end
            showPopup("Server Hop","No server found",T.wn)
        end)
    end);Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Invisible (local)",default=false,color=T.ac,cb=function(en)
        local c=plr.Character;if not c then return end
        for _,p in pairs(c:GetDescendants()) do
            if p:IsA("BasePart") or p:IsA("Decal") then
                p.LocalTransparencyModifier=en and 1 or 0
            end
        end
    end});Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Sit / Unsit",function()
        local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if h then h.Sit=not h.Sit end
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Reset Camera",function()
        if hum then cam.CameraSubject=hum end
        cam.CameraType=Enum.CameraType.Custom
        showPopup("Camera","Reset",T.ok)
    end);Y=Y+TOG_H+GAP

    s.CanvasSize=UDim2.new(0,0,0,Y+10)
end

local function buildThemeCard(s,td,i,CW,CH,CG,Y)
    local col=(i-1)%2;local row=mfl((i-1)/2)
    local px=PAD/2+col*(CW+CG)
    local card=new("Frame",s,{
        Size=UDim2.new(0,CW,0,CH),
        Position=UDim2.new(0,px,0,Y+row*(CH+CG)),
        BackgroundColor3=td.bT,BackgroundTransparency=0,BorderSizePixel=0
    });corner(card,10)
    local sk=new("UIStroke",card,{Color=td.bd,Thickness=1,Transparency=0})
    local bar=new("Frame",card,{Size=UDim2.new(1,0,0,6),BackgroundColor3=td.ac,BorderSizePixel=0,ZIndex=2})
    corner(bar,10);new("Frame",bar,{Size=UDim2.new(1,0,.5,0),Position=UDim2.new(0,0,.5,0),BackgroundColor3=td.ac,BorderSizePixel=0})
    local nm=new("TextLabel",card,{Size=UDim2.new(1,-16,0,16),Position=UDim2.new(0,8,0,10),BackgroundTransparency=1,TextColor3=td.tx,Font=Enum.Font.GothamBold,TextSize=11,Text=td.n,TextXAlignment=Enum.TextXAlignment.Left})
    new("TextLabel",card,{Size=UDim2.new(1,-12,0,12),Position=UDim2.new(0,8,0,28),BackgroundTransparency=1,TextColor3=td.tM,Font=Enum.Font.Gotham,TextSize=9,Text=td.d,TextXAlignment=Enum.TextXAlignment.Left})
    for si2,sc in ipairs({td.bd,td.bT,td.ac}) do
        local dot=new("Frame",card,{Size=UDim2.new(0,10,0,10),Position=UDim2.new(0,6+(si2-1)*14,0,CH-18),BackgroundColor3=sc,BorderSizePixel=0})
        corner(dot,5);new("UIStroke",dot,{Color=Color3.fromRGB(255,255,255),Thickness=0.5,Transparency=0.5})
    end
    local btn=new("TextButton",card,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="",ZIndex=5})
    btn.MouseButton1Click:Connect(function() themeIdx=i;apTh(TL[i],true);updCards() end)
    btn.MouseEnter:Connect(function() if i~=themeIdx then TwS:Create(sk,TweenInfo.new(0.1),{Color=td.ac,Transparency=0.1}):Play() end end)
    btn.MouseLeave:Connect(function() if i~=themeIdx then TwS:Create(sk,TweenInfo.new(0.1),{Color=Color3.fromRGB(35,35,50),Transparency=0.3}):Play() end end)
    reg.cards[i]={s=sk,n=nm,ic=nil}
end

local function buildLayout()
    _curBuildTab="Styling"
    S._layoutModePainters={}
    local s=tabC["Styling"].scroll;s:ClearAllChildren();local Y=8

    -- ArrayList (moved from Misc)
-- ArrayList style
    mkSL(s,Y,"ArrayList Style");Y=Y+SEC_H+GAP
    local styles={"Default","Gradient","Minimal","Shadow","Rainbow"}
    mkDropdown(s,Y,"Style",styles,S.arrayListStyle or "Default",function(v)
        S.arrayListStyle=v
        if refreshArrayList then refreshArrayList() end
    end);Y=Y+56+GAP

    mkSL(s,Y,"Nav Layout");Y=Y+SEC_H+GAP
    local function mkModeBtn(iconName,lbl,desc,mode)
        local active=(S.navMode==mode)
        local f=new("Frame",s,{Size=UDim2.new(1,-PAD*2,0,62),Position=UDim2.new(0,PAD,0,Y),
            BackgroundColor3=active and T.ac or T.bgT,
            BackgroundTransparency=active and 0.18 or 0.05,BorderSizePixel=0})
        corner(f,CORNER)
        local mst=mkStroke(f,active and T.ac or T.bd)
        local ico=mkIcon(f,iconName,20,{Position=UDim2.new(0,14,0.5,-10),ImageColor3=active and Color3.fromRGB(255,255,255) or T.txM,ZIndex=2})
        local t1=new("TextLabel",f,{Size=UDim2.new(1,-52,0,20),Position=UDim2.new(0,42,0,10),
            BackgroundTransparency=1,Text=lbl,
            TextColor3=active and Color3.fromRGB(255,255,255) or T.tx,
            Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
        local t2=new("TextLabel",f,{Size=UDim2.new(1,-52,0,14),Position=UDim2.new(0,42,0,32),
            BackgroundTransparency=1,Text=desc,
            TextColor3=active and Color3.fromRGB(220,220,255) or T.txM,
            Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
        local function paint()
            local on=(S.navMode==mode)
            f.BackgroundColor3=on and T.ac or T.bgT
            f.BackgroundTransparency=on and 0.18 or 0.05
            if mst then mst.Color=on and T.ac or T.bd end
            if ico and ico:IsA("ImageLabel") then ico.ImageColor3=on and Color3.fromRGB(255,255,255) or T.txM end
            t1.TextColor3=on and Color3.fromRGB(255,255,255) or T.tx
            t2.TextColor3=on and Color3.fromRGB(230,230,255) or T.txM
        end
        table.insert(reg.tog,{f=f,c=nil,on=function() return (S.navMode==mode) and T.ac or T.bgT end,cn=function() return T.txD end})
        -- theme hook
        S._layoutModePainters=S._layoutModePainters or {}
        table.insert(S._layoutModePainters,paint)
        local btn=new("TextButton",f,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""})
        btn.MouseButton1Click:Connect(function()
            setNavMode(mode);buildLayout()
        end)
        Y=Y+68
    end
    mkModeBtn("panel-top","Top Bar","Pill navigation at the top of the window","top")
    mkModeBtn("panel-left","Side Bar","Icon navigation on the left side","side")
    mkSL(s,Y,"Window Material");Y=Y+SEC_H+GAP
    local liquidConn=nil
    local liquidGrad=nil
    local function stopLiquidFx()
        if liquidConn then liquidConn:Disconnect();liquidConn=nil end
    end
    local function ensureLiquidGrad(parent)
        if not parent then return nil end
        local g=parent:FindFirstChild("CH_LiquidGrad")
        if not g then
            g=Instance.new("UIGradient")
            g.Name="CH_LiquidGrad"
            g.Rotation=25
            g.Parent=parent
        end
        return g
    end
    local function applyUiStyle(style,skipNotif)
        S.uiStyle=style or S.uiStyle or "Solid"
        stopLiquidFx()
        pcall(function()
            local blur=Li:FindFirstChild("CH_UIBlur")
            if blur then blur:Destroy() end
            local base=(S.winTrans or winTrans or 18)/100
            local extra=0
            local col=T.bg
            if S.uiStyle=="Acrylic" then extra=0.12; col=T.bg
            elseif S.uiStyle=="Glass" then extra=0.22; col=S.lightMode and Color3.fromRGB(240,242,248) or Color3.fromRGB(18,20,28)
            elseif S.uiStyle=="Mica" then extra=0.08; col=T.bgS
            elseif S.uiStyle=="Liquid" then extra=0.14; col=T.bg
            else extra=0; col=T.bg end
            local tr=math.clamp(base+extra,0,0.92)
            if win then
                win.BackgroundColor3=col
                win.BackgroundTransparency=tr
            end
            -- chrome surfaces
            local chromeTr = (S.uiStyle=="Glass" and 0.25) or (S.uiStyle=="Liquid" and 0.2) or (S.uiStyle=="Acrylic" and 0.12) or 0.06
            if hdr then
                hdr.BackgroundColor3=T.bgS
                hdr.BackgroundTransparency=chromeTr
            end
            if sideNav then
                sideNav.BackgroundColor3=T.bgS
                sideNav.BackgroundTransparency=(S.uiStyle=="Liquid" or S.uiStyle=="Glass") and chromeTr or 0
            end
            if shadow then
                shadow.BackgroundTransparency=math.clamp(tr+0.15,0,0.95)
            end
            if winStroke then
                if S.uiStyle=="Glass" then
                    winStroke.Transparency=0.25;winStroke.Thickness=1.2;winStroke.Color=Color3.fromRGB(180,200,255)
                elseif S.uiStyle=="Liquid" then
                    winStroke.Transparency=0.2;winStroke.Thickness=1.4;winStroke.Color=T.ac
                elseif S.uiStyle=="Acrylic" then
                    winStroke.Transparency=0.4;winStroke.Thickness=1;winStroke.Color=T.ac
                elseif S.uiStyle=="Mica" then
                    winStroke.Transparency=0.45;winStroke.Thickness=0.8;winStroke.Color=T.bd
                else
                    winStroke.Transparency=0.5;winStroke.Thickness=0.5;winStroke.Color=T.bd
                end
            end
            -- Liquid: reactive gradient on win + sidebar + titlebar following mouse
            if S.uiStyle=="Liquid" then
                -- soft spotlight that follows the mouse (no click FX)
                for _,p in ipairs({win,sideNav,hdr}) do
                    if p then
                        for _,ch in ipairs(p:GetChildren()) do
                            if ch.Name=="CH_LiquidBlob" or ch.Name=="CH_Ripple" or ch.Name=="CH_LiquidGrad" then ch:Destroy() end
                        end
                    end
                end
                local spots={}
                local function mkSpot(parent, size, baseAlpha)
                    if not parent then return end
                    local f=Instance.new("Frame")
                    f.Name="CH_LiquidBlob"
                    f.BackgroundColor3=T.ac
                    f.BackgroundTransparency=baseAlpha or 0.72
                    f.BorderSizePixel=0
                    f.Size=UDim2.fromOffset(size,size)
                    f.AnchorPoint=Vector2.new(0.5,0.5)
                    f.Position=UDim2.fromScale(0.5,0.5)
                    f.ZIndex=0
                    f.Parent=parent
                    Instance.new("UICorner",f).CornerRadius=UDim.new(1,0)
                    local g=Instance.new("UIGradient")
                    g.Transparency=NumberSequence.new({
                        NumberSequenceKeypoint.new(0,0.05),
                        NumberSequenceKeypoint.new(0.35,0.45),
                        NumberSequenceKeypoint.new(1,1)
                    })
                    g.Parent=f
                    local st=Instance.new("UIStroke")
                    st.Name="GlowStroke"
                    st.Color=T.ac
                    st.Thickness=2.5
                    st.Transparency=0.55
                    st.Parent=f
                    local ug=ensureLiquidGrad(parent)
                    spots[#spots+1]={gui=f,grad=ug,stroke=st,x=0.5,y=0.5,parent=parent,size=size,base=baseAlpha or 0.72,phase=math.random()*6.28}
                end
                mkSpot(win, 160, 0.55)
                mkSpot(win, 280, 0.78)
                mkSpot(sideNav, 140, 0.6)
                mkSpot(hdr, 200, 0.7)
                local pulse=0
                liquidConn=RS.RenderStepped:Connect(function(dt)
                    if S.uiStyle~="Liquid" then return end
                    pulse=(pulse+dt*2.2)%6.28318
                    local mp=UIS:GetMouseLocation()
                    local inset=Vector2.zero
                    pcall(function() inset=game:GetService("GuiService"):GetGuiInset() end)
                    local mx,my=mp.X-inset.X, mp.Y-inset.Y
                    local a=math.clamp(12*dt,0,1)
                    for _,s in ipairs(spots) do
                        local gui,par=s.gui,s.parent
                        if gui and par and par.Parent and par.AbsoluteSize.X>0 then
                            local tx=math.clamp((mx-par.AbsolutePosition.X)/par.AbsoluteSize.X,0,1)
                            local ty=math.clamp((my-par.AbsolutePosition.Y)/par.AbsoluteSize.Y,0,1)
                            s.x=s.x+(tx-s.x)*a
                            s.y=s.y+(ty-s.y)*a
                            local breathe=1+0.06*math.sin(pulse+s.phase)
                            gui.Position=UDim2.fromScale(s.x,s.y)
                            gui.Size=UDim2.fromOffset(s.size*breathe, s.size*breathe)
                            gui.BackgroundColor3=T.ac
                            gui.BackgroundTransparency=math.clamp(s.base - 0.08*math.sin(pulse*1.3+s.phase), 0.35, 0.92)
                            if s.stroke then
                                s.stroke.Color=T.ac
                                s.stroke.Transparency=0.4+0.25*math.sin(pulse+s.phase)
                                s.stroke.Thickness=2+1.5*math.abs(math.sin(pulse*0.8+s.phase))
                            end
                            if s.grad and s.grad.Parent then
                                s.grad.Offset=Vector2.new((s.x-0.5)*0.55,(s.y-0.5)*0.55)
                                s.grad.Rotation=20+(s.x-0.5)*40
                                local hot=Color3.new(
                                    math.min(1,T.ac.R*0.55+T.bg.R*0.45),
                                    math.min(1,T.ac.G*0.55+T.bg.G*0.45),
                                    math.min(1,T.ac.B*0.55+T.bg.B*0.45))
                                s.grad.Color=ColorSequence.new({
                                    ColorSequenceKeypoint.new(0,T.bg),
                                    ColorSequenceKeypoint.new(0.45,T.bgT),
                                    ColorSequenceKeypoint.new(1,hot)
                                })
                            end
                        end
                    end
                end)
            else
                for _,p in ipairs({win,sideNav,hdr}) do
                    if p then
                        for _,ch in ipairs(p:GetChildren()) do
                            if ch.Name=="CH_LiquidBlob" or ch.Name=="CH_Ripple" or ch.Name=="CH_LiquidGrad" then ch:Destroy() end
                        end
                    end
                end
            end
        end)
        if not skipNotif then showPopup("UI Style",S.uiStyle,T.ac) end
    end
    -- keep material + transparency in sync
    S._applyUiStyle=applyUiStyle
    for _,stName in ipairs({"Solid","Acrylic","Glass","Mica","Liquid"}) do
        mkBtn(s,Y,stName.." Material",function() applyUiStyle(stName) end);Y=Y+TOG_H+GAP
    end

    mkSL(s,Y,"Custom Theme");Y=Y+SEC_H+GAP
    new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,28),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Edits always go to the Custom theme. Load a preset below, then tweak colours.",
        TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true})
    Y=Y+30
    -- ensure Custom selected when opening editor controls
    local function ensureCustom()
        local ci=customThemeIdx()
        if themeIdx~=ci then
            themeIdx=ci
            apTh(TL[ci], true)
            updCards()
        end
        return TL[ci]
    end
    local themeKeys={
        {k="ac",lbl="Accent"},
        {k="bg",lbl="Background"},
        {k="bgS",lbl="Sidebar"},
        {k="bgT",lbl="Surface"},
        {k="bd",lbl="Border"},
        {k="off",lbl="Off / Track"},
        {k="tx",lbl="Text"},
        {k="txM",lbl="Text Muted"},
        {k="txD",lbl="Text Dim"},
    }
    local themeSwatches={}
    for _,tk in ipairs(themeKeys) do
        local row=new("Frame",s,{Size=UDim2.new(1,-PAD*2,0,32),Position=UDim2.new(0,PAD,0,Y),BackgroundColor3=T.bgT,BackgroundTransparency=0.08,BorderSizePixel=0})
        corner(row,CORNER);mkStroke(row,T.bd,1);ra("bT",row,"BackgroundColor3")
        local lbl=new("TextLabel",row,{Size=UDim2.new(0.55,0,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text=tk.lbl,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
        ra("tx",lbl,"TextColor3")
        local sw=new("Frame",row,{Size=UDim2.new(0,24,0,18),Position=UDim2.new(1,-72,0.5,-9),BackgroundColor3=T[tk.k] or T.ac,BorderSizePixel=0});corner(sw,4)
        themeSwatches[tk.k]=sw
        local btn=new("TextButton",row,{Size=UDim2.new(0,36,0,22),Position=UDim2.new(1,-42,0.5,-11),BackgroundColor3=T.off,Text="",BorderSizePixel=0});corner(btn,6);ra("tr",btn,"BackgroundColor3")
        mkIcon(btn,"pencil",12,{Position=UDim2.new(0.5,-6,0.5,-6),ImageColor3=T.tx,ZIndex=2})
        btn.MouseButton1Click:Connect(function()
            local key=tk.k
            local custom=ensureCustom()
            local current=T[key] or T.ac
            if type(openColorPicker)~="function" then return end
            openColorPicker(current,function(c)
                if typeof(c)~="Color3" then return end
                T[key]=c
                if themeSwatches[key] then themeSwatches[key].BackgroundColor3=c end
                local map={ac="ac",bg="bg",bgS="bS",bgT="bT",bd="bd",off="of",tx="tx",txM="tM",txD="tD"}
                local field=map[key]
                if field and custom then custom[field]=c end
                custom.d="Custom"
                apTh({ac=T.ac,bg=T.bg,bS=T.bgS,bT=T.bgT,bd=T.bd,of=T.off,tx=T.tx,tM=T.txM,tD=T.txD}, true)
                -- no popup spam
            end)
        end)
        Y=Y+36
    end
    Y=Y+4
    mkSL(s,Y,"Load Preset → Custom");Y=Y+SEC_H+GAP
    local presetNames={}
    for i,t in ipairs(TL) do
        if t.n~="Custom" then presetNames[#presetNames+1]=t.n end
    end
    mkDropdown(s,Y,"Preset",presetNames,presetNames[1] or "Proxy",function(v)
        for i,t in ipairs(TL) do
            if t.n==v then
                applyPresetToCustom(i, true)
                -- refresh swatches
                local c=TL[customThemeIdx()]
                for _,tk in ipairs(themeKeys) do
                    local map={ac="ac",bg="bg",bgS="bS",bgT="bT",bd="bd",off="of",tx="tx",txM="tM",txD="tD"}
                    local field=map[tk.k]
                    if themeSwatches[tk.k] and field and c[field] then
                        themeSwatches[tk.k].BackgroundColor3=c[field]
                    end
                end
                showPopup("Custom","Preset · "..v,T.ok)
                break
            end
        end
    end);Y=Y+56+GAP
    mkBtn(s,Y,"Switch to Custom Theme",function()
        ensureCustom()
        showPopup("Theme","Custom active",T.ok)
    end);Y=Y+TOG_H+GAP

    mkSL(s,Y,"Config");Y=Y+SEC_H+GAP    mkSL(s,Y,"Config");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Save Config",function()
        CHSaveSettings()
        showPopup("Config","Saved all settings",T.ok)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Load Config",function()
        local data=CHLoadSettings()
        applyLoadedCfg(data)
        if TL[themeIdx] then apTh(TL[themeIdx]);updCards() end
        showPopup("Config","Loaded settings",T.ok)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Reset Config",function()
        pcall(function() if writefile then writefile(CH_SETTINGS_FILE,"{}") end end)
        showPopup("Config","Reset — rejoin to apply defaults",T.wn)
    end);Y=Y+TOG_H+GAP
    mkSL(s,Y,"Window");Y=Y+SEC_H+GAP
    mkSl(s,Y,{label="Transparency",min=0,max=85,default=S.winTrans or 18,suffix="%",cb=function(v)
        winTrans=v;S.winTrans=v
        if type(S._applyUiStyle)=="function" then S._applyUiStyle(S.uiStyle or "Solid",true)
        else win.BackgroundTransparency=v/100 end
    end});Y=Y+SL_H+GAP
    mkSL(s,Y,"Select Theme");Y=Y+SEC_H+GAP
    local hint=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,14),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=9,Text="#"..#TL.." themes — click to apply",TextXAlignment=Enum.TextXAlignment.Left});ra("tD",hint,"TextColor3");Y=Y+18
    local CW=mfl((WW-PAD-8)/2-4);local CH=82;local CG=6
    for i,td in ipairs(TL) do buildThemeCard(s,td,i,CW,CH,CG,Y) end
    s.CanvasSize=UDim2.new(0,0,0,Y+math.ceil(#TL/2)*(CH+CG)+12)
end

local function buildOnline()
    _curBuildTab="Online"
    local s=tabC["Online"].scroll;local Y=8
    mkSL(s,Y,"Community");Y=Y+SEC_H+GAP
    mkBtn(s,Y,"Join Discord",function()
        local url="https://discord.gg/z8Au2fBMxb"
        pcall(function() if setclipboard then setclipboard(url) end end)
        showPopup("Discord","Link copied — https://discord.gg/z8Au2fBMxb",T.ac)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Open Website",function()
        local url="https://Proxy-Phalanxs.github.io"
        pcall(function() if setclipboard then setclipboard(url) end end)
        showPopup("Website","Link copied to clipboard",T.ac)
    end);Y=Y+TOG_H+GAP

    -- ===== Kill Log (global across accounts) =====
    mkSL(s,Y,"Kill Log");Y=Y+SEC_H+GAP
    local klStats=new("TextLabel",s,{
        Size=UDim2.new(1,-PAD*2,0,18),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text=string.format("Total Kills: %d   ·   Deaths: %d",S.totalKills or 0,S.totalDeaths or 0),
        TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left
    });Y=Y+22
    local klSearch=new("TextBox",s,{
        Size=UDim2.new(1,-PAD*2,0,28),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,Text="",PlaceholderText="Search kills by username…",PlaceholderColor3=T.txD,
        TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,BorderSizePixel=0,ClearTextOnFocus=false
    });corner(klSearch,CORNER);mkStroke(klSearch,T.bd)
    new("UIPadding",klSearch,{PaddingLeft=UDim.new(0,10)});Y=Y+34
    local klFrame=new("Frame",s,{
        Size=UDim2.new(1,-PAD*2,0,220),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.12,BorderSizePixel=0
    });corner(klFrame,CORNER);mkStroke(klFrame,T.bd);Y=Y+228
    local klScroll=new("ScrollingFrame",klFrame,{
        Size=UDim2.new(1,-4,1,-4),Position=UDim2.new(0,2,0,2),BackgroundTransparency=1,
        ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0
    })
    local function refreshKillLog(filter)
        for _,ch in ipairs(klScroll:GetChildren()) do if not ch:IsA("UICorner") then ch:Destroy() end end
        klStats.Text=string.format("Total Kills: %d   ·   Deaths: %d",S.totalKills or 0,S.totalDeaths or 0)
        local y=6
        local q=(filter or ""):lower()
        for i=#S.killLog,1,-1 do
            local e=S.killLog[i]
            if not e then continue end
            local nm=(e.displayName or e.name or ""):lower()
            local un=(e.name or ""):lower()
            if q~="" and not nm:find(q,1,true) and not un:find(q,1,true) then continue end
            local row=new("Frame",klScroll,{
                Size=UDim2.new(1,-8,0,40),Position=UDim2.new(0,4,0,y),
                BackgroundColor3=T.bgT,BackgroundTransparency=0.15,BorderSizePixel=0
            });corner(row,6)
            local av=new("ImageLabel",row,{
                Size=UDim2.new(0,28,0,28),Position=UDim2.new(0,6,0.5,-14),
                BackgroundColor3=T.bgS,BorderSizePixel=0,
                Image=getAvatarThumb(e.userId or 1,48)
            });corner(av,14)
            local isKill=(e.type~="death")
            new("TextLabel",row,{Size=UDim2.new(1,-90,0,16),Position=UDim2.new(0,40,0,4),BackgroundTransparency=1,
                Text=(isKill and "Killed " or "Death · ")..(e.displayName or e.name or "?"),
                TextColor3=isKill and T.ok or T.ng,Font=Enum.Font.GothamBold,TextSize=11,
                TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            local tstr=""
            pcall(function()
                if e.time then tstr=os.date("%m/%d %H:%M",e.time) end
            end)
            new("TextLabel",row,{Size=UDim2.new(1,-90,0,14),Position=UDim2.new(0,40,0,20),BackgroundTransparency=1,
                Text="@"..(e.name or "?").."  ·  "..tstr,
                TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,
                TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            y=y+44
        end
        if y<=6 then
            new("TextLabel",klScroll,{Size=UDim2.new(1,-12,0,20),Position=UDim2.new(0,6,0,8),BackgroundTransparency=1,
                Text="No kills logged yet",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=11,
                TextXAlignment=Enum.TextXAlignment.Left})
            y=30
        end
        klScroll.CanvasSize=UDim2.new(0,0,0,y+8)
    end
    refreshKillLog("")
    klSearch:GetPropertyChangedSignal("Text"):Connect(function() refreshKillLog(klSearch.Text) end)
    mkBtn(s,Y,"Refresh Kill Log",function() loadKillLog();refreshKillLog(klSearch.Text) end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Clear Kill Log",function()
        S.killLog={};S.totalKills=0;S.totalDeaths=0;saveKillLog();refreshKillLog("")
        showPopup("Kill Log","Cleared",T.wn)
    end);Y=Y+TOG_H+GAP

    -- ===== Hitlist =====
    mkSL(s,Y,"Hitlist");Y=Y+SEC_H+GAP
    mkTog(s,Y,{label="Banner Alert when in server",default=true,color=T.ng,cb=function(en) S.hitlistAlertOn=en end});Y=Y+TOG_H+GAP
    mkTog(s,Y,{label="Join Sniper notify",default=false,color=T.ac,cb=function(en) S.joinSniperOn=en end});Y=Y+TOG_H+GAP
    local hlSearch=new("TextBox",s,{
        Size=UDim2.new(1,-PAD*2-70,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,Text="",PlaceholderText="Username, display name, or UserId…",PlaceholderColor3=T.txD,
        TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,BorderSizePixel=0,ClearTextOnFocus=false
    });corner(hlSearch,CORNER);mkStroke(hlSearch,T.bd)
    new("UIPadding",hlSearch,{PaddingLeft=UDim.new(0,10)})
    local hlGo=new("TextButton",s,{
        Size=UDim2.new(0,64,0,30),Position=UDim2.new(1,-PAD-64,0,Y),
        BackgroundColor3=T.ac,Text="Lookup",TextColor3=Color3.fromRGB(255,255,255),
        Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0
    });corner(hlGo,CORNER);Y=Y+36
    -- Server player picker (scroll + select)
    local hlServerLbl=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,14),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Or pick from this server:",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
    Y=Y+16
    local hlServerFrame=new("Frame",s,{Size=UDim2.new(1,-PAD*2,0,100),Position=UDim2.new(0,PAD,0,Y),BackgroundColor3=T.bgS,BackgroundTransparency=0.12,BorderSizePixel=0})
    corner(hlServerFrame,CORNER);mkStroke(hlServerFrame,T.bd);Y=Y+108
    local hlServerScroll=new("ScrollingFrame",hlServerFrame,{
        Size=UDim2.new(1,-4,1,-4),Position=UDim2.new(0,2,0,2),BackgroundTransparency=1,
        ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0
    })
    local function refreshServerPicker(filter)
        for _,ch in ipairs(hlServerScroll:GetChildren()) do ch:Destroy() end
        local y=4
        local q=(filter or ""):lower()
        for _,p in ipairs(Players:GetPlayers()) do
            if p==plr then continue end
            local dn=(p.DisplayName or ""):lower();local un=(p.Name or ""):lower()
            if q~="" and not dn:find(q,1,true) and not un:find(q,1,true) then continue end
            local row=new("TextButton",hlServerScroll,{
                Size=UDim2.new(1,-8,0,32),Position=UDim2.new(0,4,0,y),
                BackgroundColor3=T.bgT,Text="",BorderSizePixel=0
            });corner(row,6)
            local av=new("ImageLabel",row,{Size=UDim2.new(0,24,0,24),Position=UDim2.new(0,4,0.5,-12),BackgroundColor3=T.bgS,BorderSizePixel=0,Image=getAvatarThumb(p.UserId,48)});corner(av,12)
            new("TextLabel",row,{Size=UDim2.new(1,-40,0,14),Position=UDim2.new(0,34,0,2),BackgroundTransparency=1,
                Text=p.DisplayName or p.Name,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            new("TextLabel",row,{Size=UDim2.new(1,-40,0,12),Position=UDim2.new(0,34,0,16),BackgroundTransparency=1,
                Text="@"..p.Name.." · "..tostring(p.UserId),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=9,TextXAlignment=Enum.TextXAlignment.Left})
            row.MouseButton1Click:Connect(function()
                playSFX("click")
                hlSearch.Text=p.Name
                task.spawn(function()
                    local profile=fetchRobloxUser(tostring(p.UserId))
                    if not profile then
                        profile={userId=p.UserId,name=p.Name,displayName=p.DisplayName,description="",created=""}
                    end
                    showProfile(profile)
                end)
            end)
            y=y+36
        end
        hlServerScroll.CanvasSize=UDim2.new(0,0,0,math.max(y,4))
    end
    refreshServerPicker("")
    hlSearch:GetPropertyChangedSignal("Text"):Connect(function() refreshServerPicker(hlSearch.Text) end)

    local hlInfo=new("Frame",s,{
        Size=UDim2.new(1,-PAD*2,0,130),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.12,BorderSizePixel=0
    });corner(hlInfo,CORNER);mkStroke(hlInfo,T.bd);Y=Y+138
    local hlAvatar=new("ImageLabel",hlInfo,{
        Size=UDim2.new(0,72,0,72),Position=UDim2.new(0,12,0,12),
        BackgroundColor3=T.bgT,BorderSizePixel=0,Image=""
    });corner(hlAvatar,8)
    local hlName=new("TextLabel",hlInfo,{Size=UDim2.new(1,-100,0,20),Position=UDim2.new(0,96,0,10),BackgroundTransparency=1,
        Text="Search a user",TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left})
    local hlUser=new("TextLabel",hlInfo,{Size=UDim2.new(1,-100,0,16),Position=UDim2.new(0,96,0,32),BackgroundTransparency=1,
        Text="",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
    local hlMeta=new("TextLabel",hlInfo,{Size=UDim2.new(1,-100,0,50),Position=UDim2.new(0,96,0,52),BackgroundTransparency=1,
        Text="",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true})
    local hlCurrent=nil
    local function showProfile(p)
        hlCurrent=p
        if not p then
            hlName.Text="Not found";hlUser.Text="";hlMeta.Text="";hlAvatar.Image=""
            return
        end
        hlName.Text=p.displayName or p.name or "?"
        hlUser.Text="@"..(p.name or "?").."  ·  UID "..tostring(p.userId or "?")
        hlAvatar.Image=getAvatarThumb(p.userId or 1,150)
        local bits={}
        if p.created and p.created~="" then bits[#bits+1]="Created: "..tostring(p.created):sub(1,10) end
        if p.friends then bits[#bits+1]="Friends: "..tostring(p.friends) end
        if p.followers then bits[#bits+1]="Followers: "..tostring(p.followers) end
        if p.followings then bits[#bits+1]="Following: "..tostring(p.followings) end
        if p.isBanned then bits[#bits+1]="BANNED" end
        local desc=(p.description or ""):gsub(""," ")
        if #desc>80 then desc=desc:sub(1,80).."…" end
        if #desc>0 then bits[#bits+1]=desc end
        hlMeta.Text=table.concat(bits,"  ·  ")
    end
    hlGo.MouseButton1Click:Connect(function()
        playSFX("click")
        local q=hlSearch.Text:gsub("^%s+",""):gsub("%s+$","")
        if q=="" then showPopup("Hitlist","Enter username or ID",T.wn);return end
        showPopup("Hitlist","Looking up…",T.wn)
        task.spawn(function()
            local p=fetchRobloxUser(q)
            showProfile(p)
            if p then showPopup("Hitlist",p.displayName or p.name,T.ok)
            else showPopup("Hitlist","User not found",T.ng) end
        end)
    end)
    mkBtn(s,Y,"Add to Hitlist (priority)",function()
        if not hlCurrent or not hlCurrent.userId then showPopup("Hitlist","Lookup a user first",T.wn);return end
        local e={
            userId=hlCurrent.userId,name=hlCurrent.name,displayName=hlCurrent.displayName,
            description=hlCurrent.description,created=hlCurrent.created,
            friends=hlCurrent.friends,followers=hlCurrent.followers,followings=hlCurrent.followings,
            priority=true,addedAt=os.time()
        }
        S.hitlist[tostring(e.userId)]=e
        saveHitlist()
        showPopup("Hitlist","Added "..(e.displayName or e.name),T.ng)
        -- if already in server, banner now
        for _,p in ipairs(Players:GetPlayers()) do
            if p.UserId==e.userId then checkHitlistPlayer(p) end
        end
        if refreshHitlistUI then refreshHitlistUI() end
    end);Y=Y+TOG_H+GAP
    local hlListFrame=new("Frame",s,{
        Size=UDim2.new(1,-PAD*2,0,160),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.12,BorderSizePixel=0
    });corner(hlListFrame,CORNER);mkStroke(hlListFrame,T.bd);Y=Y+168
    local hlListScroll=new("ScrollingFrame",hlListFrame,{
        Size=UDim2.new(1,-4,1,-4),Position=UDim2.new(0,2,0,2),BackgroundTransparency=1,
        ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0
    })
    function refreshHitlistUI()
        for _,ch in ipairs(hlListScroll:GetChildren()) do ch:Destroy() end
        local y=4
        for uid,e in pairs(S.hitlist) do
            local row=new("Frame",hlListScroll,{
                Size=UDim2.new(1,-8,0,44),Position=UDim2.new(0,4,0,y),
                BackgroundColor3=T.bgT,BackgroundTransparency=0.1,BorderSizePixel=0
            });corner(row,6);mkStroke(row,T.ng,1)
            local av=new("ImageLabel",row,{
                Size=UDim2.new(0,32,0,32),Position=UDim2.new(0,6,0.5,-16),
                BackgroundColor3=T.bgS,BorderSizePixel=0,Image=getAvatarThumb(e.userId or 1,48)
            });corner(av,16)
            new("TextLabel",row,{Size=UDim2.new(0.55,0,0,16),Position=UDim2.new(0,44,0,6),BackgroundTransparency=1,
                Text=e.displayName or e.name or "?",TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,
                TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            new("TextLabel",row,{Size=UDim2.new(0.55,0,0,14),Position=UDim2.new(0,44,0,24),BackgroundTransparency=1,
                Text="@"..(e.name or "?").." · "..tostring(e.userId),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,
                TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            local rm=new("TextButton",row,{
                Size=UDim2.new(0,56,0,24),Position=UDim2.new(1,-64,0.5,-12),
                BackgroundColor3=T.ng,Text="Remove",TextColor3=Color3.fromRGB(255,255,255),
                Font=Enum.Font.GothamBold,TextSize=10,BorderSizePixel=0
            });corner(rm,5)
            rm.MouseButton1Click:Connect(function()
                S.hitlist[uid]=nil;saveHitlist();refreshHitlistUI()
                showPopup("Hitlist","Removed",T.txM)
            end)
            y=y+48
        end
        if y<=4 then
            new("TextLabel",hlListScroll,{Size=UDim2.new(1,-12,0,20),Position=UDim2.new(0,6,0,8),BackgroundTransparency=1,
                Text="No priority targets yet",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=11,
                TextXAlignment=Enum.TextXAlignment.Left})
            y=28
        end
        hlListScroll.CanvasSize=UDim2.new(0,0,0,y+6)
    end
    refreshHitlistUI()

    -- ScriptBlox search
    mkSL(s,Y,"Script Search (ScriptBlox)");Y=Y+SEC_H+GAP
    local searchBox=new("TextBox",s,{
        Size=UDim2.new(1,-PAD*2-70,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,Text="",PlaceholderText="Search ScriptBlox…",PlaceholderColor3=T.txD,
        TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,BorderSizePixel=0,ClearTextOnFocus=false
    });corner(searchBox,CORNER);mkStroke(searchBox,T.bd)
    new("UIPadding",searchBox,{PaddingLeft=UDim.new(0,10)})
    local searchGo=new("TextButton",s,{
        Size=UDim2.new(0,64,0,30),Position=UDim2.new(1,-PAD-64,0,Y),
        BackgroundColor3=T.ac,Text="Search",TextColor3=Color3.fromRGB(255,255,255),
        Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0
    });corner(searchGo,CORNER);Y=Y+36
    local resultsFrame=new("Frame",s,{
        Size=UDim2.new(1,-PAD*2,0,200),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,BackgroundTransparency=0.15,BorderSizePixel=0
    });corner(resultsFrame,CORNER);mkStroke(resultsFrame,T.bd);Y=Y+208
    local resultsScroll=new("ScrollingFrame",resultsFrame,{
        Size=UDim2.new(1,-4,1,-4),Position=UDim2.new(0,2,0,2),BackgroundTransparency=1,
        ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0
    })
    local statusLbl=new("TextLabel",resultsScroll,{
        Size=UDim2.new(1,-12,0,20),Position=UDim2.new(0,6,0,8),BackgroundTransparency=1,
        Text="Type a query and press Search",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left
    })
    local function loadScriptFromUrl(title,url)
        showPopup("Loading…",title or "script",T.wn)
        task.spawn(function()
            local ok,err=pcall(function()
                local src=game:HttpGet(url)
                assert(src and src~="","empty response")
                local fn,cerr=loadstring(src);assert(fn,cerr);fn()
            end)
            if ok then showPopup("Loaded",title or "OK",T.ok)
            else showPopup("Failed",tostring(err):sub(1,48),T.ng) end
        end)
    end
    local function renderScriptBlox(query)
        resultsScroll:ClearAllChildren()
        statusLbl=new("TextLabel",resultsScroll,{
            Size=UDim2.new(1,-12,0,20),Position=UDim2.new(0,6,0,8),BackgroundTransparency=1,
            Text="Searching ScriptBlox…",TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Left
        })
        task.spawn(function()
            local results={}
            local ok=pcall(function()
                local q=game:GetService("HttpService"):UrlEncode(query)
                local raw=game:HttpGet("https://scriptblox.com/api/script/search?q="..q.."&max=20&mode=free")
                local data=game:GetService("HttpService"):JSONDecode(raw)
                if data and data.result and data.result.scripts then
                    results=data.result.scripts
                elseif data and data.scripts then
                    results=data.scripts
                end
            end)
            resultsScroll:ClearAllChildren()
            if not ok or #results==0 then
                -- fallback popular scripts
                local fallback={
                    {title="Infinite Yield",scriptType="admin",slug=nil,url="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
                    {title="Dex Explorer",scriptType="explorer",url="https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"},
                    {title="Unnamed ESP",scriptType="esp",url="https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"},
                    {title="SimpleSpy",scriptType="spy",url="https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
                }
                local cy=4
                new("TextLabel",resultsScroll,{Size=UDim2.new(1,-12,0,18),Position=UDim2.new(0,6,0,cy),BackgroundTransparency=1,
                    Text=(ok and "No results — showing popular" or "API offline — popular scripts"),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10})
                cy=cy+22
                for _,sc in ipairs(fallback) do
                    if query=="" or sc.title:lower():find(query:lower(),1,true) then
                        local row=new("TextButton",resultsScroll,{Size=UDim2.new(1,-8,0,32),Position=UDim2.new(0,4,0,cy),BackgroundColor3=T.bgT,Text="",BorderSizePixel=0})
                        corner(row,6)
                        new("TextLabel",row,{Size=UDim2.new(1,-70,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Text=sc.title,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
                        new("TextLabel",row,{Size=UDim2.new(0,50,0,16),Position=UDim2.new(1,-58,0.5,-8),BackgroundTransparency=1,Text=sc.scriptType,TextColor3=T.ac,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Right})
                        row.MouseButton1Click:Connect(function() playSFX("click");loadScriptFromUrl(sc.title,sc.url) end)
                        cy=cy+36
                    end
                end
                resultsScroll.CanvasSize=UDim2.new(0,0,0,cy+4)
                return
            end
            local cy=4
            for _,sc in ipairs(results) do
                local title=sc.title or sc.name or "Script"
                local tag=sc.scriptType or sc.game and (sc.game.name or "") or "script"
                local row=new("TextButton",resultsScroll,{Size=UDim2.new(1,-8,0,36),Position=UDim2.new(0,4,0,cy),BackgroundColor3=T.bgT,Text="",BorderSizePixel=0})
                corner(row,6)
                new("TextLabel",row,{Size=UDim2.new(1,-70,0,18),Position=UDim2.new(0,10,0,2),BackgroundTransparency=1,Text=title,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
                new("TextLabel",row,{Size=UDim2.new(1,-70,0,14),Position=UDim2.new(0,10,0,18),BackgroundTransparency=1,Text=tostring(tag):sub(1,40),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
                new("TextLabel",row,{Size=UDim2.new(0,50,0,16),Position=UDim2.new(1,-58,0.5,-8),BackgroundTransparency=1,Text="Load",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right})
                row.MouseButton1Click:Connect(function()
                    playSFX("click")
                    local slug=sc._id or sc.id or sc.slug
                    local url=sc.rawScript or sc.script
                    if type(url)=="string" and #url>20 and not url:find("^http") then
                        -- inline script body
                        showPopup("Loading…",title,T.wn)
                        task.spawn(function()
                            local ok2,err2=pcall(function()
                                local fn,cerr=loadstring(url);assert(fn,cerr);fn()
                            end)
                            if ok2 then showPopup("Loaded",title,T.ok) else showPopup("Failed",tostring(err2):sub(1,40),T.ng) end
                        end)
                    elseif slug then
                        loadScriptFromUrl(title,"https://raw.scriptblox.com/script/"..tostring(slug))
                    elseif type(url)=="string" and url:find("^http") then
                        loadScriptFromUrl(title,url)
                    else
                        showPopup("Failed","No source for "..title,T.ng)
                    end
                end)
                cy=cy+40
            end
            resultsScroll.CanvasSize=UDim2.new(0,0,0,cy+4)
        end)
    end
    searchGo.MouseButton1Click:Connect(function()
        playSFX("click")
        local q=searchBox.Text
        if q=="" then showPopup("Search","Enter a query",T.wn);return end
        renderScriptBlox(q)
    end)
    searchBox.FocusLost:Connect(function(enter)
        if enter and searchBox.Text~="" then renderScriptBlox(searchBox.Text) end
    end)

    mkSL(s,Y,"Local Chat");Y=Y+SEC_H+GAP
    local chatLog=new("ScrollingFrame",s,{
        Size=UDim2.new(1,-PAD*2,0,140),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgS,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,
        CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=0.1
    });corner(chatLog,CORNER);mkStroke(chatLog,T.bd);ra("bS",chatLog,"BackgroundColor3");Y=Y+148
    local chatLines,chatY={},4
    local function addChat(who,msg)
        local l=new("TextLabel",chatLog,{
            Size=UDim2.new(1,-12,0,0),Position=UDim2.new(0,6,0,chatY),
            BackgroundTransparency=1,Text="["..who.."] "..msg,
            TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
            TextYAlignment=Enum.TextYAlignment.Top
        })
        local th=math.max(16,math.ceil(#msg/42)*14+4)
        l.Size=UDim2.new(1,-12,0,th)
        chatY=chatY+th+2
        chatLog.CanvasSize=UDim2.new(0,0,0,chatY+8)
        chatLog.CanvasPosition=Vector2.new(0,math.max(0,chatY-140))
        table.insert(chatLines,l)
        if #chatLines>40 then local old=table.remove(chatLines,1);if old then old:Destroy() end end
    end
    addChat("System","Welcome to ChudHub chat (local only)")
    local chatBox=new("TextBox",s,{
        Size=UDim2.new(1,-PAD*2-70,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,
        Text="",PlaceholderText="Type a message…",PlaceholderColor3=T.txD,ClearTextOnFocus=false,BorderSizePixel=0
    });corner(chatBox,CORNER);mkStroke(chatBox,T.bd)
    new("UIPadding",chatBox,{PaddingLeft=UDim.new(0,8)})
    local sendBtn=new("TextButton",s,{
        Size=UDim2.new(0,60,0,30),Position=UDim2.new(1,-PAD-60,0,Y),
        BackgroundColor3=T.ac,Text="Send",TextColor3=Color3.fromRGB(255,255,255),
        Font=Enum.Font.GothamBold,TextSize=12,BorderSizePixel=0
    });corner(sendBtn,CORNER)
    local function doSend()
        local t=chatBox.Text
        if t and #t>0 then
            addChat(plr.Name,t)
            -- try replicate via TextChatService if available (local display only fallback)
            pcall(function()
                local tcs=game:GetService("TextChatService")
                local ch=tcs and tcs:FindFirstChild("TextChannels") and tcs.TextChannels:FindFirstChild("RBXGeneral")
                if ch then ch:SendAsync("[CH] "..t) end
            end)
            chatBox.Text=""
            playSFX("click",0.2)
        end
    end
    sendBtn.MouseButton1Click:Connect(doSend)
    chatBox.FocusLost:Connect(function(enter) if enter then doSend() end end)
    Y=Y+TOG_H+GAP

    mkSL(s,Y,"Media Player");Y=Y+SEC_H+GAP
    local hint=new("TextLabel",s,{Size=UDim2.new(1,-PAD*2,0,28),Position=UDim2.new(0,PAD,0,Y),BackgroundTransparency=1,
        Text="Plays Roblox audio asset IDs (not live Spotify — Spotify needs OAuth outside Roblox).",
        TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left})
    Y=Y+32
    local idBox=new("TextBox",s,{
        Size=UDim2.new(1,-PAD*2,0,30),Position=UDim2.new(0,PAD,0,Y),
        BackgroundColor3=T.bgT,TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=12,
        Text="",PlaceholderText="rbxassetid:// or numeric ID",PlaceholderColor3=T.txD,ClearTextOnFocus=false,BorderSizePixel=0
    });corner(idBox,CORNER);mkStroke(idBox,T.bd)
    new("UIPadding",idBox,{PaddingLeft=UDim.new(0,8)});Y=Y+TOG_H+GAP
    mkSl(s,Y,{label="Volume",min=0,max=1,default=0.5,rounding=2,cb=function(v)
        S.mediaVol=v
        if S.mediaSound then pcall(function() S.mediaSound.Volume=v end) end
    end});Y=Y+SL_H+GAP
    mkBtn(s,Y,"Play / Resume",function()
        local id=idBox.Text:gsub("%s+",""):gsub("rbxassetid://","")
        if id=="" then showPopup("Media","Enter an audio asset ID",T.wn);return end
        pcall(function()
            if S.mediaSound then S.mediaSound:Destroy() end
            local snd=Instance.new("Sound")
            snd.SoundId="rbxassetid://"..id
            snd.Volume=S.mediaVol or 0.5
            snd.Looped=true
            snd.Parent=sg
            S.mediaSound=snd;S.mediaPlaying=true;S.mediaId=id
            snd:Play()
            showPopup("Media","Playing "..id,T.ok)
        end)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Stop",function()
        if S.mediaSound then pcall(function() S.mediaSound:Stop();S.mediaSound:Destroy() end);S.mediaSound=nil end
        S.mediaPlaying=false
        showPopup("Media","Stopped",T.txM)
    end);Y=Y+TOG_H+GAP
    mkBtn(s,Y,"Detect Playing Audio",function()
        local found={}
        local function scan(parent)
            for _,o in ipairs(parent:GetDescendants()) do
                if o:IsA("Sound") and o.IsPlaying then
                    found[#found+1]={id=o.SoundId,vol=o.Volume,name=o.Name,obj=o}
                end
            end
        end
        pcall(function() scan(workspace) end)
        pcall(function() scan(game:GetService("SoundService")) end)
        pcall(function() if plr.Character then scan(plr.Character) end end)
        pcall(function() scan(plr:FindFirstChild("PlayerGui") or plr) end)
        if #found==0 then
            showPopup("Audio","No playing sounds found",T.wn)
        else
            local f=found[1]
            local num=tostring(f.id):gsub("rbxassetid://","")
            idBox.Text=num
            S.mediaId=num
            showPopup("Audio Found",(#found).." sound(s) · using first",T.ok)
            -- optional: adopt the sound
            pcall(function()
                if S.mediaSound then S.mediaSound:Destroy() end
                S.mediaSound=f.obj
                S.mediaPlaying=true
            end)
        end
    end);Y=Y+TOG_H+GAP

    s.CanvasSize=UDim2.new(0,0,0,Y+12)
end

buildMove();buildWeapon();buildRPG();buildVis();buildWorld();buildPlayer();buildVehicle();buildMisc();buildOnline();buildLayout()
_curBuildTab=nil

-- User panel (same content area as any tab; opened from bottom-left button)
do
    userScroll=new("ScrollingFrame",ca2,{
        Size=UDim2.new(1,0,1,-34),Position=UDim2.new(0,0,0,34),
        BackgroundTransparency=1,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,
        Visible=false,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0)
    })
    local function buildUserPanel()
        userScroll:ClearAllChildren()
        local Y=8
        local card=new("Frame",userScroll,{
            Size=UDim2.new(1,-PAD*2,0,88),Position=UDim2.new(0,PAD,0,Y),
            BackgroundColor3=T.bgT,BackgroundTransparency=0.05,BorderSizePixel=0
        });corner(card,10);mkStroke(card,T.ac,1)
        local av=new("ImageLabel",card,{
            Size=UDim2.new(0,56,0,56),Position=UDim2.new(0,14,0.5,-28),
            BackgroundColor3=T.bgS,BorderSizePixel=0,Image=getAvatarThumb(plr.UserId,100)
        });corner(av,28);mkStroke(av,T.ac,1.5)
        new("TextLabel",card,{Size=UDim2.new(1,-90,0,22),Position=UDim2.new(0,82,0,16),BackgroundTransparency=1,
            Text=plr.DisplayName or plr.Name,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left})
        new("TextLabel",card,{Size=UDim2.new(1,-90,0,16),Position=UDim2.new(0,82,0,40),BackgroundTransparency=1,
            Text="@"..plr.Name.." · "..tostring(plr.UserId),TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
        local ping=0;pcall(function() ping=plr:GetNetworkPing()*1000 end)
        new("TextLabel",card,{Size=UDim2.new(1,-90,0,14),Position=UDim2.new(0,82,0,60),BackgroundTransparency=1,
            Text=string.format("Ping %dms · Place %s",mfl(ping),tostring(game.PlaceId)),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
        Y=Y+96
        mkSL(userScroll,Y,"Server");Y=Y+SEC_H+GAP
        local infoCard=new("Frame",userScroll,{Size=UDim2.new(1,-PAD*2,0,72),Position=UDim2.new(0,PAD,0,Y),BackgroundColor3=T.bgT,BackgroundTransparency=0.12,BorderSizePixel=0})
        corner(infoCard,8);mkStroke(infoCard,T.bd)
        local infos={
            {"Players",#Players:GetPlayers().." / "..Players.MaxPlayers},
            {"JobId",(game.JobId or "—"):sub(1,22)},
            {"Script","ChudHub v1 · Running"},
            {"Focus",S.focusMode and "ON" or "OFF"},
        }
        for i,inf in ipairs(infos) do
            local col=(i-1)%2;local row=math.floor((i-1)/2)
            new("TextLabel",infoCard,{Size=UDim2.new(0.22,0,0,14),Position=UDim2.new(col*0.5,10,0,10+row*28),BackgroundTransparency=1,
                Text=inf[1],TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
            new("TextLabel",infoCard,{Size=UDim2.new(0.26,0,0,14),Position=UDim2.new(col*0.5+0.22,0,0,10+row*28),BackgroundTransparency=1,
                Text=tostring(inf[2]),TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
        end
        Y=Y+80
        mkSL(userScroll,Y,"Quick Features");Y=Y+SEC_H+GAP
        local quicks={
            {n="Fly",fn=function() if flyTog then flyTog.u(not S.flying) end end},
            {n="ESP",fn=function() S.espOn=not S.espOn;if espTog then espTog.u(S.espOn) end end},
            {n="NoClip",fn=function() S.ncOn=not S.ncOn;applyNC(S.ncOn) end},
            {n="Speed",fn=function() S.spHkOn=not S.spHkOn;applySpd() end},
            {n="Inf Jump",fn=function() S.infJOn=not S.infJOn;applyInfJ(S.infJOn) end},
            {n="God",fn=function() S.godMode=not S.godMode end},
        }
        for i,q in ipairs(quicks) do
            local col=(i-1)%3;local row=math.floor((i-1)/3)
            local b=new("TextButton",userScroll,{
                Size=UDim2.new(1/3,-PAD-4,0,32),
                Position=UDim2.new(col/3,PAD+(col>0 and 2 or 0),0,Y+row*38),
                BackgroundColor3=T.bgT,Text=q.n,TextColor3=T.tx,Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0
            });corner(b,CORNER);mkStroke(b,T.bd)
            b.MouseButton1Click:Connect(function() playSFX("click");q.fn();showPopup(q.n,"Toggled",T.ac) end)
        end
        Y=Y+math.ceil(#quicks/3)*38+GAP
        mkSL(userScroll,Y,"Players");Y=Y+SEC_H+GAP
        local playerActions={"Spectate","Orbit","Bring","Teleport","Fling","RPG Target","Whitelist"}
        for _,p in ipairs(Players:GetPlayers()) do
            local isSelf=p==plr
            local row=new("Frame",userScroll,{
                Size=UDim2.new(1,-PAD*2,0,48),Position=UDim2.new(0,PAD,0,Y),
                BackgroundColor3=T.bgT,BackgroundTransparency=0.1,BorderSizePixel=0
            });corner(row,8);mkStroke(row,S.focusTargets[p.Name] and T.ac or T.bd)
            local pav=new("ImageLabel",row,{
                Size=UDim2.new(0,34,0,34),Position=UDim2.new(0,8,0.5,-17),
                BackgroundColor3=T.bgS,BorderSizePixel=0,Image=getAvatarThumb(p.UserId,48)
            });corner(pav,17)
            new("TextLabel",row,{Size=UDim2.new(0.45,0,0,18),Position=UDim2.new(0,50,0,6),BackgroundTransparency=1,
                Text=p.DisplayName or p.Name,TextColor3=isSelf and T.ac or T.tx,Font=Enum.Font.GothamBold,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd})
            new("TextLabel",row,{Size=UDim2.new(0.45,0,0,14),Position=UDim2.new(0,50,0,26),BackgroundTransparency=1,
                Text=isSelf and "you" or ("@"..p.Name),TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
            if not isSelf then
                local open=false
                local actBtn=new("TextButton",row,{
                    Size=UDim2.new(0,90,0,28),Position=UDim2.new(1,-98,0.5,-14),
                    BackgroundColor3=T.bgS,Text="Actions",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,BorderSizePixel=0
                });corner(actBtn,6);mkStroke(actBtn,T.bd)
                local drop=nil
                actBtn.MouseButton1Click:Connect(function()
                    playSFX("click",0.2)
                    if open and drop then drop:Destroy();drop=nil;open=false;return end
                    open=true
                    drop=new("Frame",sg,{
                        Size=UDim2.new(0,130,0,#playerActions*28+8),
                        Position=UDim2.new(0,actBtn.AbsolutePosition.X-40,0,actBtn.AbsolutePosition.Y+30),
                        BackgroundColor3=T.bgS,BorderSizePixel=0,ZIndex=100
                    });corner(drop,8);mkStroke(drop,T.ac,1)
                    for ai,an in ipairs(playerActions) do
                        local ab=new("TextButton",drop,{
                            Size=UDim2.new(1,-8,0,26),Position=UDim2.new(0,4,0,4+(ai-1)*28),
                            BackgroundColor3=T.bgT,BackgroundTransparency=0.3,Text="  "..an,TextColor3=T.tx,
                            Font=Enum.Font.Gotham,TextSize=11,BorderSizePixel=0,ZIndex=101,TextXAlignment=Enum.TextXAlignment.Left
                        });corner(ab,5)
                        ab.MouseButton1Click:Connect(function()
                            playSFX("click")
                                                        if an=="Spectate" then
                                if S.spectating and S.spectateTarget==p then
                                    S.spectating=false;S.spectateTarget=nil
                                    pcall(function()
                                        local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                                        if h then cam.CameraSubject=h end
                                    end)
                                    showPopup("Spectate","Stopped",T.txM)
                                else
                                    S.spectating=true;S.spectateTarget=p
                                    pcall(function() cam.CameraSubject=p.Character and p.Character:FindFirstChildOfClass("Humanoid") end)
                                    showPopup("Spectate",p.Name,T.ac)
                                end
                            elseif an=="Fling" then
                                task.spawn(function()
                                    local th=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                                    if not th then showPopup("Fling","No character",T.wn);return end
                                    for _=1,25 do
                                        pcall(function()
                                            local bv=Instance.new("BodyVelocity")
                                            bv.MaxForce=Vector3.new(1e5,1e5,1e5)
                                            bv.Velocity=Vector3.new(mra(-15000,15000),12000,mra(-15000,15000))
                                            bv.Parent=th
                                            task.delay(0.08,function() if bv then bv:Destroy() end end)
                                        end)
                                        task.wait(0.05)
                                    end
                                    showPopup("Fling",p.Name,T.ng)
                                end)
elseif an=="Orbit" then
                                S.orbitSpecific=true;S.orbitSpecTarget=p
                                showPopup("Orbit",p.Name,T.ac)
                            elseif an=="Bring" then
                                if startBring then startBring(p) end
                                showPopup("Bring",p.Name,T.ac)
                            elseif an=="Teleport" then
                                pcall(function()
                                    local th=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                                    if th and hrp then hrp.CFrame=th.CFrame*CFrame.new(0,0,3) end
                                end)
                                showPopup("TP",p.Name,T.ok)
                            elseif an=="RPG Target" then
                                -- toggle: click again to disable
                                if S.focusTargets[p.Name] then
                                    S.focusTargets[p.Name]=nil
                                    local any=false
                                    for _ in pairs(S.focusTargets) do any=true;break end
                                    if not any then
                                        S.focusMode=false
                                        if S.spamOn then S.spamOn=false;S.fireGen=S.fireGen+1;if mainTog then mainTog.u(false) end end
                                    end
                                    showPopup("RPG Target",p.Name.." removed",T.txM)
                                else
                                    S.focusTargets[p.Name]=true
                                    S.focusMode=true
                                    S.targetHudOn=true
                                    -- ensure HUD frame exists & visible
                                    if not S.targetHudFrame then
                                        S.targetHudFrame=new("Frame",sg,{
                                            Size=UDim2.new(0,220,0,80),Position=UDim2.new(0.5,-110,0,80),
                                            BackgroundColor3=T.bg,BackgroundTransparency=0.12,BorderSizePixel=0,ZIndex=55
                                        });corner(S.targetHudFrame,10);mkStroke(S.targetHudFrame,T.ac,1.5)
                                        S.targetHudList=new("Frame",S.targetHudFrame,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1})
                                    end
                                    S.targetHudFrame.Visible=true
                                    if not S.hasShot then
                                        showPopup("RPG Target","Fire RPG into ground first",T.wn)
                                    else
                                        S.spamOn=true
                                        if mainTog then mainTog.u(true) end
                                        showPopup("RPG Target",p.Name.." focused + spam ON",T.ac)
                                    end
                                end
                                -- refresh target HUD list
                                if type(refreshTargetHud)=="function" then refreshTargetHud() end
                                buildUserPanel()
                            elseif an=="Whitelist" then
                                S.wlist[p.Name]=not S.wlist[p.Name]
                                showPopup("Whitelist",p.Name,T.wn)
                            end
                            if drop then drop:Destroy() end;open=false
                        end)
                    end
                    task.delay(5,function() if drop and drop.Parent then drop:Destroy() end;open=false end)
                end)
            end
            Y=Y+54
        end
        userScroll.CanvasSize=UDim2.new(0,0,0,Y+16)
    end

    toggleUserPanel=function()
        playSFX(userPanelOpen and "close" or "open")
        if userPanelOpen then
            userPanelOpen=false
            if searchPop then searchPop.Visible=false end
            searchActive=false
            if type(tabC)=="table" then
                for _,tab in pairs(tabC) do if tab.scroll then tab.scroll.Visible=false end end
            end
            if userScroll then userScroll.Visible=false end
            if curTab and tabC[curTab] then
                tabC[curTab].scroll.Visible=true
                if contTitle then contTitle.Text=">_  "..curTab:lower() end
            end
            return
        end
        searchActive=false
        if searchPop then searchPop.Visible=false end
        if type(tabC)=="table" then
            for _,tab in pairs(tabC) do if tab.scroll then tab.scroll.Visible=false end end
        end
        buildUserPanel()
        if userScroll then userScroll.Visible=true end
        userPanelOpen=true
        if contTitle then contTitle.Text=">_  user" end
    end
end

-- ===== ArrayList (bottom-right) — width by text, sorted by length, multiple styles =====
-- Shared drag helper for overlay HUDs
local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dstart, pstart = false, nil, nil
    handle.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dstart = inp.Position
            pstart = frame.Position
        end
    end)
    handle.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UIS.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = inp.Position - dstart
            frame.Position = UDim2.new(
                pstart.X.Scale, pstart.X.Offset + delta.X,
                pstart.Y.Scale, pstart.Y.Offset + delta.Y
            )
        end
    end)
end

-- Keybinds list HUD (top-left, toggleable)
keybindsHud=new("Frame",sg,{
    Size=UDim2.new(0,180,0,0),Position=UDim2.new(0,12,0,12),
    BackgroundColor3=T.bg,BackgroundTransparency=0.25,BorderSizePixel=0,ZIndex=55,Visible=S.keybindsListOn==true
});corner(keybindsHud,8);mkStroke(keybindsHud,T.bd,1)
makeDraggable(keybindsHud)
local function refreshKeybindsHud()
    if not keybindsHud then return end
    for _,ch in ipairs(keybindsHud:GetChildren()) do
        if not ch:IsA("UICorner") and not ch:IsA("UIStroke") then ch:Destroy() end
    end
    local y=6
    new("TextLabel",keybindsHud,{Size=UDim2.new(1,-12,0,16),Position=UDim2.new(0,8,0,y),BackgroundTransparency=1,
        Text="KEYBINDS",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=56})
    y=y+20
    local order={
        {"Menu",S.keybinds.menuToggle},
        {"Minimize",S.keybinds.minimize},
        {"Alt Cmd",S.keybinds.altPalette},
        {"Fly",S.keybinds.fly},
        {"ESP",S.keybinds.esp},
        {"Spam",S.keybinds.spam},
        {"Speed",S.keybinds.speed},
        {"Jump",S.keybinds.jump},
        {"InfJump",S.keybinds.infJump},
        {"NoClip",S.keybinds.noClip},
        {"Spin",S.keybinds.spin},
        {"Hitbox",S.keybinds.hitbox},
        {"Chams",S.keybinds.chams},
        {"Orbit",S.keybinds.orbit},
    }
    for _,pair in ipairs(order) do
        local name,key=pair[1],pair[2]
        if key and typeof(key)=="EnumItem" and key~=Enum.KeyCode.Unknown then
            local row=new("Frame",keybindsHud,{Size=UDim2.new(1,-12,0,18),Position=UDim2.new(0,6,0,y),BackgroundTransparency=1,ZIndex=56})
            new("TextLabel",row,{Size=UDim2.new(0.55,0,1,0),BackgroundTransparency=1,Text=name,TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
            new("TextLabel",row,{Size=UDim2.new(0.45,0,1,0),Position=UDim2.new(0.55,0,0,0),BackgroundTransparency=1,Text=key.Name,TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right})
            y=y+18
        end
    end
    keybindsHud.Size=UDim2.new(0,180,0,math.max(y+8,28))
    keybindsHud.Visible=S.keybindsListOn==true
end
task.spawn(function()
    task.wait(1.5)
    pcall(refreshKeybindsHud)
end)
RS.Heartbeat:Connect(function()
    if S.keybindsListOn and keybindsHud and tick()%2<0.05 then
        pcall(refreshKeybindsHud)
    end
end)

arrayListFrame=new("Frame",sg,{
    Size=UDim2.new(0,10,0,10),
    AnchorPoint=Vector2.new(1,1),
    Position=UDim2.new(1,-14,1,-14),
    BackgroundColor3=T.bg,
    BackgroundTransparency=1,ZIndex=60,Visible=S.arrayListOn~=false
})
makeDraggable(arrayListFrame)
local arrayListLabels={}
local function textWidth(str,size)
    -- approximate GothamBold width
    return mfl(#str*(size*0.62))+16
end
function refreshArrayList()
    if not arrayListFrame then return end
    for _,l in ipairs(arrayListLabels) do if l and l.Parent then l:Destroy() end end
    arrayListLabels={}
    local active={}
    local checks={
        {"Aimbot",function() return S.aimbotEnabled end},
                {"Fly",function() return S.flying end},
        {"ESP",function() return S.espOn end},
        {"Spam",function() return S.spamOn end},
        {"Speed",function() return S.spHkOn end},
        {"Jump",function() return S.jpHkOn end},
        {"Noclip",function() return S.ncOn end},
        {"Spin",function() return S.spinOn end},
        {"Hitbox",function() return S.hitboxOn end},
        {"Chams",function() return S.chamsOn end},
        {"Fullbright",function() return S.brightOn end},
        {"XRay",function() return S.xrayOn end},
                {"Desync",function() return S.desyncEnabled end},
                        {"Spectate",function() return S.spectating end},
        {"Light Mode",function() return S.lightMode end},
        {"Anti-AFK",function() return S.antiAfkOn end},
        {"Click Mode",function() return S.clickOn end},
        {"Inf Jump",function() return S.infJOn end},
        {"Bhop",function() return S.bhopOn end},
        {"LagSwitch",function() return S.lagSwitchOn end},
        {"SpinLock",function() return S.spinOn and S.spinClientLock end},
    }
    for _,c in ipairs(checks) do
        local ok,on=pcall(c[2])
        if ok and on then active[#active+1]=c[1] end
    end
    -- sort longest text first (classic arraylist look)
    table.sort(active,function(a,b)
        if #a==#b then return a<b end
        return #a>#b
    end)
    local style=S.arrayListStyle or "Default"
    local rowH=(style=="Minimal") and 16 or 18
    local y=0
    local maxW=40
    for _,name in ipairs(active) do
        local w=textWidth(name,11)
        if w>maxW then maxW=w end
    end
    for i,name in ipairs(active) do
        local w=textWidth(name,11)
        -- each row sized to its own text, right-aligned in the list
        local rowW=w+8
        local row=new("Frame",arrayListFrame,{
            Size=UDim2.new(0,rowW,0,rowH),
            Position=UDim2.new(1,-rowW,1,-(y+rowH)),
            BackgroundTransparency=1,BorderSizePixel=0,ZIndex=61
        })
        local bgTransparency,bgColor,barColor,txtColor,useShadow,useGrad,useRainbow=
            0.25,T.bgS,T.ac,T.tx,false,false,false
        if style=="Minimal" then
            bgTransparency=1;barColor=T.ac;txtColor=T.tx
        elseif style=="Gradient" then
            bgTransparency=0.15;bgColor=T.bgT;useGrad=true
        elseif style=="Shadow" then
            bgTransparency=0.1;bgColor=T.bgS;useShadow=true
        elseif style=="Rainbow" then
            bgTransparency=0.2;useRainbow=true
            local hue=((tick()*0.15)+i*0.08)%1
            barColor=Color3.fromHSV(hue,0.85,1)
            txtColor=Color3.fromHSV(hue,0.4,1)
        end
        local bg=new("Frame",row,{
            Size=UDim2.new(1,0,1,0),BackgroundColor3=bgColor,
            BackgroundTransparency=bgTransparency,BorderSizePixel=0,ZIndex=61
        })
        if style~="Minimal" then corner(bg,style=="Shadow" and 3 or 4) end
        if useShadow then
            local sh=new("Frame",row,{
                Size=UDim2.new(1,2,1,2),Position=UDim2.new(0,2,0,2),
                BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0.6,BorderSizePixel=0,ZIndex=60
            });corner(sh,4)
        end
        if useGrad then
            pcall(function()
                local g=Instance.new("UIGradient")
                g.Color=ColorSequence.new({
                    ColorSequenceKeypoint.new(0,T.bgS),
                    ColorSequenceKeypoint.new(1,T.ac)
                })
                g.Transparency=NumberSequence.new({
                    NumberSequenceKeypoint.new(0,0.35),
                    NumberSequenceKeypoint.new(1,0.75)
                })
                g.Parent=bg
            end)
        end
        -- accent bar on the right
        if style~="Minimal" then
            new("Frame",row,{
                Size=UDim2.new(0,2,1,style=="Shadow" and -2 or -4),
                Position=UDim2.new(1,-3,0,style=="Shadow" and 1 or 2),
                BackgroundColor3=barColor,BorderSizePixel=0,ZIndex=63
            })
        else
            new("Frame",row,{
                Size=UDim2.new(0,2,0,2),Position=UDim2.new(1,-4,0.5,-1),
                BackgroundColor3=barColor,BorderSizePixel=0,ZIndex=63
            })
        end
        new("TextLabel",row,{
            Size=UDim2.new(1,-10,1,0),Position=UDim2.new(0,2,0,0),
            BackgroundTransparency=1,Text=name,TextColor3=txtColor,
            Font=Enum.Font.GothamBold,TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Right,ZIndex=63
        })
        arrayListLabels[#arrayListLabels+1]=row
        y=y+rowH+2
    end
    arrayListFrame.Size=UDim2.new(0,maxW+12,0,math.max(y,4))
end
task.spawn(function()
    while sg and sg.Parent do
        if S.arrayListOn then refreshArrayList() end
        task.wait(0.3)
    end
end)

-- ===== Performance stats (top-left) =====
perfFrame=new("Frame",sg,{
    Size=UDim2.new(0,150,0,70),Position=UDim2.new(0,12,0,100),
    BackgroundColor3=T.bgS,BackgroundTransparency=0.2,BorderSizePixel=0,ZIndex=60,
    Visible=S.perfStatsOn==true
});corner(perfFrame,8);mkStroke(perfFrame,T.bd,1)
makeDraggable(perfFrame, perfFrame)
local perfTitle=new("TextLabel",perfFrame,{Size=UDim2.new(1,-8,0,16),Position=UDim2.new(0,6,0,4),BackgroundTransparency=1,
    Text="Perf",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
local perfFPS=new("TextLabel",perfFrame,{Size=UDim2.new(1,-8,0,14),Position=UDim2.new(0,6,0,22),BackgroundTransparency=1,
    Text="FPS: --",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
local perfPing=new("TextLabel",perfFrame,{Size=UDim2.new(1,-8,0,14),Position=UDim2.new(0,6,0,36),BackgroundTransparency=1,
    Text="Ping: --",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
local perfFT=new("TextLabel",perfFrame,{Size=UDim2.new(1,-8,0,14),Position=UDim2.new(0,6,0,50),BackgroundTransparency=1,
    Text="Frame: -- ms",TextColor3=T.tx,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
task.spawn(function()
    local frames,last=0,tick()
    RS.RenderStepped:Connect(function(dt)
        frames=frames+1
        if not S.perfStatsOn then return end
        local now=tick()
        if now-last>=0.5 then
            local fps=frames/(now-last)
            frames=0;last=now
            perfFPS.Text=string.format("FPS: %d",mfl(fps+0.5))
            perfFT.Text=string.format("Frame: %.1f ms",dt*1000)
            local ping=0
            pcall(function()
                ping=plr:GetNetworkPing()*1000
            end)
            perfPing.Text=string.format("Ping: %d ms",mfl(ping))
        end
    end)
end)

-- Changelog (shown after splash finishes)
local function showChangelogAfterLoad()
    local skip=false
    pcall(function()
        if isfile and isfile("CHUDHUB_changelog_v1.hide") then skip=true end
    end)
    local function selectMoveTab()
        if tabC["Move"] then
            local o=tabC["Move"]
            o.scroll.Visible=true; curTab="Move"
            if o.setIcoColor then o.setIcoColor(T.ac)
            elseif o.sIco:IsA("ImageLabel") then o.sIco.ImageColor3=T.ac
            else o.sIco.TextColor3=T.ac end
            o.sLbl.TextColor3=T.ac; o.sBg.BackgroundTransparency=0.55
            if sideIndicator then sideIndicator.Visible=true; sideIndicator.Position=UDim2.new(0,0,0,o.sY+8) end
            if contTitle then contTitle.Text=">_  move" end
        end
    end
    if skip then selectMoveTab(); return end
    local dontShow=false
    local pop=new("Frame",sg,{Size=UDim2.new(0,420,0,400),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),
        BackgroundColor3=T.bg,BackgroundTransparency=0.1,BorderSizePixel=0,ZIndex=70})
    corner(pop,8);mkStroke(pop,T.ac,1.5)
    new("TextLabel",pop,{Size=UDim2.new(1,0,0,28),Position=UDim2.new(0,0,0,10),BackgroundTransparency=1,Text="★ What's New · "..CH_VERSION,TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=16,TextXAlignment=Enum.TextXAlignment.Center})
    local content=new("ScrollingFrame",pop,{Size=UDim2.new(1,-24,1,-110),Position=UDim2.new(0,12,0,42),BackgroundTransparency=1,ScrollBarThickness=3,ScrollBarImageColor3=T.ac,CanvasSize=UDim2.new(0,0,0,0),BorderSizePixel=0})
    local cy=8
    local function addLine(txt,bold)
        new("TextLabel",content,{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,8,0,cy),BackgroundTransparency=1,Text=(bold and "• " or "  ")..txt,TextColor3=bold and T.ac or T.txM,Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
        cy=cy+20
    end
    addLine("ChudHub "..CH_VERSION,true)
    addLine("Kill log + hitlist + join alerts",true)
    addLine("Anti-RPG (health lock) + exploiter alerts",true)
    addLine("Vehicle stealer / RPG grab until found",true)
    addLine("Bhop snappy mode + speed/jump controls",true)
    addLine("Skeleton ESP improved · ESP transparency",true)
    addLine("Radar styles · streamer mode (WT boards)",true)
    addLine("Menu materials (Acrylic/Glass/Mica/Liquid)",true)
    addLine("Clock lock without flicker · soft character refresh",true)
    addLine("Streamproof reparent · focus mode / target HUD",true)
    addLine("Discord sidebar · themes · keybinds · pins",true)
    addLine("RPG patterns, arraylist, performance mode",true)
    content.CanvasSize=UDim2.new(0,0,0,cy+10)
    local checkRow=new("Frame",pop,{Size=UDim2.new(1,-40,0,22),Position=UDim2.new(0,20,1,-78),BackgroundTransparency=1})
    local box=new("Frame",checkRow,{Size=UDim2.new(0,16,0,16),Position=UDim2.new(0,0,0.5,-8),BackgroundColor3=T.bgT,BorderSizePixel=0})
    corner(box,4);mkStroke(box,T.bd)
    local mark=new("TextLabel",box,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=12})
    new("TextLabel",checkRow,{Size=UDim2.new(1,-24,1,0),Position=UDim2.new(0,24,0,0),BackgroundTransparency=1,Text="Don't show again",TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})
    local chkBtn=new("TextButton",checkRow,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""})
    chkBtn.MouseButton1Click:Connect(function()
        dontShow=not dontShow
        mark.Text=dontShow and "✓" or ""
        box.BackgroundColor3=dontShow and T.ac or T.bgT
        playSFX("click",0.15)
    end)
    local gotIt=new("TextButton",pop,{Size=UDim2.new(0.6,0,0,32),Position=UDim2.new(0.2,0,1,-42),BackgroundColor3=T.ac,Text="Got it — Let's go!",TextColor3=T.bg,Font=Enum.Font.GothamBold,TextSize=13,BorderSizePixel=0})
    corner(gotIt,CORNER)
    gotIt.MouseButton1Click:Connect(function()
        if dontShow then pcall(function() if writefile then writefile("CHUDHUB_changelog_v1.hide","1") end end) end
        pop:Destroy()
        for _,tname in ipairs(tabs) do if tabC[tname] then tabC[tname].scroll.Visible=false end end
        selectMoveTab()
    end)
end
S._showChangelog = showChangelogAfterLoad

UIS.InputBegan:Connect(function(inp,gp)
    if S.dead then return end
    if not gp and S.clickOn and inp.UserInputType==Enum.UserInputType.MouseButton1 then
        local wep=getRPG();if wep then S.mouseHeld=true
            local tp=mouse.Hit.Position;local hn=Vector3.new(0,1,0);local hp2=mouse.Target
            if hp2 and hp2:IsA("BasePart") then hn=(hp2.CFrame:VectorToWorldSpace(NORMS[mouse.TargetSurface] or Vector3.new(0,1,0))).Unit end
            local pts=getPP(tp,S.patMode,S.patSize,S.custTxt,hn,S.txtSize)
            if #pts>1 then
                for _,pt in ipairs(pts) do clickFire(pt,wep) end
            else
                task.spawn(function()
                    while S.mouseHeld and S.clickOn and not S.dead do
                        local now=tick();if now-S.lastClick>=S.fireRate then S.lastClick=now;clickFire(mouse.Hit.Position,wep) end
                        task.wait()
                    end
                end)
            end
        end
    end
    if gp then return end
    -- UI keybinds (always active)
    if S.keybinds.menuToggle and inp.KeyCode == S.keybinds.menuToggle then
        if S.minimized then
            S.minimized=false
            winWrap.Visible=true;shadow.Visible=true
            playSFX("open")
            showPopup("UI Restored","Menu is back",T.ok)
        else
            winWrap.Visible=not winWrap.Visible;shadow.Visible=winWrap.Visible
            playSFX(winWrap.Visible and "open" or "close")
            if not winWrap.Visible then
                showPopup("UI Hidden","Press [RightCtrl] to show",T.wn)
            end
        end
    elseif S.keybinds.minimize and inp.KeyCode == S.keybinds.minimize then
        if not S.minimized then
            winWrap.Visible=false;shadow.Visible=false
            S.minimized=true
            playSFX("close")
            showPopup("UI Hidden","Press [Insert] to restore",T.wn)
        else
            S.minimized=false
            winWrap.Visible=true;shadow.Visible=true
            playSFX("open")
            showPopup("UI Restored","Menu is back",T.ok)
        end
    else
        -- Dynamic feature keybinds (only fire if user has bound them)
        for bindName,key in pairs(S.keybinds) do
            if key and typeof(key)=="EnumItem" and key~=S.keybinds.menuToggle and key~=S.keybinds.minimize and inp.KeyCode==key then
                -- find matching toggle in featureReg
                local fired=false
                for _,f in ipairs(featureReg) do
                    if f.bindKey==bindName and f.set then
                        local cur=f.get and f.get() or false
                        f.set(not cur)
                        fired=true
                        break
                    end
                end
                -- special cases without bindKey wiring
                if not fired then
                    if bindName=="spam" then
                        local nx=not S.spamOn
                        if nx and not S.hasShot then showNotif()
                        else S.spamOn=nx;if not S.spamOn then S.fireGen=S.fireGen+1 end; if mainTog then mainTog.u(S.spamOn) end end
                    elseif bindName=="fly" and flyTog then flyTog.u(not S.flying)
                    elseif bindName=="esp" then S.espOn=not S.espOn; if espTog then espTog.u(S.espOn) end
                    end
                end
                break
            end
        end
    end
    local kn=inp.KeyCode.Name;if kn and S.keys[kn]~=nil then S.keys[kn]=true end
    if inp.KeyCode==Enum.KeyCode.LeftControl then S.keys.Ctrl=true end
    -- PasteWare desync toggle key (V)
    if not gp and inp.KeyCode==Enum.KeyCode.V and S.desyncEnabled then
        S.desync = not S.desync
        showPopup("Desync", S.desync and "ACTIVE" or "off", S.desync and T.ok or T.txM)
    end
end)
UIS.InputEnded:Connect(function(inp)
    if S.dead then return end
    if inp.UserInputType==Enum.UserInputType.MouseButton1 then S.mouseHeld=false end
    local kn=inp.KeyCode.Name;if kn and S.keys[kn]~=nil then S.keys[kn]=false end
    if inp.KeyCode==Enum.KeyCode.LeftControl then S.keys.Ctrl=false end
end)

local function runSplash()
    local dim=new("Frame",sg,{
        Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.new(0,0,0),
        BackgroundTransparency=0.35,BorderSizePixel=0,ZIndex=49
    })
    local splash=new("Frame",sg,{
        Size=UDim2.new(0,380,0,460),
        AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.5,0),
        BackgroundColor3=T.bg,BackgroundTransparency=0.08,
        BorderSizePixel=0,ZIndex=50
    });corner(splash,14)
    local spStroke=new("UIStroke",splash,{Color=T.ac,Thickness=1.2,Transparency=0.35})
    local spGrad=Instance.new("UIGradient")
    spGrad.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,T.bg),
        ColorSequenceKeypoint.new(0.55,T.bgS),
        ColorSequenceKeypoint.new(1,Color3.new(math.min(1,T.ac.R*0.25+T.bg.R*0.75),math.min(1,T.ac.G*0.25+T.bg.G*0.75),math.min(1,T.ac.B*0.25+T.bg.B*0.75)))
    })
    spGrad.Rotation=140
    spGrad.Parent=splash

    local function mk(cls,par,props)
        local o=Instance.new(cls)
        if props then for k,v in pairs(props) do o[k]=v end end
        if par then o.Parent=par end
        if o:IsA("TextLabel") then o.TextTransparency=1 end
        if o:IsA("Frame") or o:IsA("ImageLabel") then o.BackgroundTransparency=1 end
        return o
    end

    -- ===== Logo: purple→black radial + 3D black hole with rings =====
    local starHost=mk("Frame",splash,{
        Size=UDim2.new(0,140,0,140),
        AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.30,0),
        BackgroundTransparency=1,BorderSizePixel=0,ZIndex=51
    })
    local logoBadge=mk("Frame",starHost,{
        Size=UDim2.new(1,0,1,0),
        BackgroundColor3=Color3.fromRGB(6,4,12),
        BorderSizePixel=0,ZIndex=50
    })
    logoBadge.BackgroundTransparency=1
    logoBadge.ClipsDescendants=true
    corner(logoBadge,30)
    local badgeStroke=new("UIStroke",logoBadge,{Color=T.ac,Thickness=1.5,Transparency=1})

    local glowRing
    local radialLayers={}
    do
        local base=mk("Frame",logoBadge,{
            Size=UDim2.new(0.96,0,0.96,0),
            Position=UDim2.new(0.5,0,0.5,0),
            AnchorPoint=Vector2.new(0.5,0.5),
            BackgroundColor3=Color3.fromRGB(0,0,0),
            BorderSizePixel=0,ZIndex=49
        })
        base.BackgroundTransparency=1
        base:SetAttribute("TargetT", 0.15)
        base:SetAttribute("GradK", 0)
        corner(base,999)
        radialLayers[#radialLayers+1]=base

        local N=28
        for i=1,N do
            local k=i/N
            local size=0.96 * (1 - (i-1)/N * 0.88)
            local sm=k*k*(3-2*k)
            local col=Color3.new(
                math.min(1, T.ac.R * sm * 1.15),
                math.min(1, T.ac.G * sm * 1.05),
                math.min(1, T.ac.B * sm * 1.25)
            )
            local alpha=math.clamp(0.92 - sm*0.78, 0.08, 0.94)
            local disc=mk("Frame",logoBadge,{
                Size=UDim2.new(size,0,size,0),
                Position=UDim2.new(0.5,0,0.5,0),
                AnchorPoint=Vector2.new(0.5,0.5),
                BackgroundColor3=col,
                BorderSizePixel=0,ZIndex=50
            })
            disc.BackgroundTransparency=1
            disc:SetAttribute("TargetT", alpha)
            disc:SetAttribute("GradK", k)
            corner(disc,999)
            radialLayers[#radialLayers+1]=disc
            if i==math.floor(N*0.4) then glowRing=disc end
        end
        if not glowRing then glowRing=radialLayers[2] end
        local pin=mk("Frame",logoBadge,{
            Size=UDim2.new(0.16,0,0.16,0),
            Position=UDim2.new(0.5,0,0.5,0),
            AnchorPoint=Vector2.new(0.5,0.5),
            BackgroundColor3=Color3.fromRGB(255,245,255),
            BorderSizePixel=0,ZIndex=51
        })
        pin.BackgroundTransparency=1
        pin:SetAttribute("TargetT", 0.4)
        pin:SetAttribute("GradK", 1.2)
        corner(pin,999)
        radialLayers[#radialLayers+1]=pin
    end

    -- 3D black hole viewport (segmented torus rings + flowing glow)
    -- 3D black hole viewport (lightweight segmented rings)
    local vp=Instance.new("ViewportFrame")
    vp.Size=UDim2.new(0.92,0,0.92,0)
    vp.Position=UDim2.new(0.5,0,0.5,0)
    vp.AnchorPoint=Vector2.new(0.5,0.5)
    vp.BackgroundTransparency=1
    vp.BorderSizePixel=0
    vp.ZIndex=53
    vp.Ambient=Color3.fromRGB(5,3,12)
    vp.LightColor=Color3.fromRGB(255,235,255)
    vp.LightDirection=Vector3.new(0.2,-0.9,-0.3)
    vp.Parent=logoBadge
    local vcam=Instance.new("Camera")
    vcam.FieldOfView=26
    vcam.Parent=vp
    vp.CurrentCamera=vcam
    local world=Instance.new("WorldModel")
    world.Parent=vp
    local bhModel=Instance.new("Model")
    bhModel.Name="SplashBlackHole"
    bhModel.Parent=world

    local horizon=Instance.new("Part")
    horizon.Anchored=true;horizon.CanCollide=false
    horizon.Material=Enum.Material.SmoothPlastic
    horizon.Color=Color3.fromRGB(0,0,0)
    horizon.Size=Vector3.new(0.9,0.9,0.9)
    horizon.Shape=Enum.PartType.Ball
    horizon.Parent=bhModel
    local photon=Instance.new("Part")
    photon.Anchored=true;photon.CanCollide=false
    photon.Material=Enum.Material.Neon
    photon.Color=T.ac
    photon.Transparency=0.4
    photon.Size=Vector3.new(1.15,1.15,1.15)
    photon.Shape=Enum.PartType.Ball
    photon.Parent=bhModel
    local photonHaze=Instance.new("Part")
    photonHaze.Anchored=true;photonHaze.CanCollide=false
    photonHaze.Material=Enum.Material.Neon
    photonHaze.Color=T.ac
    photonHaze.Transparency=0.78
    photonHaze.Size=Vector3.new(1.4,1.4,1.4)
    photonHaze.Shape=Enum.PartType.Ball
    photonHaze.Parent=bhModel

    local function buildRingModel(radius, tube, segments, col, baseTrans, yOff)
        local mdl=Instance.new("Model")
        mdl.Name="Ring"
        local anchor=Instance.new("Part")
        anchor.Name="Anchor"
        anchor.Anchored=true;anchor.CanCollide=false
        anchor.Transparency=1
        anchor.Size=Vector3.new(0.05,0.05,0.05)
        anchor.CFrame=CFrame.new(0, yOff, 0)
        anchor.Parent=mdl
        for i=1,segments do
            local a=(i/segments)*math.pi*2
            local x=math.cos(a)*radius
            local z=math.sin(a)*radius
            local p=Instance.new("Part")
            p.Anchored=true;p.CanCollide=false
            p.Material=Enum.Material.Neon
            p.Color=col
            p.Transparency=baseTrans
            p.Size=Vector3.new(tube*1.7, tube*1.7, tube*2.4)
            p.CFrame=CFrame.new(x, yOff, z)*CFrame.Angles(0, -a+math.pi/2, 0.14)
            p.Parent=mdl
            local m=Instance.new("SpecialMesh")
            m.MeshType=Enum.MeshType.Sphere
            m.Scale=Vector3.new(1,1,1.35)
            m.Parent=p
            if i%2==0 then
                local g=Instance.new("Part")
                g.Anchored=true;g.CanCollide=false
                g.Material=Enum.Material.Neon
                g.Color=col
                g.Transparency=math.min(0.9, baseTrans+0.35)
                g.Size=Vector3.new(tube*2.8, tube*2.8, tube*3.0)
                g.CFrame=p.CFrame
                g.Parent=mdl
                local gm=Instance.new("SpecialMesh")
                gm.MeshType=Enum.MeshType.Sphere
                gm.Scale=Vector3.new(1.15,1.15,1.2)
                gm.Parent=g
            end
        end
        mdl.PrimaryPart=anchor
        mdl.Parent=bhModel
        return mdl
    end

    local ringModels={
        {m=buildRingModel(1.2, 0.085, 20, T.ac, 0.22, 0), speed=1.7},
        {m=buildRingModel(1.65, 0.08, 22, T.ac, 0.38, 0.02), speed=1.1},
        {m=buildRingModel(2.15, 0.065, 24, T.ac, 0.55, -0.015), speed=0.7},
        {m=buildRingModel(2.65, 0.05, 26, T.ac, 0.72, 0.02), speed=0.4},
    }

    -- 3 hot spots only
    local hotSpots={}
    for i=1,3 do
        local hs=Instance.new("Part")
        hs.Anchored=true;hs.CanCollide=false
        hs.Material=Enum.Material.Neon
        hs.Color=Color3.fromRGB(255,255,255)
        hs.Transparency=0.2
        hs.Size=Vector3.new(0.14,0.14,0.22)
        hs.Shape=Enum.PartType.Ball
        hs.Parent=bhModel
        hotSpots[#hotSpots+1]={p=hs, phase=(i/3)*math.pi*2, radius=1.2, speed=2.2+i*0.2}
    end

    bhModel.PrimaryPart=horizon
    vcam.CFrame=CFrame.new(Vector3.new(0.2, 1.05, 5.0), Vector3.new(0,0,0))

    local starAng=0
    local colorAcc=0
    local starConn=RS.RenderStepped:Connect(function(dt)
        if not bhModel or not bhModel.Parent then return end
        starAng=starAng+dt
        colorAcc=colorAcc+dt

        pcall(function()
            local base=CFrame.Angles(math.rad(40), starAng*0.25, math.rad(8))
            bhModel:PivotTo(base)
            for _,r in ipairs(ringModels) do
                if r.m and r.m.PrimaryPart then
                    r.m:PivotTo(base * CFrame.Angles(0, starAng*r.speed, 0))
                end
            end
            for _,hs in ipairs(hotSpots) do
                local a=hs.phase + starAng*hs.speed
                hs.p.CFrame=base * CFrame.new(math.cos(a)*hs.radius, 0.02, math.sin(a)*hs.radius)
            end
        end)

        -- theme colors ~4fps
        if colorAcc>=0.25 then
            colorAcc=0
            local col=T.ac
            if photon and photon.Parent then photon.Color=col end
            if photonHaze and photonHaze.Parent then photonHaze.Color=col end
            for _,r in ipairs(ringModels) do
                if r.m then
                    for _,p in ipairs(r.m:GetChildren()) do
                        if p:IsA("BasePart") and p.Transparency<0.95 then p.Color=col end
                    end
                end
            end
            badgeStroke.Color=col
            for li,disc in ipairs(radialLayers) do
                if disc and disc.Parent then
                    local k=disc:GetAttribute("GradK") or 0
                    if k<=0 then
                        disc.BackgroundColor3=Color3.fromRGB(0,0,0)
                    elseif k>=1.1 then
                        disc.BackgroundColor3=Color3.fromRGB(255,245,255)
                    else
                        local sm=k*k*(3-2*k)
                        disc.BackgroundColor3=Color3.new(
                            math.min(1, col.R*sm*1.15),
                            math.min(1, col.G*sm*1.05),
                            math.min(1, col.B*sm*1.25)
                        )
                    end
                end
            end
        end
        spGrad.Rotation=140+starAng*4
        spStroke.Color=T.ac
    end)

    local titleRow=mk("Frame",splash,{
        Size=UDim2.new(0,340,0,50),
        AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.55,0),
        BackgroundTransparency=1,BorderSizePixel=0,ZIndex=51
    })
    local chud=mk("TextLabel",titleRow,{
        Size=UDim2.new(.5,0,1,0),Position=UDim2.new(0,0,0,0),
        BackgroundTransparency=1,Text="CHUD",
        TextColor3=Color3.fromRGB(245,246,252),Font=Enum.Font.GothamBold,
        TextSize=40,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=51
    })
    local hub=mk("TextLabel",titleRow,{
        Size=UDim2.new(.5,0,1,0),Position=UDim2.new(.5,0,0,0),
        BackgroundTransparency=1,Text="HUB",
        TextColor3=T.ac,Font=Enum.Font.GothamBold,
        TextSize=40,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=51
    })
    local pillBg=mk("Frame",splash,{
        Size=UDim2.new(0,56,0,22),
        AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.63,0),
        BackgroundColor3=T.bgT,BackgroundTransparency=1,
        BorderSizePixel=0,ZIndex=51
    });corner(pillBg,11)
    local pillStroke=new("UIStroke",pillBg,{Color=T.ac,Thickness=0.8,Transparency=1})
    local pillLbl=mk("TextLabel",pillBg,{
        Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=CH_VERSION,
        TextColor3=T.ac,Font=Enum.Font.GothamBold,TextSize=11,ZIndex=52
    })
    local sepLine=mk("Frame",splash,{
        Size=UDim2.new(0,280,0,1),
        AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.68,0),
        BackgroundColor3=T.ac,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=51
    })
    local madeBy=mk("TextLabel",splash,{
        Size=UDim2.new(0,300,0,14),
        AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(.5,0,.71,0),
        BackgroundTransparency=1,Text="MADE BY",
        TextColor3=T.txD,Font=Enum.Font.GothamBold,TextSize=9,ZIndex=51
    })
    local authors=mk("TextLabel",splash,{
        Size=UDim2.new(0,300,0,20),
        AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(.5,0,.74,0),
        BackgroundTransparency=1,Text="Proxy Phalanxs",
        TextColor3=T.txM,Font=Enum.Font.Gotham,TextSize=13,ZIndex=51
    })
    local barTrack=mk("Frame",splash,{
        Size=UDim2.new(0,300,0,4),
        AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(.5,0,.82,0),
        BackgroundColor3=T.off,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=51
    });corner(barTrack,2)
    local barFill=mk("Frame",barTrack,{
        Size=UDim2.new(0,0,1,0),
        BackgroundColor3=T.ac,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=52
    });corner(barFill,2)
    local statusLbl=mk("TextLabel",splash,{
        Size=UDim2.new(0,320,0,16),
        AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(.5,0,.865,0),
        BackgroundTransparency=1,Text="Initialising...",
        TextColor3=T.txD,Font=Enum.Font.Gotham,TextSize=11,ZIndex=51
    })

    local allFrames={titleRow,pillBg,sepLine,barTrack,logoBadge}
    local allText={chud,hub,pillLbl,madeBy,authors,statusLbl}

    local function fadeIn(dur)
        local ti=TweenInfo.new(dur,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
        TwS:Create(splash,ti,{BackgroundTransparency=0.08}):Play()
        TwS:Create(dim,ti,{BackgroundTransparency=0.35}):Play()
        for _,f in ipairs(allFrames) do
            local tr=(f==barTrack and 0) or (f==pillBg and 0) or (f==logoBadge and 0.08) or 1
            TwS:Create(f,ti,{BackgroundTransparency=tr}):Play()
        end
        for _,disc in ipairs(radialLayers) do
            if disc and disc.Parent then
                local targetT=disc:GetAttribute("TargetT") or 0.7
                disc.BackgroundTransparency=1
                TwS:Create(disc,ti,{BackgroundTransparency=targetT}):Play()
            end
        end
        if badgeStroke then TwS:Create(badgeStroke,ti,{Transparency=0.5}):Play() end
        for _,t in ipairs(allText) do TwS:Create(t,ti,{TextTransparency=0}):Play() end
        TwS:Create(pillStroke,ti,{Transparency=0.2}):Play()
        TwS:Create(barFill,ti,{BackgroundTransparency=0}):Play()
        TwS:Create(spStroke,ti,{Transparency=0.25}):Play()
    end
    local function fadeOut(dur)
        local ti=TweenInfo.new(dur,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
        TwS:Create(splash,TweenInfo.new(dur,Enum.EasingStyle.Back,Enum.EasingDirection.In),
            {BackgroundTransparency=1,Size=UDim2.new(0,320,0,400)}):Play()
        TwS:Create(dim,ti,{BackgroundTransparency=1}):Play()
        for _,f in ipairs(allFrames) do pcall(function() TwS:Create(f,ti,{BackgroundTransparency=1}):Play() end) end
        for _,t in ipairs(allText) do TwS:Create(t,ti,{TextTransparency=1}):Play() end
        TwS:Create(barFill,ti,{BackgroundTransparency=1}):Play()
        TwS:Create(pillStroke,ti,{Transparency=1}):Play()
        TwS:Create(spStroke,ti,{Transparency=1}):Play()
        pcall(function() TwS:Create(vp,ti,{ImageTransparency=1}):Play() end)
    end

    task.spawn(function()
        fadeIn(0.55)
        task.wait(0.4)
        local steps={
            {txt="Connecting...", pct=0.18, wait=0.4},
            {txt="Loading modules...", pct=0.42, wait=0.5},
            {txt="Initialising ESP...", pct=0.68, wait=0.45},
            {txt="Applying theme...", pct=0.88, wait=0.4},
            {txt="Ready", pct=1.00, wait=0.35},
        }
        for _,step in ipairs(steps) do
            statusLbl.Text=step.txt
            TwS:Create(barFill,TweenInfo.new(step.wait-0.05,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size=UDim2.new(step.pct,0,1,0)}):Play()
            task.wait(step.wait)
        end
        task.wait(0.15)
        fadeOut(0.4)
        task.wait(0.45)
        if starConn then starConn:Disconnect() end
        splash:Destroy()
        dim:Destroy()
        win.Visible=true
        win.Size=UDim2.new(0,WW*0.88,0,WH*0.88)
        win.BackgroundTransparency=0.65
        TwS:Create(win,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
            {Size=UDim2.new(0,WW,0,WH),BackgroundTransparency=0.18}):Play()
        task.delay(0.55, function()
            if type(S._showChangelog)=="function" then pcall(S._showChangelog) end
        end)
    end)
end

runSplash()

do
    local ff=RepS:FindFirstChild("Freefall");if ff then ff:Destroy() end
    local ae=RepS:FindFirstChild("ACS_Engine");if ae then pcall(function() local evs=ae:FindFirstChild("Events");if evs then local fd=evs:FindFirstChild("FDMG");if fd then fd:Destroy() end end end) end
end

S.gravV=workspace.Gravity
apTh(TL[themeIdx] or TL[1]);updCards();initSys()
if S.performanceMode then applyPerformance(true) end
if S.rainbowOn then applyRainbow(true) end

end -- Closes function _ui()

_ui()
