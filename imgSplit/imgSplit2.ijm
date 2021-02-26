/*
#===========================================================================#
#=									   =#
#   Filename:	    imgSplit2.ijm
#   Version:	    1.0
#=									   =#
#   Description:    IJ/FIJI macro for spliting multiple images
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2020-12-21
#   Updated:	    
#=									   =#
#===========================================================================#
*/

//#--------------- sauce ---------------#
// Sauce: http://imagej.1557.x6.nabble.com/split-image-td5001409.html
//	http://imagej.1557.x6.nabble.com/How-to-save-all-opened-images-td3686986.html
//

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".JPG") suffix

//#--------------- batching ---------------#

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

//#--------------- body ---------------#

function processFile(input, output, file) {
    print("Processing: " + input + File.separator + file);

	open(input + File.separator + file);

	n = getNumber("How many divisions (e.g., 2 means quarters)?", 2);
	//n = 3
	id = getImageID();
	title = getTitle();
	getLocationAndSize(locX, locY, sizeW, sizeH);
	width = getWidth();
	height = getHeight();
	tileWidth = width / n;
	tileHeight = height / n;

	for (y = 0; y < n; y++) {
    	offsetY = y * height / n;
    	for (x = 0; x < n; x++) {
		offsetX = x * width / n;
		selectImage(id);
		call("ij.gui.ImageWindow.setNextLocation", locX + offsetX, locY + offsetY);
		tileTitle = title + " [" + x + "," + y + "]";
		run("Duplicate...", "title=" + tileTitle);
		makeRectangle(offsetX, offsetY, tileWidth, tileHeight);
		run("Crop");
    	}
	}

	selectImage(id);
	close();

	// get image IDs of all open images
	dir = getDirectory("Choose a Directory");
	ids=newArray(nImages);
	for (i=0;i<nImages;i++) {
        selectImage(i+1);
        title = getTitle;
        print(title);
        ids[i]=getImageID;

        saveAs("Jpeg", dir+title+ids[i] + ".jpg");
	} 

	run("Close All");
}
