# Spoke
=========

Spoke is a MATLAB app for live display of neural 
data from high-channel-count recording systems. It offers multiple experimenter-optimized display modes based on data reduction of high-channel-count data streams. It is designed around the Whisper extracellular recording system developed at HHMI/Janelia Research Campus in the [APIG lab of Tim Harris](https://www.janelia.org/lab/harris-lab-apig) and its accompanying [SpikeGLX] (https://github.com/billkarsh/SpikeGLX) neural recording software.

Spoke is developed & maintained by Scientific Computing under the auspices of the APIG Lab at HHMI/Janelia Research Campus.

## System Requirements
split up hardware (and add it) and software?
* Windows: 7, 8.1, 10.
* SpikeGLX Software ([get it here](http://billkarsh.github.io/SpikeGLX)).
* MATLAB R2015b or later (https://www.mathworks.com/downloads/)
* MATLAB Signal Processing Toolbox (https://www.mathworks.com/products/signal.html)

## Launching Spoke
numbers vs bullets? Prefer numbers
1. Launch SpikeGLX <\br>
2. Establish connection between Spoke to SpikeGLX <\br>
  a. Open SpikeGLX dialog 'Options/Command Server Settings...'. <\br>
  b. Click 'Enable Remote Command Server' and then click 'My Address'.  <\br>
  c. (If Spoke is on separate machine) Write down the IP address; you'll need to type that into the MATLAB client code.  <\br>
3. Launch MATLAB <\br>
  a. If not done already, add root folder and subfolders to MATLAB path [link](link to how to do it)  <\br>
4. Launch Spoke <\br>
  a. If Spoke is on same machine; enter "spoke" on the MATLAB command line  <\br>
  b. If Spoke is on separate machine; enter "spoke('<SpikeGLX IP address>')" on the MATLAB command line  <\br>

## Running Spoke
Spoke currently has three modes of selective data display:
* Spike-triggered waveform: Display of signal waveforms near detected "spike" events
* Stim-triggered waveform: Display of peristimulus waveforms
* Raster: Display of peristimulus detected "spike" events

To configure each of these modes:
* Raster mode
  * Select the Raster radio button in Spoke control window
* Spike-triggered waveform
  * Select Waveform in the Spoke control window
  * Ensure stimStartChannel is empty in the Spoke control window (enter \[\] if needed)
* Stim-triggered waveform
  * Select Waveform in the Spoke control window
  * Specify stimulus channel number in stimStartChannel in the Spoke control window

Configure additional display settings according to the public properties described in the Spoke Model documentation. All of these are available from the Spoke control window.

Press start to begin streaming selective display. Display continues until stopped and can be restarted at any time.

## About the Implementation
Spoke is a consumer of the SpikeGLX data production software for Whisper neural recordings systems. Spoke retrieves data from SpikeGLX via its remote command interface over TCP/IP. 

Spoke uses a [MATLAB Timer object](https://www.mathworks.com/help/matlab/ref/timer-class.html?s_tid=srchtitle) to process the SpikeGLX data stream one batch at a time, at a regular interval. It processes the data, reducing it and then displaying the reduced data. 

See [Processing Pipeline](https://github.com/JaneliaSciComp/spoke/wiki/Processing-Pipeline) for an overview and description of the processing pipeline for each of the three modes of data reduction and display. 

Spoke seeks to be as memoryless as possible. In other words, raw data is discarded as soon as it is no longer needed, i.e. not a part of the reduced data structure or needed for processing in a subsequent timer period. 

## Credits
* David Ackerman
* Vijay Iyer (Including initial implementation pre-Github)
* Edward Kang
* Bill Karsh (MATLAB interface to SpikeGLX)
