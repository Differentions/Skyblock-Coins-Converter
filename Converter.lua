local line = ("------------------------------------------")

print(line)
print("|Welcome to the Skyblock Coins Converter!|")
print(line)
print("|Please enter Booster Cookie price:      |")

local boosterCookie = io.read()

print(line)
print("|Please input coins to convert:          |")

local conversionCost = io.read()

print(line)

function desimplifyNumber(num)
    if num:match("k") then
        num = string.gsub(num, "k", "")
        num = tonumber(num)
        num = num * 1000
        return num
    elseif num:match("m") then
        num = string.gsub(num, "m", "")
        num = tonumber(num)
        num = num * 1000000 
        return num
    elseif num:match("b") then
        num = string.gsub(num, "b", "")
        num = tonumber(num)
        num = num * 1000000000
        return num
    else
        return num
    end
end

boosterCookie = desimplifyNumber(boosterCookie)
conversionCost = desimplifyNumber(conversionCost)

local CoinsPerGem = boosterCookie/365   

local gems = CoinsPerGem * 675 

local usdPerGem = 5.99/675


function math.sign(v)
	return (v >= 0 and 1) or -1
end
function math.round(v, bracket)
	bracket = bracket or 1
	return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end

function roundDecimalToUSD(decimal, place)
    if place and place > 0 then
        local mult = 10^place 
        return math.floor(decimal * mult + 0.5) / mult
    end
    return math.floor(decimal + 0.5)

end

function convert(coinsToUSD)
    coinsToUSD = conversionCost / CoinsPerGem 
    coinsToUSD = coinsToUSD * usdPerGem
    coinsToUSD = (math.round(coinsToUSD, 0.01))
    return coinsToUSD
end

print("$".. convert(conversionCost))




