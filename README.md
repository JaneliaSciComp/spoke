# Spoke
Spoke is a MATLAB app for live selective display of neural data from high-channel-count recording systems. It offers multiple experimenter-optimized display modes based on data reduction of high-channel-count data streams. It currently supports the Neuropixels (Phase 3A and 3b) and Whisper extracellular recording systems steered by the [Harris Lab](https://www.janelia.org/lab/harris-lab) at HHMI/Janelia Research Campus.  

Spoke is developed & maintained by the Scientific Computing team at HHMI/Janelia, under the auspices of the Harris Lab. 

## Release Information
The active beta version can be accessed from the [master branch](https://github.com/JaneliaSciComp/spoke/tree/master). A v1.0 release is expected soon. 

## System Requirements

* Windows 64-bit operating system (7, 8.1, 10)
* SpikeGLX Software (Release 20190327 or later, accessed from [here](http://billkarsh.github.io/SpikeGLX)).
* [MATLAB](https://www.mathworks.com/downloads) (R2015b or later; R2019a recommended for fastest performance)
* MATLAB [Signal Processing Toolbox](https://www.mathworks.com/products/signal.html)

## Launching Spoke
1. Launch SpikeGLX  
2. Establish connection between Spoke to SpikeGLX  
  A. Open SpikeGLX dialog 'Options/Command Server Settings...'.  
  B. Click 'Enable Remote Command Server' and then click 'My Address'.  
  C. (If Spoke is on separate machine) Write down the IP address; you'll need to type that into the MATLAB client code.  
3. Launch MATLAB  
  A. If not done already, [add root folder and subfolders to MATLAB path](https://www.mathworks.com/help/matlab/matlab_env/add-remove-or-reorder-folders-on-the-search-path.html)  
4. Launch Spoke  
  A. If Spoke is on same machine; enter ```spoke``` on the MATLAB command line  
  B. If Spoke is on separate machine; enter ```spoke('XXX.XXX.X.XXX')``` on the MATLAB command line  

## Running Spoke
Spoke currently has three modes of selective data display:  
* Spike-triggered waveform: Display of signal waveforms near detected "spike" events
* Stim-triggered waveform: Display of peristimulus waveforms
* Raster: Display of peristimulus detected "spike" events

To run Spoke:
* Configure the display mode: 
    * Raster mode
      * Select the Raster radio button in Spoke control window
    * Spike-triggered waveform
      * Select Waveform in the Spoke control window
      * Ensure stimStartChannel is empty in the Spoke control window (enter ````[]```` if needed)
    * Stim-triggered waveform
      * Select Waveform in the Spoke control window
      * Specify stimulus channel number in stimStartChannel in the Spoke control window
* Configure additional display settings as desired:
  * Available settings correspond to the public properties described in Spoke's class documentation (````doc SpokeModel````)
  * All of these settings are availalbe from the Spoke control window
* Press Start to begin streaming selective display
  * Display continues until stopped and can be restarted at any time.


## About the Implementation
Spoke is a consumer of the SpikeGLX data production software for Whisper neural recordings systems. Spoke retrieves data from SpikeGLX via its remote command interface over TCP/IP. 

Spoke uses a [MATLAB Timer object](https://www.mathworks.com/help/matlab/ref/timer-class.html?s_tid=srchtitle) to process the SpikeGLX data stream one batch at a time, at a regular interval. It processes the data, reducing it and then displaying the reduced data. 

See [Processing Pipeline](https://github.com/JaneliaSciComp/spoke/wiki/Processing-Pipeline) for an overview and description of the processing pipeline for each of the three modes of data reduction and display. 

Spoke seeks to be as memoryless as possible. In other words, raw data is discarded as soon as it is no longer needed, i.e. not a part of the reduced data structure or needed for processing in a subsequent timer period. 

## Acknowledgements
We acknowledge the following important contributions beyond the GitHub records. Vijay Iyer developed the initial "alpha" version prior to GitHub tracking. Bill Karsh added an SDK to SpikeGLX to allow MATLAB applications like Spoke to access its data stream, and actively supported Spoke as a use case. Several Janelia researchers provided invaluable initial feedback and testing time for this software.
