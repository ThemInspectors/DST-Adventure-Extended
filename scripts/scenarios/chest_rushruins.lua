--[=====[

 Copyright (C) 2019 ThemInspectors

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.

--]=====]

chestfunctions = require("scenarios/chestfunctions")

local function OnCreate(inst, scenariorunner)

    local items =
    {
        {
            item = "blueprint_minerhat",
            count = 1,
            chance = 0.33
        },
        {
            item = "blueprint_lantern",
            count = 1,
            chance = 0.33
        },
        {
            item = "pickaxe",
            count = 1,
            chance = 0.33
        },
        {
            item = "twigs",
            count = 12,
            chance = 1
        },
        {
            item = "cutgrass",
            count = 12,
            chance = 1
        },
        {
            item = "flint",
            count = 2,
            chance = 1
        },
        {
            item = "goldnugget",
            count = 2,
            chance = 1
        },
    }

    chestfunctions.AddChestItems(inst, items)
end

return
{
    OnCreate = OnCreate
}
