%this script is writen by zhaomuen in BNU ,used to check volumes after
%preprocessing.
%This script will not output any file, it just shou the result under commend window.Because it is mor convinent for use. 
%setting up
clear all;
file_dir='.../Data_CBD_noFM/';
file_get='/CBD*';
data_dir='/fmri/*';
%%out_dir='/brain/iCAN/home/zhaomuen/SPM/spm_scripts';
filename=dir([file_dir,file_get]);
a=[];b=[];
%print volume number

for i=1:length(filename);
    a=filename(i).name ;
    clear dir;
    disp(a) ;
    taskname=dir([file_dir a data_dir]);  
    
    for j=1:length(taskname);
     b=taskname(j).name;
     dir=[file_dir, a '/fmri/' b '/unnormalized'];
     
     if exist(dir);
        cd(dir); 
        disp(taskname(j).name)
%         fid=fopen('tr_n.txt','a');
%         fprintf(fid,'%s\n',num2str(unix('fslinfo swcarI.nii.gz')));
%         fclose(fid);
        unix( sprintf('fslinfo I_all.nii'))
     else
        disp([b,' no this task']);
        j=j+1 ;
     end
     
     
    end
        
    
   
end