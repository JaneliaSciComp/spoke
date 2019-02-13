# Spoke
=========

Spoke is a MATLAB app for live display of neural 
data from high-channel-count recording systems. It offers multiple experimenter-optimized display modes based on data reduction of high-channel-count data streams. It is designed around the Whisper extracellular recording system developed at HHMI/Janelia Research Campus in the [APIG lab of Tim Harris](https://www.janelia.org/lab/harris-lab-apig) and its accompanying [SpikeGLX] (https://github.com/billkarsh/SpikeGLX) neural recording software.

Spoke is developed & maintained by the APIG Lab at HHMI/Janelia Research Campus.

## Downloads
Version 1.0 link coming soon.

## System Requirements

* Windows: 7, 8.1, 10.
* SpikeGLX Software ([get it here](http://billkarsh.github.io/SpikeGLX)).
* MATLAB R2015b (or later) & Signal Processing Toolbox

## Installation and Getting Started
[Visit the Spoke User Guide](https://janeliascicomp.github.io/spoke/) for Getting Started and other documentation.

## About the Implementation
Spoke is a consumer of the SpikeGLX data production software for Whisper neural recordings systems. Spoke retrieves data from SpikeGLX via its remote command interface over TCP/IP. 

Spoke uses a [MATLAB Timer object](https://www.mathworks.com/help/matlab/ref/timer-class.html?s_tid=srchtitle) to process the SpikeGLX data stream one batch at a time, at a regular interval. It processes the data, reducing it and then displaying the reduced data. 

See [Processing Pipeline](https://github.com/JaneliaSciComp/spoke/wiki/Processing-Pipeline) for an overview and description of the processing pipeline for each of the three modes of data reduction and display. 

Spoke seeks to be as memoryless as possible. In other words, raw data is discarded as soon as it is no longer needed, i.e. not a part of the reduced data structure or needed for processing in a subsequent timer period. 

## Credits
* Vijay Iyer: Initial Implementation & Version 1.0
* Edward Kang: Version 1.0 
* Bill Karsh: MATLAB interface to SpikeGLX
* David Ackerman: Version 1.0
