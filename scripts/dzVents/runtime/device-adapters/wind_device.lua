local adapters = require('Adapters')()

return {

	baseType = 'device',

	name = 'Wind device adapter',

	matches = function (device)
		return (device.deviceType == 'Wind')
	end,

	process = function (device, data, domoticz, utils)

		device.gust = tonumber(device.rawData[4]) / 10
		device.temperature = tonumber(device.rawData[5])
		device.chill = tonumber(device.rawData[6])

		function device.updateWind(bearing, direction, speed, gust, temperature, chill)
			local value = tostring(bearing) .. ';' ..
					tostring(direction) .. ';' ..
					tostring(speed * 10) .. ';' ..
					tostring(gust * 10) .. ';' ..
					tostring(temperature) .. ';' ..
					tostring(chill)
			device.update(0, value)
		end
	end

}