local adapters = require('Adapters')()

return {

	baseType = 'device',

	name = 'Text device',

	matches = function (device)
		return (device.deviceSubType == 'Text')
	end,

	process = function (device, data, domoticz)

		device['text'] = device.rawData[1] or ''

		device['updateText'] = function (text)
			device.update(0, text)
		end

	end

}