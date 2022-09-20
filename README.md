# Hogan Lab. Minnesota Supercomputer Institute (MSI) usage
---
## ssh connection
Connet MSI pc by typing following command:
```
ssh username@mesabi.msi.umn.edu
```
---
## Job submission & related commands
* Submit via submission script <br>
```
sbatch filename
```
**Do NOT drectly run code on your turminal.**
* Check simulation status
```
squeue --me
```
You can see following output:
```
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
150233376   agsmall wmake.sh tamad005  R      15:37      1 acn02
```
* Check your storage usage
```
groupquota -u
```
---
## File transfer
* **WinSCP** <br>
You can find instruction from [here](https://www.msi.umn.edu/support/faq/how-do-i-use-winscp-transfer-data).
* **FileZilla** <br>
You can find instruction from [here](https://www.msi.umn.edu/support/faq/how-do-i-use-filezilla-transfer-data).
* **SCP** <br>
Type command `scp` like `cp` in UNIX command:<br>
```
scp username@mesabi.msi.umn.edu:address1 address2
```
For example,
```
scp tamad005@mesabi.msi.umn.edu:~/OpenFOAM/test/result.dat ~/
```
---
## LAMMPS (MD simulaiton)
### 1. Load module
```
lmp_intel_cpu_intelmpi -in inputFileName
```
### 2-1. Run with MSI execute file
Serial run:
```
lmp_intel_cpu_intelmpi -in inputFileName
```
Parallel run (substitute nCPU with your number of CPUs):
```
mpirun -n nCPU lmp_intel_cpu_intelmpi -in inputFileName
```
### 2-2. Build source code & run
---
## OpenFOAM (CFD simulation)
You can find instruction from [here](https://www.msi.umn.edu/sw/openfoam) but it is not useful and many simulation did not run with this way since the version is old (compatibility with recent version is low). We reccomend to build your own source code on the MSI computer as following instruction.
### Build source code
#### Step 1: Download OpenFOAM
* You can obtain openfoam-OpenFOAM-v2012.tar.gz from [Hogan Lab google drive](https://drive.google.com/drive/folders/1aNexaUZE-kseBgT_6dSQ2XPvSLhlY9ph?usp=sharing)
* Or you can download from [here](https://develop.openfoam.com/Development/openfoam/-/tree/OpenFOAM-v2012).
* <span style="color:red">**Newer version (OpenFOAM-v2206) could not be compiled**</span> due to maybe MSI compiler issue (check date: 09/19/2022).  I did not test the versions between v2206 and v2012.
* OpenFOAM foundation version may be avairable as well (not checked).
#### Step 2: Transfer downloaded file to MSI
* Make a OpenFOAM directory at your MSI home directory by `mkdir ~/OpenFOAM`.
* Transfer the downloaded file with keeping compressed form.
* Check you have ~/OpenFOAM/openfoam-OpenFOAM-v2012.tar.gz file.
#### Step 3: Extract file on MSI
* Download OpenFOAM_MSIscript/Extract.sh from this repository and transfer it to ~/OpenFOAM/.
* Submit script by `sbatch Extract.sh` from ~/OpenFOAM directory
* This script extract .tar file via `tar -xfv openfoam-OpenFOAM-v2012.tar.gz`.
* Check you have ~/OpenFOAM/openfoam-OpenFOAM-v2012 file.
#### Step 4: Build
* Download OpenFOAM_MSIscript/build.sh from this repository and transfer it to ~/OpenFOAM/openfoam-OpenFOAM-v2012/.
* Submit script by `sbatch build.sh` from ~/OpenFOAM/openfoam-OpenFOAM-v2012/ directory.
* This script build OpenFOAM via:
```
module load ompi
module load flex
./Allwmake
```
* It may take a while (>10hr).
## Your own code
Only you know how to use it.
## Author
* Dr. Tomoya Tamadate
* [LinkedIn](https://www.linkedin.com/in/tomoya-tamadate-953673142/)/[ResearchGate](https://www.researchgate.net/profile/Tomoya-Tamadate)/[Google Scholar](https://scholar.google.com/citations?user=XXSOgXwAAAAJ&hl=ja)
* University of Minnesota
* tamalab0109[at]gmail.com
