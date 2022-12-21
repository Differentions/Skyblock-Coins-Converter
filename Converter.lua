local Repeat = true
    local line = ("------------------------------------------")
print(line)
print("|Welcome to the Skyblock Coins Converter!|")
print(line)

while Repeat do
        print("|         Which mode do you want?        |")

        print("|1: Coins to USD                         |")
        print("|2: USD to Coins                         |")

        local modeChoice = io.read("*number") 

        if modeChoice == 1 then
            local buffer = io.read()
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

            function convertCoins(coinsToUSD)
                coinsToUSD = conversionCost / CoinsPerGem 
                coinsToUSD = coinsToUSD * usdPerGem
                coinsToUSD = (math.round(coinsToUSD, 0.01))
                return coinsToUSD
            end
            function formatValue(n)
                local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
            return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
        end
            local space = ""

            if convertCoins(conversionCost) >= 10000 then 
                space = "                              |"
            elseif convertCoins(conversionCost) >= 1000 then
                space = "                               |"
            elseif convertCoins(conversionCost) >= 100 then
                space = "                                 |"
            elseif convertCoins(conversionCost) >= 10 then
                space = "                                  |"
            elseif convertCoins(conversionCost) >= 1 then
                space = "                                   |"
            elseif convertCoins(conversionCost) >= 0 then
                space = "                                   |"
            end

            print("|$".. formatValue(convertCoins(conversionCost)) .. space)
        elseif modeChoice == 2 then
            local buffer = io.read()

            print(line)

            print("|Please Enter Booster Cookie Price       |")

            local boosterCookie = io.read()

            print(line)

            print("|Please enter USD amount:                |")
            local usdAmount = io.read()
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
            usdAmount = desimplifyNumber(usdAmount)


            local CoinsPerGem = boosterCookie/365 
            
            local gems = CoinsPerGem * 675 

            local usdPerGem = 5.99/675


            local function convertUSD(usdToCoins)
                usdToCoins = usdAmount
                local dollarOfGems =  1/usdPerGem
                local CoinsPerDollar = dollarOfGems * CoinsPerGem
                usdToCoins = usdToCoins * CoinsPerDollar
                return usdToCoins
            end
            function math.sign(v)
                return (v >= 0 and 1) or -1
            end
            function math.round(v, bracket)
                bracket = bracket or 1
                return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
            end
            function formatValue(n)
                    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
                return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
            end
            if (math.round(convertUSD(usdAmount), 1)) >= 10000000000 then
                space = ("                    |")
            elseif (math.round(convertUSD(usdAmount), 1)) >= 1000000000 then
                space = ("                     |")
            elseif (math.round(convertUSD(usdAmount), 1)) >= 100000000  then
                space = ("                       |")
            elseif (math.round(convertUSD(usdAmount), 1)) >= 10000000 then
                space = ("                        |")
            elseif (math.round(convertUSD(usdAmount), 1))>= 1000000 then
                space = ("                         |")
            elseif (math.round(convertUSD(usdAmount), 1)) >= 100000 then
                space = ("                           |")
            elseif (math.round(convertUSD(usdAmount), 1)) >= 10000 then 
                space = ("                            |")
            end
            print("|Amount worth:                           |")
            print("|" .. formatValue((math.round(convertUSD(usdAmount), 1))) .. " Coins" .. space)
            print(line)
        elseif modeChoice ~= 1 or modeChoice ~= 2 then
            print("Not a option!")
        end
    print("|                 Again?                 |")
    repeatOption = io.read()
    if repeatOption == ("Yes") then
        Repeat = true
    else 
        Repeat = false
    end
    print(line)
end






