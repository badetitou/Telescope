as yet unclassified
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #elementId value: self nodeId.
			jsonMapWriter writeKey: #style value: self style ]