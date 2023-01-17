local DatastoreService = game:GetService('DataStoreService')

local DatastoreModule = {}

function DatastoreModule:SaveData(Player, Data --[[table]])
    
    local Success, Fail = pcall(function()
        
        local PlayerDatastore = DatastoreService:GetDataStore(Player.UserId.."-DB")

        if Data.Key and Data.Value then
            
            PlayerDatastore:SetAsync(Data.Key, Data.Value)

        else

            error('Key or Value is missing')

        end

    end)

    if not Success then
        
        warn('DatastoreModule Exception: '..Fail) --

    end

end

function DatastoreModule:LoadData(Player, Data --[[table]])
    
    local Success, Fail = pcall(function()
        
        local PlayerDatastore = DatastoreService:GetDataStore(Player.UserId.."-DB")

        if Data.Key then
            
            return PlayerDatastore:GetAsync(Data.Key)

        else

            error('Key is missing')

        end

    end)

    if not Success then
        
        warn('DatastoreModule Exception: '..Fail)

    end

end


return DatastoreModule