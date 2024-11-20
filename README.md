![Version](https://img.shields.io/static/v1?label=aimless-summary-table-extraction&message=0.0&color=brightcolor)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Extract summary table from aimless.log file

## What is this?

A bash function that eases access to the summary statistics in the aimless.log file after processing with `autoxds` on the Structural Molecular Biology (SMB) server at the Stanford Synchrotron Radiation LightSource (SSRL).

The bash function takes the diffraction image file stem and the run number as command line arguments.
The output files are assumed to be in a subfolder.
The function summary() prints the summary table to the terminal and a file for further formatting.

## Problem

The summary table in the aimless.log file from the scaling and merging of X-ray diffraction images provides an overview from which to decide whether to reprocess the diffraction images with a different high-resolution limit.
Accessing this summary table is simple using the search facility in Vim.
It is more laborious to use other text editors.

However, loading the file into Vim and entering the command takes time.
I sought a faster approach using the command line when processing many datasets.


## Solution

A bash function that is sourced on log in to a bash shell and thus always ready.

## Installation

1. Copy the contents of summary.sh into a .bashFunctions file in your home directory.
2. Source .bashFunctions from .bash_profile file.
3. Invoke the bash shell by entering `bash`, if not already in bash. This function works in zsh shell.

## Usage
1. Navigate to the folder with the images and the autoxds output subfolders.
1. Enter `summary <image filestem> <run number>`. The output files are assumed to be in a subfolder with the following syntax for the file name `<filestem>_<run-number>_xds`
2. The extracted table is displayed in the terminal with the `more` file viewer. Enter `q` to escape this viewer. Enter the spacebar to advance. Enter `b` to go in reverse.

### Example of use

The image file stem is `3161`.
The aimless log file resides in the subfolder `3161_1_xds`.
The aimless log file name is `3161_1_aimless.log`.

```bash
summary 3161 1
```

Easy-peasy!

## Example of extracted table

Looks like I need to reprocess with a dmin of 1.333 Angstroms.

```bash
<!--SUMMARY_BEGIN--> $TEXT:Result: $$ $$
Summary data for        Project: XDSproject Crystal: XDScrystal Dataset: XDSdataset

                                           Overall  InnerShell  OuterShell
Low resolution limit                       32.87     32.87      1.36
High resolution limit                       1.34      7.34      1.34

Rmerge  (within I+/I-)                     0.028     0.023     1.064
Rmerge  (all I+ and I-)                    0.029     0.023     1.124
Rmeas (within I+/I-)                       0.031     0.025     1.190
Rmeas (all I+ & I-)                        0.030     0.025     1.191
Rpim (within I+/I-)                        0.013     0.011     0.526
Rpim (all I+ & I-)                         0.010     0.010     0.386
Rmerge in top intensity bin                0.022        -         - 
Total number of observations               96519       613      4140
Total number unique                         9795        80       461
Mean((I)/sd(I))                             24.2      66.0       1.7
Mn(I) half-set correlation CC(1/2)         1.000     0.999     0.765
Completeness                                99.7      99.4      97.9
Multiplicity                                 9.9       7.7       9.0
Mean(Chi^2)                                 0.89      0.82      0.77

Anomalous completeness                      99.6     100.0      94.5
Anomalous multiplicity                       5.2       5.6       4.8
DelAnom correlation between half-sets     -0.184     0.200    -0.001
Mid-Slope of Anom Normal Probability       0.914       -         -  

The anomalous signal appears to be weak so anomalous flag was left OFF

Estimates of resolution limits: overall
   from half-dataset correlation CC(1/2) >  0.30: limit =  1.34A  == maximum resolution
   from Mn(I/sd) >  1.50:                         limit =  1.34A  == maximum resolution
   from Mn(I/sd) >  2.00:                         limit =  1.38A 

Estimates of resolution limits in reciprocal lattice directions:
  Along h k plane
   from half-dataset correlation CC(1/2) >  0.30: limit =  1.34A  == maximum resolution
   from Mn(I/sd) >  1.50:                         limit =  1.34A  == maximum resolution
  Along l axis
   from half-dataset correlation CC(1/2) >  0.30: limit =  1.34A  == maximum resolution
   from Mn(I/sd) >  1.50:                         limit =  1.37A 

Anisotropic deltaB (i.e. range of principal components), A^2:  1.94

Average unit cell:    38.99   38.99  143.00   90.00   90.00  120.00
Space group: H 3 2
Average mosaicity:   0.20

Minimum and maximum SD correction factors: Fulls   0.27   2.82 Partials   0.00   0.00

$$ <!--SUMMARY_END-->
```


## Update history

|Version      | Changes                                                                                                                                                                         | Date                 |
|:-----------|:------------------------------------------------------------------------------------------------------------------------------------------|:--------------------|
| Version 0.1 |   Added badges, funding, and update table.  Initial commit.                                                                                                                | 2024 November 20  |

## Sources of funding

- NIH: R01 CA242845
- NIH: R01 AI088011
- NIH: P30 CA225520 (PI: R. Mannel)
- NIH: P20 GM103640 and P30 GM145423 (PI: A. West)
