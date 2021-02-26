/*
#===========================================================================#
#=									   =#
#   Filename:	    mult_leafdims.ijm
#   Version:	    1.0
#=									   =#
#   Description:    quick macro to get leaf shape ratios
#		    > works with multiple leaves in an img
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2021-01-20
#   Updated:	    
#=									   =#
#===========================================================================#
*/

/*
    sauce:
	https://forum.image.sc/t/results-table-to-macro/28190/12
	https://www.youtube.com/watch?reload=9&v=AX4qt2NluAo
*/

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".JPG") suffix


processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
	    if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {

	open(input + File.separator + file);
	
	run("8-bit");
	run("Auto Threshold", "method=Huang");
	//run("Analyze Particles...", "  show=Outlines display exclude clear summarize");
	run("Particles8 ", "white morphology show=Particles minimum=0 maximum=9999999 display redirect=None");
	
	/*
	// draw Feret's diameter and breadth for visualization
	numberOfRows = nResults;
	for (row = 0; row < numberOfRows; row++) {

	    Fx1 = getResult("FeretX1", row);
	    Fy1 = getResult("FeretY1", row);
	    Fx2 = getResult("FeretX2", row);
	    Fy2 = getResult("FeretY2", row);

	    Bx1 = getResult("BrdthX1", row);
	    By1 = getResult("BrdthY1", row);
	    Bx2 = getResult("BrdthX2", row);
	    By2 = getResult("BrdthY2", row);

	    Overlay.drawline(Fx1, Fy1, Fx2, Fy2);
	    setColor("red");
	    Overlay.show();

	    Overlay.drawline(Bx1, By1, Bx2, By2);
	    setColor("blue");
	    Overlay.show();
	}
	*/
// Colour Thresholding-------------

	saveAs("PNG", output + File.separator + file);

	saveAs("Results", output + File.separator + file);

    print("Saving to: " + output);
	close();
}
