%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HANDS-ON in "Cardiovascular Self-Monitoring in Sport"
% The assignment consists of processing cardiac signals (heart-rate series
% and electrocardiogram) acquired from 3 athletes by using wearable
% sensors. The aim is to characterize the cardiac status of the subject,
% proving a cardiac risk assessment.
% 
% The group will provide the main indices for the assessment of
% cardiovascular risk. The total score is 10.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Data loading and Pre-processing
load('...');

ECG=Data.ECG; %Electrocardiogram (ECG, mV)
HRS=Data.HR; %Heart-rate series (HRS, bpm)

SF_HR=1; % Hz; Heart-rate series sampling frequency
SF_ECG=250; % Hz; Electrocardiogram sampling frequency

%Anamnestic data
Age=; %years
Sex=; %Male=0; Female=1;
Smoker=; %NO=0; YES=1;
Athlete=; %NO=0; YES=1;

%Training Info
ResD=;%Resting Duration (s)
ED=;%Exercise Duration (s)
RecD=;%Recovery Duration (s)

% ECG denoising
[B,A]=butter(3,[0.5 45]/(SF_ECG/2),'bandpass');
ECG=filtfilt(B,A,ECG);

% Pre-exercise phase selection of the ECG
ECG_PreExe=ECG(1:5*60*SF_ECG); 

%R-peak positions computation by Pan-Tompkin-based Algorithm
[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ECG_PreExe,SF_ECG,0);

%Delay removal
RP=[];
delta=round(0.05*SF_ECG);
for i=3:length(qrs_i_raw)-1
    tmp=ECG_PreExe(qrs_i_raw(i)-delta:qrs_i_raw(i)+delta);
    [~,index]=max(tmp);
    RP=[RP; qrs_i_raw(i)-delta+index-1];
end

%% Maximal Heart-Rate Computation

% Compute the Theoreting Maximum Heart Rate(TMHR): 
% TMHR = 208 - 0.7*Age if the subject is not a smoker
% TMHR = 208 - 0.7*Age - 7 if the subject is a smoker
if Smoker==0
    TMHR=208-0.7*Age;
else
    TMHR=208-0.7*Age-7;
end

%User-specific heart-rate threshold
thrHR=0.85*TMHR;

% Percentage of HRS that overcomes TMHR and the percentage of HRS that
% overcomes thrHR
perc_TMHR=100*((length(HRS(HRS>TMHR)))/ED);
perc_thrHR=100*((length(HRS(HRS>thrHR)))/ED);

%% QT-Interval Computation
%Median Beat Computation
Beats=[];
bef=round(0.04*SF_ECG);
aft=round(0.5*SF_ECG);
for i=2:length(RP)-1
    tmp=ECG_PreExe(RP(i)-bef:RP(i)+aft);
    Beats=[Beats tmp];
end
Median_Beat=median(Beats');
MedianRR=median(diff(RP));

%QT Interval Computation
Tend=twaveend_original_tdom(Median_Beat,SF_ECG,MedianRR); 
Qmed=1;
QT=((Tend-Qmed)/SF_ECG);

%QT Inteval Correction
SqrtRR=sqrt(MedianRR/SF_ECG);
QTc=(QT/SqrtRR);
