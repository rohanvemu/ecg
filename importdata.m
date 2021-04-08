% Importing  design challenge data
Pat1=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_1");
Pat2=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_2");
Pat3=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_3");
%% Extracting data
%Patient 1
%TRIAL 1 DATA
time_P1_T1=Pat1(:,1);
leadA_P1_T1=Pat1(:,2);
leadB_P1_T1=Pat1(:,3);
leadC_P1_T1=Pat1(:,4);
 
%TRIAL 2 DATA
time_P1_T2=Pat1(:,6);
leadA_P1_T2=Pat1(:,7);
leadB_P1_T2=Pat1(:,8);
leadC_P1_T2=Pat1(:,9);
 
%TRIAL 3 DATA
time_P1_T3=Pat1(:,11);
leadA_P1_T3=Pat1(:,12);
leadB_P1_T3=Pat1(:,13);
leadC_P1_T3=Pat1(:,14);
 
%Exercise data
time_P1_E=Pat1(:,16);
leadA_P1_E=Pat1(:,17);
leadB_P1_E=Pat1(:,18);
leadC_P1_E=Pat1(:,19);
 
%DATA TENSOR
Trial_data_Pat1(:,:,1)=[time_P1_T1 leadA_P1_T1 leadB_P1_T1 leadC_P1_T1];
Trial_data_Pat1(:,:,2)=[time_P1_T2 leadA_P1_T2 leadB_P1_T2 leadC_P1_T2];
Trial_data_Pat1(:,:,3)=[time_P1_T3 leadA_P1_T3 leadB_P1_T3 leadC_P1_T3];
Trial_data_Pat1(:,:,4)=[time_P1_E leadA_P1_E leadB_P1_E leadC_P1_E];
 
 
%Patient 2
%TRIAL 1 DATA
time_P2_T1=Pat2(:,1);
leadA_P2_T1=Pat2(:,2);
leadB_P2_T1=Pat2(:,3);
leadC_P2_T1=Pat2(:,4);
 
%TRIAL 2 DATA
time_P2_T2=Pat2(:,6);
leadA_P2_T2=Pat2(:,7);
leadB_P2_T2=Pat2(:,8);
leadC_P2_T2=Pat2(:,9);
 
%TRIAL 3 DATA
time_P2_T3=Pat2(:,11);
leadA_P2_T3=Pat2(:,12);
leadB_P2_T3=Pat2(:,13);
leadC_P2_T3=Pat2(:,14);
 
%Exercise data
time_P2_E=Pat2(:,16);
leadA_P2_E=Pat2(:,17);
leadB_P2_E=Pat2(:,18);
leadC_P2_E=Pat2(:,19);
 
%DATA TENSOR 2
Trial_data_Pat2(:,:,1)=[time_P2_T1 leadA_P2_T1 leadB_P2_T1 leadC_P2_T1];
Trial_data_Pat2(:,:,2)=[time_P2_T2 leadA_P2_T2 leadB_P2_T2 leadC_P2_T2];
Trial_data_Pat2(:,:,3)=[time_P2_T3 leadA_P2_T3 leadB_P2_T3 leadC_P2_T3];
Trial_data_Pat2(:,:,4)=[time_P2_E leadA_P2_E leadB_P2_E leadC_P2_E];
 
%Patient 3
%TRIAL 1 DATA
time_P3_T1=Pat3(:,1);
leadA_P3_T1=Pat3(:,2);
leadB_P3_T1=Pat3(:,3);
leadC_P3_T1=Pat3(:,4);
 
%TRIAL 2 DATA
time_P3_T2=Pat3(:,6);
leadA_P3_T2=Pat3(:,7);
leadB_P3_T2=Pat3(:,8);
leadC_P3_T2=Pat3(:,9);
 
%TRIAL 3 DATA
time_P3_T3=Pat3(:,11);
leadA_P3_T3=Pat3(:,12);
leadB_P3_T3=Pat3(:,13);
leadC_P3_T3=Pat3(:,14);
 
%Exercise data
time_P3_E=Pat3(:,16);
leadA_P3_E=Pat3(:,17);
leadB_P3_E=Pat3(:,18);
leadC_P3_E=Pat3(:,19);
 
%DATA TENSOR 3
Trial_data_Pat3(:,:,1)=[time_P3_T1 leadA_P3_T1 leadB_P3_T1 leadC_P3_T1];
Trial_data_Pat3(:,:,2)=[time_P3_T2 leadA_P3_T2 leadB_P3_T2 leadC_P3_T2];
Trial_data_Pat3(:,:,3)=[time_P3_T3 leadA_P3_T3 leadB_P3_T3 leadC_P3_T3];
Trial_data_Pat3(:,:,4)=[time_P3_E leadA_P3_E leadB_P3_E leadC_P3_E];
 
%All  data matrix
Data(:,:,:,1)=Trial_data_Pat1;
Data(:,:,:,2)=Trial_data_Pat2;
Data(:,:,:,3)=Trial_data_Pat3;