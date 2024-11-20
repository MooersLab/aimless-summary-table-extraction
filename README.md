![Version](https://img.shields.io/static/v1?label=aimless-summary-table-extraction&message=0.0&color=brightcolor)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Bash function to extract Summary Table from aimless.log file

## What is this?

A bash function that eases access to the summary statistics in the aimless.log file after processing with autoxds at SSRL.

The bash function takes the diffraction image file stem and the run number as command line arguments.
The output files are assumed to be in a subfolder.
The the function prints the summary table to the terminal and to a file for further processing.

## Problem

The summary table in the aimless.log file from the scaling and merging of X-ray diffraction images provides ab overview from which to decide whether to reprocess images with a different high-resolution limit.
Accessing this summary table is simple using the search facility in Vim.
It is more laborious to use other text editors.

However, loading the file into Vim and entering the command takes time.
I sought a faster approach when processing many datasets.

## Solution

A bash function that is sourced on log in to a bash shell and thus always ready.

## Installation

1. Copy the contents of summary.sh into a .bashFunctions file in your home directory.
2. Source .bashFunctions from .bash_profile file.
3. Invoke the bash shell by entering `bash`, if not already in bash. This function worksin zsh shell.

# Usage
1. Enter `summary <image filestem> <run number>. The output files are assumed to be in a subfolder with the following syntax for the file name <filestem>_<run-number>_xds
2. The extracted table is displayed in `more`.


## Update history

|Version      | Changes                                                                                                                                                                         | Date                 |
|:-----------|:------------------------------------------------------------------------------------------------------------------------------------------|:--------------------|
| Version 0.1 |   Added badges, funding, and update table.  Initial commit.                                                                                                                | 2024 November 20  |

## Sources of funding

- NIH: R01 CA242845
- NIH: R01 AI088011
- NIH: P30 CA225520 (PI: R. Mannel)
- NIH: P20 GM103640 and P30 GM145423 (PI: A. West)
