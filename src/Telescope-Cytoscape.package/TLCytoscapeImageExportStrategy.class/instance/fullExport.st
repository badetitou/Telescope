accessing
fullExport
	"Optional option to define if the export should export the full visualization or only the current viewport. By default: true."
	
	^ fullExport ifNil: [ fullExport := true ]