local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Sounds = {

    ["ExampleSound"] = "rbxassetid://0000"

}

function Sounds.PlaySoundClient(Client, SoundID)
    
    local Success, Fail = pcall(function()
        
        if Sounds[SoundID] then
        
            local _ = Instance.new('Sound')
            _.SoundId = Sounds[SoundID]
            _.Name = SoundID
            ReplicatedStorage.Events.SoundPlayer:FireClient(Client, _)

        else
    
            error('Invalid Sound ID')
    
        end

    end)

    if not Success then
        
        warn('Sounds Exception: '..Fail..'!')

    end
end

return Sounds