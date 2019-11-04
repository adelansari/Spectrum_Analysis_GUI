# Spectrum Analysis GUI

Developed a graphical user interface using MATLAB which analyzes the spectrum of different radiation sources.

<p align="center"> 
<img src="Images/2.png">
</p>

# Abstract:

For the spectrum analysis MATLAB program have been developed with Graphical User Interface (GUI). The functionalities of this program are the followings:

1. Load a spectrum input data formatted in two columns, the first column is channel number and the second column is total counts per channel. The following file
formats for input file are allowed: “.txt”, “.dat”, “.xls”, “xlsx”. In case of different file format is selected a error dialog box will appear.
2. Can accept from user the following inputs: total time of the measurement and two data points of channel and corresponding energy (I.e. E1, ch1 and E2, ch2).
3. Using this program user can plot energy vs counts/sec, count vs channel, counts vs energy and energy vs counts/sec in logarithmic scale.
4. This program can scan the plotted spectrum for peaks.
5. The following information for each peaks are reported: energy, count rate, Full Width Half Maximum (FWHM), resolution, Peak efficiency and standard deviation of the peak efficiency.
6. Summary file with the information reported above is produced ( NOTE: The file name will be Results and open it using Word Pad ).


# Introduction

When Spectrum Analysis GUI program starts only “Open data file” button is enabled.

Pressing the button “Open data file” dialog box appears, which allows to choose input file from any location inside your PC. The following file formats for input file are allowed: “.txt”, “.dat”, “.xls”,
“xlsx”. The input data must be formatted in two columns, the first column is channel number and the second column is total counts per channel and without any column names in the input file.

After loading the input file. The user can input the total time of the measurement, two data points of channel and corresponding energy (I.e. E1, ch1 and E2, ch2) for energy calibration. The default values

Name            | Value
--------------- | ----------------
Total time | 2 minutes
Channel 1 | 95
Channel 2 | 530
Energy 1 | 0.24 MeV
Energy 2 | 1.33 MeV
Source strength | 5 Curie 
Solid angle | 0.2 steradians

These parameters can be changed. In case of inputting negative values for these parameters, an error
dialog box appears and all buttons and fields become disabled. User must input positive values
for these parameters.
When the correct input parameters are set, all buttons become enabled. By pressing scan for peaks
the spectrum analysis is performed and in the figure the counts/Sec vs energy is plotted. The positions
of peaks are marked in the plot. When the peaks are found, in the bottom part of GUI, information
about these peaks will appear. Also this information is automatically saved in separate file
(“Results.txt”) in the same directory where the input file is located.

The functionality of remaining buttons are the followings:
1. Counts vs Channel – plot counts versus channel number.
2. Counts vs Energy – plot counts versus energy.
3. Log Plot - plot count/Sec versus energy in log scale,
4. Reset - clear plot.
5. Scan for peaks (Log) - plot count/Sec versus energy in log scale with smoothing curves and targeted
peaks.
6. Scan for peaks - plot count/Sec versus energy in normal scale with targeted peaks.
