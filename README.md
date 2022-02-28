# Random_generator
An implementation of the Arbiter-PUF based random number generator based on the paper : https://arxiv.org/ftp/arxiv/papers/1204/1204.2516.pdf

The model was written in verilog on xilinx vivado.  

The output of the system needs to be read either from an **programmed FPGA** or simulated with **post-synthesis timing simulation** to get an output as PUFs work based on timing differences during manufacturing.

## Results
- Timing simulation was run in vivado and screenshots of the outputs are attached below.

  ![outout showing the loading of initial vector into the system](https://github.com/MINEKING987/Random_generator/blob/main/Fig%201.jpg?raw=true)
    <p align= "center">Fig.1 outout showing the loading of initial vector into the system</p>
  
  ![outout zoomed into the usable part of the output random values](https://github.com/MINEKING987/Random_generator/blob/main/Fig%202.jpg?raw=true)
    <p align= "center">Fig.2 outout zoomed into the usable part of the output random values.</p>
    
### note:
- the output is valid only in the areas where valid is high. The rnd output is discarded when the valid is low.
