-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Gillian Gonzales
-- Created on: May 07 2018
-- 
-- This file animates a charact using a spritesheet
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsNinjaIdle =
{
    width = 232,
    height = 439,
    numFrames = 10
}
local sheetIdleNinja = graphics.newImageSheet( "./assets/spritesheets/ninjaIdle.png", sheetOptionsNinjaIdle )

local sheetOptionsNinjaDead =
{
    width = 482,
    height = 498,
    numFrames = 10
}

local sheetDeadNinja = graphics.newImageSheet( "./assets/spritesheets/ninjaDead.png", sheetOptionsNinjaDead )

local sheetOptionsRobotIdle =
{
    width = 567,
    height = 556,
    numFrames = 10
}

local sheetIdleRobot = graphics.newImageSheet( "./assets/spritesheets/robotIdle.png", sheetOptionsRobotIdle )

local sheetOptionsRobotDead =
{
    width = 562,
    height = 519,
    numFrames = 10
}

local sheetDeadRobot = graphics.newImageSheet( "./assets/spritesheets/robotDead.png", sheetOptionsRobotDead )

-- sequences table
local sequence_dataNinja = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja
    },
    {
     	name = "dead",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 1,
        sheet = sheetDeadNinja
    }
}

local sequence_dataRobot = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleRobot
    },
    {
     	name = "dead",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 1,
        sheet = sheetDeadRobot
    }
}


local ninja = display.newSprite( sheetIdleNinja, sequence_dataNinja )
ninja.x = centerX - 600
ninja.y = centerY

local Robot = display.newSprite( sheetIdleRobot, sequence_dataRobot )
Robot.x = centerX + 600
Robot.y = centerY


ninja:play()
Robot:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheetNinja()
    ninja:setSequence( "dead" )
    ninja:play()
    print("dead ninja")
end

local function swapSheetRobot()
    Robot:setSequence( "dead" )
    Robot:play()
    print("dead robot")
end

timer.performWithDelay( 2000, swapSheetNinja )
timer.performWithDelay( 2000, swapSheetRobot )