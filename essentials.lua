-- Rounds a number to the closest integer
-- @param1 number to be rounded
-- @param2 decimal places to round
--
-- @return rounded number
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num + 0.5 * mult)
end
