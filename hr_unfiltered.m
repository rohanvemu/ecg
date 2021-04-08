%% heart rate calculation, unfiltered
Heart_rate=[];
for j=1:length(Data(1,1,1,:))% loops over patients
for i=1:length(Data(1,1,:,1))-1 %loops over the number of trails (% not  including exercise data)
    
%Use lead B to find heart rate 
peaks=islocalmax(Data(:,3,i,j),'MinProminence',0.5);
 
%heart rate calculation
sum_peaks_P3T1=sum(peaks);% number of heart beats recorded
num_sec=Data(end,1,i,j)/60;  %  divide by number total number of minutes
HR=sum_peaks_P3T1/num_sec;
Heart_rate(i,j)=HR;
 
end
 
end
% patient 3  Trail 2 analysis (needs a different prominence value)
peaks_P3T2=islocalmax(Data(:,3,2,3),'MinProminence',0.3);
sum_peaks_P3T2=sum(peaks_P3T2);% number of heart beats recorded
num_sec=Data(end,1,1,3)/60;  %  divide by number total number of minutes
HR_P3T1=sum_peaks_P3T2/num_sec;
Heart_rate(2,3)=HR_P3T1;
%% Exercise data
%Patient  1
time=Data(:,1,1,3);
ex1=(Data(:,2,4,1));
peaks_ex_1=islocalmin(ex1,'MinProminence',0.7);
sum_ex_1=sum(peaks_ex_1);
HR_E1=(sum_ex_1)/2
 
 
%Patient 2
ex2=(Data(:,2,4,2));
peaks_ex_2=islocalmin(ex2,'MinProminence',0.3);
sum_ex_2=sum(peaks_ex_2);
HR_E2=(sum_ex_2)/2
 
%Patient 3
ex3=(Data(:,3,4,1));
peaks_ex_3=islocalmin(ex3,'MinProminence',0.6);
sum_ex_3=sum(peaks_ex_3);
HR_E3=(sum_ex_3)/2
