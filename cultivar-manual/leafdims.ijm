/*
 * Macro template to process multiple images in a folder
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
    min[0]=0;
    max[0]=255;
    filter[0]="pass";
    min[1]=0;
    max[1]=255;
    filter[1]="pass";
    min[2]=20;
    max[2]=255;
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

	run("Particles8 ", "white morphology show=Particles minimum=0 maximum=9999999 display overwrite redirect=None");
	
	Overlay.drawLine(getResult("FeretX1",0), getResult("FeretY1",0), getResult("FeretX2",0), getResult("FeretY2",0));
	setColor("red");
	Overlay.show();
	Overlay.drawLine(getResult("BrdthX1",0), getResult("BrdthY1",0), getResult("BrdthX2",0), getResult("BrdthY2",0));
	setColor("blue");
	Overlay.show();

// Colour Thresholding-------------

	saveAs("PNG", output + File.separator + file);

	saveAs("Results", output + File.separator + file);

    print("Saving to: " + output);
	close();
}
