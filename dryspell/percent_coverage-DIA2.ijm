/*
 * Macro template to process multiple images in a folder
 * man: Image > Adjust > Color Threshold > (HSB: 36,-; -,-; 0,190) > Select
 *	> Edit > Selection > Make Inverse > Delete > ...Make Inverse > Create Mask
 */

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".JPG") suffix

// See also Process_Folder.py for a version of this code
// in the Python scripting language.

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
	// Do the processing here by adding your own code.
	// Leave the print statements until things work, then remove them.
    print("Processing: " + input + File.separator + file);
	// need to include save output command; look into how .py functions or at least record a macro

	open(input + File.separator + file);
    
    makeRectangle(60, 0, 1800, 1500);
    run("Crop");

    min=newArray(3);
    max=newArray(3);
    filter=newArray(3);
    a=getTitle();
    run("HSB Stack");
    run("Convert Stack to Images");
    selectWindow("Hue");
    rename("0");
    selectWindow("Saturation");
    rename("1");
    selectWindow("Brightness");
    rename("2");
    min[0]=36;
    max[0]=255;
    filter[0]="pass";
    min[1]=0;
    max[1]=255;
    filter[1]="pass";
    min[2]=0;
    max[2]=190;
    filter[2]="pass";
    
    for (i=0;i<3;i++){
	selectWindow(""+i);
	setThreshold(min[i], max[i]);
 	run("Convert to Mask");
	    if (filter[i]=="stop")  run("Invert");
    }

    imageCalculator("AND create", "0","1");
    imageCalculator("AND create", "Result of 0","2");
    
    for (i=0;i<3;i++){
	selectWindow(""+i);
 	close();
    }

    selectWindow("Result of 0");
    close();
    selectWindow("Result of Result of 0");
    rename(a);

// Colour Thresholding-------------

	saveAs("PNG", output + File.separator + file);
	run("Measure");
	
	saveAs("Results", output + File.separator + file);

    print("Saving to: " + output);
	close();
}
