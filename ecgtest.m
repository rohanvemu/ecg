%Rohan Vemu, BE310, ECG Analysis
%% General Setup to Help Show Peak Visualization 
load("subject1.mat"); 
lead1=data(:,1);
lead2=data(:,2); %focus on lead2 since cleanest data
lead3=data(:,3);

time_total=350; % seconds
n=length(data);
time_to_idx=n/time_total;

time_scale = 10;
minute_window= time_scale*time_to_idx;
 
moving_window=lead2(1:minute_window);
window_array=1:length(moving_window);
plot(moving_window);
 
TF = islocalmax(lead2(1:minute_window),'MinProminence', 1); %for heart rate
TF2 = islocalmin(lead2(1:minute_window),'MinProminence', 0.05); %for QT time
 
plot(window_array,moving_window,window_array(TF2),moving_window(TF2),'r*')
%% Finding Typical Heart Rate
load("subject2.mat");

 
lead1=data(:,1);
lead2=data(:,2);
lead3=data(:,3);

time_total=350; % seconds
n=length(data);
time_to_idx=n/time_total;

time_scale = 0.5; %change time_scale to 0.5 for instantaneous heart rate
minute_window = time_scale*time_to_idx;

store_idx = zeros(1, n/minute_window);

for i = 2:length(store_idx)
 
move_window=lead2(minute_window*(i-1):minute_window*(i));
 
maxpeak = islocalmax(move_window,'MinProminence',1);

store_idx(i) = sum(maxpeak);

end

store_idx = store_idx(2:end);
heart_rate_plot = store_idx/time_scale * 60;
heart_rate = mean(store_idx)/time_scale * 60;

std_dev = std(heart_rate_plot);
%% Finding the Instantaneous Heart Rate 

move_window=lead2(1:end);
 
maxpeak = islocalmax(move_window,'MinProminence',1);
idx = find(maxpeak == 1);
diff_idx_max = diff(idx);
time_difference = diff_idx_max ./ time_to_idx; 
heart_rate_inst = 60./time_difference;
heart_rate_inst = heart_rate_inst(heart_rate_inst < 200);

time_heart = linspace(0, 350, length(heart_rate_inst));
plot(time_heart, heart_rate_inst)
xlabel("Time (s)")
ylabel("Instantaneous Heart Rate (bpm)")
set(gca,'FontSize',14)
%% Finding the QT Time 
load("subject2.mat"); 
lead2 = data(:,2);
boundaries = islocalmin(lead2(1:100000),'MinProminence',0.15);
minimum_pts=find(boundaries);

Q_idx=minimum_pts(1:3:end);
S_idx=minimum_pts(2:3:end);
T_idx=minimum_pts(3:3:end);

cutoff = min([length(Q_idx), length(S_idx), length(T_idx)]);

QT_idx = T_idx(1:cutoff) - Q_idx(1:cutoff);
QT_time = QT_idx / time_to_idx;

mean_QT = mean(QT_time);
std_QT = std(QT_time);
%% Fourier Transform of Data 
% find the local mean across the entire signals
load("subject2.mat");
lead2=data(:,2);
normalized=linspace(0,1,(length(lead2))/2);
moving_mean = movmean(lead2, 7000);
signal=lead2-moving_mean;

figure(1); 
plot(signal(1:10000))
figure(2); 
plot(lead2(1:10000)) 
 
%compute fft and power of the signal
Fs = 2000;
L = length(lead2);
f = Fs*(0:(L/2))/L;

Y=fft(signal);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% signal_fft_mag=abs(Y);
% signal_fft_abs=signal_fft_mag((1: 1+length(signal_fft_mag)/2));
% signal_power=signal_fft_abs.^2;

%% Plotting Signal Power, and Magnitude
figure(3)
plot(f,P1)
xlabel("Frequency (Hz)")
ylabel("Magnitude of Signal")
grid on
grid minor
 
%plot the magnitude of the fft signal
figure(4)
plot(f,P1.^2)
xlabel("Frequency (Hz)")
ylabel("Power of the Signal (W)")
grid on
grid minor
set(gca,'FontSize',14)
%%
sampledata = xlsread("2021_BE310_ECG_resting_3_patient.xlsx");
lead2_sample = sampledata(:, 4);
%%
plot(time_heart, heart_rate_inst)
hold on 
plot(time_heart2, heart_rate_subj2)
xlabel("Time (s)")
ylabel("Instantaneous Heart Rate (BPM)")
set(gca,'FontSize',14)
legend("Subject 1", "Subject 2")