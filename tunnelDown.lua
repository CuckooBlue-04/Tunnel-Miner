-- Vars --

MaxY = 15 -- Y Level --
torchSpacing = 5 -- Blocks Between torches --
torchSlot = 16 -- Slot for torches --
ladderSlot = 15 -- Slot for ladders --
fillSlot = 14 -- Slot for fill block --

----------

spacing = 0

function msg()
    laddersLeft = turtle.getItemCount(ladderSlot)
    torchesLeft = turtle.getItemCount(torchSlot)
    fillBlocksLeft = turtle.getItemCount(fillSlot)
    term.clear()
    print("--------------------")
    print("Current Y cord:", y)
    print("Y cord goal:", MaxY)
    print("Ladders Remaining:", laddersLeft)
    print("Torches Remaining:", torchesLeft)
    print("Fill Blocks Remaining:", fillBlocksLeft)
    print("Task:", action)
    print("--------------------")
end

function digDown()
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.down()
    action = "Mining"
    msg()
    spacing = spacing + 1
end

function digForward()
    if turtle.detect() then
        turtle.dig()
    end
    msg()
    turtle.attack()
    turtle.forward()
end

function fillBlock()
    if not turtle.detect() then
        turtle.select(fillSlot)
        turtle.place()
        msg()
    end
end

while true do
    x,y,z = gps.locate()
    if y == MaxY then
        action = "Finished"
        break
    end
    digDown()
    digForward()
    turtle.turnRight()
    digForward()
    fillBlock()
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    turtle.turnRight()
    digForward()
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    digForward()
    Fspacing = torchSpacing + 1
    if spacing == Fspacing then
        turtle.dig()
        turtle.select(torchSlot)
        turtle.place()
        spacing = 0
        msg()
    end
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    turtle.turnRight()
    digForward()
    turtle.turnLeft()
    turtle.dig()
    turtle.select(ladderSlot)
    turtle.place()
    turtle.turnRight()
    digForward()
    fillBlock()
    turtle.turnRight()
    digForward()
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    digForward()
    fillBlock()
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    turtle.turnRight()
    digForward()
    turtle.turnLeft()
    fillBlock()
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
end
    


