//Sauce: http://imagej.1557.x6.nabble.com/split-image-td5001409.html
//	http://imagej.1557.x6.nabble.com/How-to-save-all-opened-images-td3686986.html
//
//removed dialog for repeated measures; n -> nxn grid of the image
//n = getNumber("How many divisions (e.g., 2 means quarters)?", 2);
n = 3
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
//dir = getDirectory("Choose a Directory");
dir = getDirectory("file");
ids=newArray(nImages);
for (i=0;i<nImages;i++) {
        selectImage(i+1);
        title = getTitle;
        print(title);
        ids[i]=getImageID;

        saveAs("Jpeg", dir+title+ids[i] + ".jpg");
} 

run("Close All");
