local adapters = require('Adapters')()

return {

	baseType = 'device',

	name = 'Electric usage device adapter',

	matches = function (device)
		return (device.deviceType == 'Usage' and device.deviceSubType == 'Electric')
	end,

	process = function (device, data, domoticz)

		device['WhActual'] = device.rawData[1]  or 0

	end

}