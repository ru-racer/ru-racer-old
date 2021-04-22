clear all
close all
global Xd

% test
t = tcpip('127.0.0.1', 6340);
fopen(t);
fclose(t);
fopen(t);

% figureHandle = figure('Name','Data','Color',[0 0 0]);
% axesHandle = axes('Parent',figureHandle,'YGrid','on','YColor',[1 1 1],'XGrid','on','XColor',[1 1 1],'Color',[0 0 0]);
% xlabel(axesHandle,'Number of Samples');
% ylabel(axesHandle,'Value');
% hold on;
% plotHandle = plot(axesHandle,0,'-y','LineWidth',1);

tic
% figure
% hold on
Sensors_=zeros(10,1);
time=zeros(1,1);
sensors=zeros(1,10);
inupts=zeros(1,6);
% h.XDataSource = 'time';
% h.YDataSource = 'Sensors_';
% figure
% h = plot(time,Sensors_);
while true
datatosend=['$$|',strrep(num2str(inupts,4), '   ', '|'),'$$'];
while length(datatosend)<100
    datatosend=[datatosend,'&'];
end
fwrite(t,datatosend);
counter=0;
while t.BytesAvailable<=0
pause(.001)
counter=counter+1;
    if counter>1000;
      'No data, try to reopen the port'
      fclose(t);
      try
      fopen(t)
      'port is open'
      catch
      'can not open the port'
      end
    end
end
rdata = fread(t,t.BytesAvailable);
rdata=['',rdata'];
rdata=strrep(rdata,'|',' ');
rdata=strrep(rdata,'$','');
sensors=str2num(rdata);
sensors=sensors(1:10);
% % % % % % % % %  Cntroller
[inupts,xd]=Lab_Con(sensors,sensors(1),[.7 .1],1);
% % % % % % % % % 
Sensors_=[Sensors_(:,1:end) sensors'];
plot(Sensors_(1,:),Sensors_(2,:),xd(1),xd(2),'*')

time=[time(1,1:end) toc];
toc-time(end-1)
% set(figureHandle,'Ydata',sensors(1));
end