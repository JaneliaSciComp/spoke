function spoke(varargin)
% Launcher for Spoke application 
% 
% spoke(): Run Spoke on first probe on Imec Phase3B2 hardware connected to same machine (loopback remote command server)
% spoke(probeType): Run Spoke using specified hardware, one of {'whisper' 'imec3a' 'imec3b2'}
% spoke(probeNumber): Specify which probe number (zero-indexed) to use, supported for Phase3B2 hardware only
% spoke(...,ipAddress): Run Spoke on separate machine from neural probe connected to SpikeGLX server at IP address 'XX.XXX.XX.XXX'

% See project wiki for user & developer documentation 

% Fix for freezing of MATLAB when running in hardware OpenGL mode.
% TODO: Fix Spoke to work with Hardware Rendering!!
opengl('save','software');

% make the spoke main controller object

probeType = 'imec3b2'; % Default to Imec Phase3B2 probes
probeNumber = 0; %Default to first detected probe

if nargin == 0
    ipAddress = detectIPAddress();
else
    remoteServer = ischar(varargin{end}) && ~isnan(str2double(varargin{end}(1)));
    
    if remoteServer
        ipAddress = varargin{end};
    else
        ipAddress = detectIPAddress();
    end
    
    if isnumeric(varargin{1})
        probeNumber = varargin{1};
    elseif ischar(varargin{1})
        probeType = varargin{1};
    else
        assert(false,'First argument must specify either a probeType (char array) or a probeNumber (numeric)');
    end
end

hSpoke = SpokeModel(ipAddress, probeType, probeNumber);
hSpokeCtl = SpokeController(hSpoke);

assignin('base','hGrid',hSpoke);
assignin('base','hGridCtl',hSpokeCtl);

set(hSpokeCtl.hGUIsArray,'CloseRequestFcn',@(src,evnt)hSpoke.delete); % For the moment GUIs owned by Controller are never really killed

hSpoke.initialize();

    function ipAddress= detectIPAddress()
        [~,s] = system('ipconfig /all');
        
        % Check IPv4 address of this machine. Note, this only works on newer machines.
        out = regexp(s,'IPv4 Address[^0-9]*([.0-9]*)','tokens');
        if not(numel(out) > 0)
            % In case IPv4 address check failed, try a different regexp compatible with older machines.
            out = regexp(s,'IP Address[^0-9]*([.0-9]*)','tokens');
        end
        assert(numel(out) > 0, 'Unable to determine the IP address for this machine');
        ipAddress = out{1}{1};
        sprintf('Detected local IP Address %s. Connecting to the SpikeGL Remote Connection server.',ipAddress);
    end

end
