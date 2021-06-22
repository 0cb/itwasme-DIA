//extract surface area and ndvi over the whole plot for trees and grasses
//http://imagej.1557.x6.nabble.com/Extracting-pixel-values-to-results-table-td3683931.html


run("Memory & Threads...", "maximum=1600 parallel=8 run");

dir1 = getDirectory("Choose Source Directory "); //prompt user for source directory

dir2 = getDirectory("Choose Destination Directory ");  //prompt user for destination directory

dir3 = getDirectory("Choose Results Directory ");  //promt user for destination directory for results file

dir4 = getDirectory("Choose NDVI Results Directory ") //promt for ndvi dir

list2 = getFileList(dir2); //get a list of the files  

setBatchMode(true);

for (z=0; z<list2.length; z++) {
      open(dir2+list2[z]);               //opens every image
      //showProgress(z+1, list2.length);  

      start = getTime();                                                   // Get current time for progress bar
    
     w = getWidth();
     h = getHeight();
     run("Clear Results");
     i = 0;
     for (x=0; x<w; x++) {
         showProgress(x, w);
         for (y=0; y<h; y++) {  
            v = getPixel(x, y);
            r = (v & 0xff0000)>>16;
            g = (v & 0x00ff00)>>8;      
            b = (v & 0x0000ff);            
            NDVI = ((r-g)/(r+g));
            setResult("O", i, i);
            setResult("Pr", i, x+1);
            setResult("Pc", i, y+1);
            setResult("NDVI", i, NDVI);
            i++;
         }
     }
     //updateResults();
      saveAs("Results", getDirectory("home")+"ndvi.txt");
      run("Clear Results"); 
