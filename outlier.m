function [answer] = outlier(my_data)
%identify cell blocks in which outliers reside (find outliers) with
%comparitive boxplots of before and after outlier removal, superimposed
%histogram before and after, post removal boxplot and turned histogram.
%Also finds the mean before outlier removal and after. No deletions from
%data set occur.
if (isoutlier(my_data)<0.5)
   disp('no outliers detected')
else
    x = (isoutlier(my_data));
    y = find(x);
    combined = [my_data,x];
    datatable = array2table(combined);
    no_outlier=(datatable.combined1(datatable.combined2==0));
    no_out_length = length(no_outlier);
    orig_length = length(my_data);
    no_outlier(no_out_length:orig_length)=nan;
   %MEANS---------------------------------------------
    orig_mean=mean(my_data);
    no_out_mean=nanmean(no_outlier);
    disp('Original mean:');
    disp(orig_mean);
    disp('No outlier mean:');
    disp(no_out_mean);
   
    %BOXPLOT------------------------------------------------
    boxplot([my_data,no_outlier],'Notch','on','Labels',{'Original','No Outliers'});
    xlabel('Data');
    ylabel('Value');
   %HISTOGRAM------------------------------------------------
   figure;
   histogram(my_data);
   hold on
   histogram(no_outlier);
   hold off
   xlabel('Value');
   ylabel('Frequency');
   legend('Orignal Data','No outlier Data');
   %HISTOGRAM & BOXPLOT-------------------------------------- 
    figure;
    subplot(1,2,1)
    histogram(no_outlier,'Orientation','horizontal')
    xlabel('Frequency');
    ylabel('Value');
    title('No outlier histogram');
    subplot(1,2,2);
    boxplot(no_outlier);
    ylabel('Value');
    title('No outlier boxplot');
    
    
    
    answer=y;
end