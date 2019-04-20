function [m,n,X,y,SVMdata]=readWDBCdata()

    datafile = 'wdbc.txt';
    fid = fopen(datafile,'r');
    format=strcat('%d %s',repmat(' %f',1,30));
    SVMdata = textscan(fid,format,'delimiter',',');
    fclose(fid);

    n = size(SVMdata,2)-2;
    m = size(SVMdata{1},1);

    y = zeros(m,1);
    y = strcmp(SVMdata{2},'B')- strcmp(SVMdata{2},'M');
    X = zeros(m,n); 
    for i = 1: n
        X(:,i) = SVMdata{i+2};
    end
end

