//must be using the "Click coordinates" tool
x1 = getResult("X", 0);
y1 = getResult("Y", 0);

x2 = getResult("X", 1);
y2 = getResult("Y", 1);

x3 = getResult("X", 2);
y3 = getResult("Y", 2);

x4 = getResult("X", 3);
y4 = getResult("Y", 3);

id = getImageID();
title = getTitle();
dir = getDirectory("image");

makeLine(x1, y1, x2, y2);
run("Measure");
makeLine(x3, y3, x2, y2);
run("Measure");
//makeLine(x4, y4, x2, y2);
//run("Measure");

saveAs("Results", dir+title+ ".csv");
selectWindow("Results");
run("Close");

selectImage(id);
run("Open Next");


//cleanUp();

// Closes the "Results" and "Log" windows and all image windows
function cleanUp() {
    requires("1.30e");
    if (isOpen("Results")) {
         selectWindow("Results"); 
         run("Close" );
    {
    if (isOpen("Log")) {
         selectWindow("Log");
         run("Close" );
    }
    while (nImages()>0) {
          selectImage(nImages());  
          run("Close");
    }
}
