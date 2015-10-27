{
	"id" : "skuidcore",
	"components" : [
	    {
	    	"id" : "panelset",
	    	"pathsToChildComponents" : ["panels>panel>components"]
	    },
	    {
			"id" : "tabset",
			"pathsToChildComponents" : ["tabs>tab>components"],
			"customLabelDependencies" : ["loading"]
		}
	],
	"js" : [
		{ "resource" : "CoreComponents", "namespace" : "skuid", "path" : "runtime.js" }
	]
}