local Utils = {}

function Utils.Raycast(Origin, Vector, Params --[[optional]])
    
    if Params then
        
        return workspace:Raycast(Origin, Vector, Params)

    else

        return workspace:Raycast(Origin, Vector)
        

    end

end

function Utils.FindDistance(Part1, Part2)
    
    return (Part1.Position - Part2.Position).Magnitude

end

return Utils