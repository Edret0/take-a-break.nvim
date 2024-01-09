---@class TakeABreak


local TakeABreak = {}



TakeABreak.messages = {
    [1]="Take a break!",
    [2]="You've been working for a while!",
    [3]="You should take a break!",
    [4]="Time to stretch those legs!",
    [5]="You've been working hard!",
    [6]="Time to get some fresh air!",
    [7]="Lets go get a cup of coffee!",
}

function TakeABreak:showMessage()
    local message = self.messages[math.random(7)]
    local timer = vim.uv.new_timer()
    -- tell user to go on break every 30 minutes
    BREAK_TIME = 60000 * 30
    timer:start(10000,0,vim.schedule_wrap(function()
        local fidget = require("fidget")
        fidget.notify(message,2)
        TakeABreak:showMessage()
    end))
    return timer
end



function TakeABreak.setup()
    TakeABreak:showMessage()
end
return TakeABreak

