function saveState(fileName, net, stats) %#ok<INUSD>
% saveState(fileName, net, stats)
%
% Save network and statistics for the current epoch.
% Files are saved in v7.3 format to allow nets with > 2GB memory.

% Extract the fields from the DAG class
net = net.saveobj() ; %#ok<NASGU>

% Determine whether to use new matfile format
netInfo = whos('net');
netSize = netInfo.bytes;
if netSize > 2e9,
    matVer = '-v7.3';
else
    matVer = '-v6';
end;

% Save to file
save(fileName, 'net', 'stats', matVer);