//must be using the "Click coordinates" tool
x1 = getResult("X", 0);
y1 = getResult("Y", 0);

x2 = getResult("X", 1);
y2 = getResult("Y", 1);

x3 = getResult("X", 2);
y3 = getResult("Y", 2);

x4 = getResult("X", 3);
y4 = getResult("Y", 3);

x5 = getResult("X", 4);
y5 = getResult("Y", 4);

x6 = getResult("X", 5);
y6 = getResult("Y", 5);

x7 = getResult("X", 6);
y7 = getResult("Y", 6);

x8 = getResult("X", 7);
y8 = getResult("Y", 7);


id = getImageID();
title = getTitle();
dir = getDirectory("image");

//leaf.width
makeLine(x1, y1, x2, y2);
run("Measure");
//leaf.length
makeLine(x3, y3, x4, y4);
run("Measure");
//stolon.internode.diameter
makeLine(x5, y5, x6, y6);
run("Measure");
//stolon.internode.length
makeLine(x7, y7, x8, y8);
run("Measure");

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
