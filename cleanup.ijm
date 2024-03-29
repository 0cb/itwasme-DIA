cleanUp();

//#-Closes the "Results" and "Log" windows and all image windows-#

function cleanUp() {
    requires("1.30e");
    if (isOpen("Results")) {
         selectWindow("Results"); 
         run("Close");
    }
    if (isOpen("Raw Results")) {
         selectWindow("Raw Results"); 
         run("Close");
    }
    if (isOpen("Log")) {
         selectWindow("Log");
         run("Close");
    }
    if (isOpen("ROI Manager")) {
    	selectWindow("ROI Manager");
    	run("Close");
    }
    while (nImages()>0) {
          selectImage(nImages());  
          run("Close");
    }
}