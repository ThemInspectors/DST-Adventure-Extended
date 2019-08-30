local require = GLOBAL.require

local Layouts = GLOBAL.require("map/layouts").Layouts
local StaticLayout = GLOBAL.require("map/static_layout")

Layouts["RuinsRushStart"] = StaticLayout.Get("map/static_layouts/ruinsrushstart")

AddRoom("RuinsRushForestStartNode", {
  					colour={r=.66,g=.66,b=.66,a=.50},
  					value = GROUND.ROCKY,
  					tags = {"ExitPiece", "Chester_Eyebone"},
  					contents =  {
  					                distributepercent = .1,
  					                distributeprefabs=
  					                {
  										flint=0.5,
  										rock1=1,
  										rock2=1,
  										rock_ice=0.4,
  										tallbirdnest=0.008,
  										grassgekko = 0.3,
  					                },
                            countprefabs = {cave_entrance = 1},
  					            }
})

AddTask("TBlank", {
  locks=LOCKS.NONE,
  keys_given=KEYS.NONE,
  --entrance_room = "ForceDisconnectedRoom",
  room_choices={
    ["Blank"] = 1,
  },
  room_bg=GROUND.GRASS,
  background_room="Blank",
  colour={r=1,g=1,b=0.5,a=1}
})

AddStartLocation("ruinsrushstart", {
  name = "Rush Start",
  location = "forest",
  start_setpeice = "RuinsRushStart",
  start_node = "RuinsRushForestStartNode",
})


--[==[local function RuinsRushCaves(tasksetdata)
    tasksetdata.numoptionaltasks = 3
    tasksetdata.tasks = {
      "CaveExitTask1",
      "LichenLand",
      "Residential",
      "Military",
      "Sacred",
      "TheLabyrinth",
      "SacredAltar",
    }
    tasksetdata.optionaltasks = {
      "MoreAltars",
      "CaveJungle",
      "SacredDanger",
      "MilitaryPits",
      "MuddySacred",
      "Residential2",
      "Residential3",
    }
    tasksetdata.set_pieces = {
    }
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0

    for _,set in pairs(GLOBAL.TUNING.TELEPORTATOMOD.teleportato_layouts["cave"]) do
        table.insert(tasksetdata.required_setpieces,set)
    end

    tasksetdata.random_set_pieces = {}
    tasksetdata.add_teleportato = false -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = GLOBAL.ArrayUnion(required_prefabs,{"teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    tasksetdata.overrides={
      start_location = "caves",
      season_start = "default",
      world_size = "default",
      layout_mode = "RestrictNodesByKey",
      wormhole_prefab = "tentacle_pillar",
      roads = "never",
      has_ocean = false,
      keep_disconnected_tiles=false,
    }
    return tasksetdata
end
--]==]

local function RuinsRushCave(tasksetdata)
            tasksetdata.tasks = {
              "CaveExitTask1",
              "LichenLand",
              "Residential",
              "Military",
              "Sacred",
              "TheLabyrinth",
              "SacredAltar",
            }
            tasksetdata.numoptionaltasks = 3
            tasksetdata.optionaltasks = {
              "MoreAltars",
              "CaveJungle",
              "SacredDanger",
              "MilitaryPits",
              "MuddySacred",
              "Residential2",
              "Residential3",
            }
            tasksetdata.required_setpieces = {
            }
            tasksetdata.add_teleportato = true

            tasksetdata.set_pieces = {}
            tasksetdata.valid_start_tasks = {"CaveExitTask1"}
            tasksetdata.overrides={
                wormhole_prefab = "tentacle_pillar",
                layout_mode = "RestrictNodesByKeys",
                roads = "never"
            }
    return tasksetdata
end

local function RuinsRushForest(tasksetdata)
    tasksetdata.numoptionaltasks = 0
    tasksetdata.tasks = {"Make a Beehat"}
    tasksetdata.optionaltasks = {}
    tasksetdata.set_pieces = {
    }
    tasksetdata.required_setpieces = {
                  "TeleportatoBaseLayout"
    }
    tasksetdata.numrandom_set_pieces = 0
    --[==[
    for _,set in pairs(GLOBAL.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.required_setpieces,set)
    end
    --]==]
    tasksetdata.random_set_pieces = {}
    tasksetdata.add_teleportato = false -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = GLOBAL.ArrayUnion(required_prefabs,{"teleportato_base"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    tasksetdata.overrides={
        wormhole_prefab = "wormhole",
        layout_mode = "LinkNodesByKeys",
        start_location = "ruinsrushstart",
        roads = "never",
        world_size = "small",
        keep_disconnected_tiles = false,
        no_joining_islands = true,
        has_ocean = false,
    }
    return tasksetdata
end


if GLOBAL.TUNING.TELEPORTATOMOD then
    if not GLOBAL.TUNING.TELEPORTATOMOD.WORLDS then
        GLOBAL.TUNING.TELEPORTATOMOD.WORLDS = {}
    end
    table.insert(GLOBAL.TUNING.TELEPORTATOMOD.WORLDS, {name="The Ancients", taskdatafunctions={forest=RuinsRushForest, cave=RuinsRushCave}, defaultpositions={2,6},positions="2,6"})
end
