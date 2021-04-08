# ecg

Code for ECG lab module and accompanying work is presented. Peruse as you wish!


Included in this repository:
1. ecgtest.m --- models local max/min peak visualization, workflow for HR calculation, initial Fourier tranforms from Subject data
2. importdata.m --- sets up data importing for the design challenge data, stored into multi-dimensional tensor 
3. breathing_rate.m --- calculates the breathing rate from both subject and design data 
4. respiratory_30s.m --- conveys the changes in resipratory rate across 30s moving window
5. hr_unfiltered.m --- finds the raw unfiltered heart rate from patient and subject data via local max/min identification 
6. hr_filtered.m --- finds the filtered heart rate after filtering from patient and subject data via local max/min identification 
7. segment_calc.m --- extract the individual sections of an ECG waveform by finding edges of each region via a baseline
8. heart_rate_10s.m --- depicts the changes in respiratory rates across 10s moving window
9. subject1.mat --- ECG data collected for Subject 1 via Biopac
10. subject2.mat --- ECG data collected for Subject 2 via Biopac (note: quite noisy)
