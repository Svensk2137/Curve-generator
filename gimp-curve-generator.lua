--[[
	VHS Curve Bend points generotor for GIMP made in lua
]]--

function genvalue(intensity)
	local value = 127 - intensity / 2 + math.random() * intensity
	local round_value = tonumber(string.format("%.0f", value))
	return round_value
end

user_intensity = 1.5

if arg[1] then
	user_intensity = arg[1]
end

file = io.open("curve_bend_points.point", "w")

file:write("POINTFILE_CURVE_BEND\nVERSION 1.0\n# INTENSITY = "..user_intensity)

for i = 0,256 do
	i = i + 1
	local left = genvalue(user_intensity)
	local right = genvalue(user_intensity)
	file:write('VAL_Y'..left.."  "..right.."\n")
end
file:close()
print("Generated values outputted to file \"curve_bend_points.point\"")