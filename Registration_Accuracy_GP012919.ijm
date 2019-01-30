//This macro collects user defined points guided by ROIs based on a 
//points in a reference brain for estimation of registration error.

macro "Registration Analysis" {

run("Enhance Contrast", "saturated=0.35"); //temporary adjustment to improve visibility
roiManager("Open", "/Users/grahampeet/Desktop/Zebrafish/RoiSet_test.zip"); //your ROI file here

if (toolID != 7) { // User needs to have point selection turned on
	exit("Select point tool first")
}
//space here for a file batch loop
	for (i = 0; i <= roiManager("count"); i++) {
		roiManager("deselect");
		roiManager("select", i);
		roiManager("draw");
		waitForUser;
	    getCursorLoc(x, y, z, flags);
	    setResult("xval", i, x);
	    setResult("yval", i, y);
	    setResult("zval", i, z);
	    updateResults();
	    showProgress(i / 10); //number of ROIs needs to be entered here
	}
	saveAs("Results", /Users/grahampeet/Desktop/Zebrafish)
}
