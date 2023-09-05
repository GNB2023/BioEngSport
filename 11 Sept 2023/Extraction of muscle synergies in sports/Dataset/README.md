# README
This README.txt file was generated on 2023-02-13 by Marco GHISLIERI and modified on 2023-09-05 by Marco GHISLIERI

</br>

## GENERAL INFORMATION
### Title:
Extraction of muscle synergies in sport: applications to the evaluation of chronic ankle instability

### Author(s) Information: 
Marco GHISLIERI, Politecnico di Torino, BIOLAB, Department of Electronics and Telecommunications, C.so Duca degli Abruzzi, 24, 10129, Turin, Italy, e-mail: marco.ghislieri@polito.it

### Geographic location of data collection: 
Physical Medicine and Rehabilitation Unit of IRCCS Istituto Ortopedico Rizzoli (Bologna, Italy).

### Information about funding sources that supported the collection of the data: 
No funding sources 

</br>

## SHARING/ACCESS INFORMATION
### Licenses/restrictions placed on the data:
Data are freely available on GitHub

### Links to publications that cite or use the data:
1. Ghislieri, M. et al. Muscle Synergy Assessment during Single-Leg Stance. IEEE Transactions on Neural Systems and Rehabilitation Engineering, 2020. Doi: 10.1109/TNSRE.2020.3030847
2. Ghislieri, M. et al. Methodological issues in the assessment of motor control during single-leg stance. IEEE International Symposium on Medical Measurements and Applications (MeMeA), Bari, Italy, 2020. Doi: 10.1109/MeMeA49120.2020.9137180
3. Labanca, L. et al. Muscle activations during functional tasks in individuals with chronic ankle instability: a systematic review of electromyographical studies. Gait & Posture, 2021. Doi: 10.1016/j.gaitpost.2021.09.182
4. Labanca, L. et al. Muscle synergies for the control of single-limb stance with and without visual information in young individuals. BMC Sports Science, Medicine and Rehabilitation, 2021. Doi: 10.1186/s13102-021-00392-z

### Links to other publicly accessible locations of the data:
No other publicly accessible locations are available.

### Links/relationships to ancillary data sets:
No

### Was data derived from another source?
No

</br>

## DATA & FILE OVERVIEW
### File list:
1. SubjXX: this file is available in .txt format and contains (i) the raw surface electromyographic (sEMG) signals acquired from 13 muscles of the affected (or dominant) lower limb and trunk during single-limb stance and (ii) the footswitch (Fsw) signals acquired from the non-affected (or non-dominant) lower limb. 'XX' represents the subject's ID.

### Additional related data collected that was not included in the current data package:
Force plate data

### Are there multiple versions of the dataset?
No

</br>

## METHODOLOGICAL INFORMATION
### Description of methods used for collection/generation of data:
sEMG signals were acquired from 13 muscles of the injured (or dominant) lower limb and trunk through electromyography wireless probes (BTS FreeEMG 1000, BTS Bioengineering, Milan, Italy) fixed on EMG electrodes (Ag/AgCl) applied over Tibialis Anterior (TA), Peroneus Longus (PL), Peroneus Brevis (PB), Soleus (SO), Lateral Gastrocnemius (LG), Vastus Medialis (VM), Vastus Lateralis (VL), Rectus Femoris (RF), Biceps Femoris (BF), Semitendinosus (ST), Gluteus Medius (GM), Longissimus Dorsii of Ipsilateral (or dominant) lower limb (LDI), and Longissimus Dorsii of Contralateral side (LDC) in accordance with SENIAM recommendations. To reduce skin impedance, before electrode application, the skin area was shaved and cleaned with ethyl alcohol. A footswitch (Fsw) was placed under the first metatarsal head of the uninjured (non-dominant) foot. SEMG and Fsw signals were recorded with a sampling frequency of 1000 Hz.

Further details on data acquisitions can be found here:
1. Ghislieri, M. et al. Muscle Synergy Assessment during Single-Leg Stance. IEEE Transactions on Neural Systems and Rehabilitation Engineering, 2020. Doi: 10.1109/TNSRE.2020.3030847
2. Ghislieri, M. et al. Methodological issues in the assessment of motor control during single-leg stance. IEEE International Symposium on Medical Measurements and Applications (MeMeA), Bari, Italy, 2020. Doi: 10.1109/MeMeA49120.2020.9137180
3. Labanca, L. et al. Muscle activations during functional tasks in individuals with chronic Ankle instability: a systematic review of electromyographical studies. Gait & Posture, 2021. Doi: 10.1016/j.gaitpost.2021.09.182
4. Labanca, L. et al. Muscle synergies for the control of single-limb stance with and without visual information in young individuals. BMC Sports Science, Medicine and Rehabilitation, 2021. Doi: 10.1186/s13102-021-00392-z

### Methods for processing the data:
No additional info is required to process the data correctly.

### Instrument- or software-specific information needed to interpret the data:
No instrument- or software-specific information is needed to properly open the data (*.txt files).

### Standards and calibration information, if appropriate:
N/A

### Environmental/experimental conditions:
Participants were asked to stand barefoot on a force platform with either the dominant or the injured limb and to maintain	the contralateral knee joint flexed at approximately 90°. During the single-limb stance task, volunteers were asked to look forward and to remain as still as possible for at least 30 seconds.

### Describe any quality-assurance procedures performed on the data:
The quality of sEMG signals was checked during data acquisitions. If there was low quality, the active probe positions were	adjusted until a sufficient quality was reached.

### People involved with sample collection, processing, analysis and/or submission:
Data were collected at the Physical Medicine and Rehabilitation Unit of IRCCS Istituto Ortopedico Rizzoli (Bologna, Italy).

</br>

## DATA-SPECIFIC INFORMATION FOR: SubjXX.txt
### Number of variables/columns:
16 variables/columns

### Number of cases/rows:
Each row represents a different time instant as identified by the "Frame" and "Time" variables.

### Variable List:
1. "Frame": frame
2. "Time": time-instants expressed in seconds
3. "Fsw": footswitch signal. The signal was normalized in amplitude to obtain signals that range between 0 and 1, where 0 corresponds to an open Fsw (foot not touching the ground) and 1 corresponds to a closed Fsw (foot on the ground)
4. "sEMG_PL", "sEMG_PB", "sEMG_TA", "sEMG_LG", "sEMG_SO", "sEMG_VM", "sEMG_VL", "sEMG_RF", "sEMG_BF", "sEMG_ST", "sEMG_GM", "sEMG_LDI", and "sEMG_LDC": raw surface electromyographic signals.

### Specialized formats or other abbreviations used:
1. PL = Peroneus Longus
2. PB = Peroneus Brevis
3. TA = Tibialis Anterior
4. LG = Lateral Gastrocnemius
5. SO = Soleus
6. VM = Vastus Medialis
7. VL = Vastus Lateralis
8. RF = Rectus Femoris
9. BF = Biceps Femoris
10. ST = SemiTendinosus
11. GM = Gluteus Medius
12. LDI = Ipsilateral Longissimus Dorsii
13. LDC = Contralateral Longissimus Dorsii

