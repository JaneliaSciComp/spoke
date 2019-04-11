% myobj = SpikeGL()
% myobj = SpikeGL( host )
% myobj = SpikeGL( host, port )
%
%     Construct a new @SpikeGL instance and immediately attempt
%     a network connection. If omitted, the defaults for host and
%     port are {'localhost, 4142}.
%
function [s] = SpikeGL3a( varargin )

    host = 'localhost';
    port = 4142;

    if( nargin >= 1 )
        host = varargin{1};
    end

    if( nargin >= 2 )
        port = varargin{2};
    end

    if( ~ischar( host ) || ~isnumeric( port ) )
        error( 'Host must be a string and port must be a number.' );
    end

    s               = struct;
    s.host          = host;
    s.port          = port;
    s.in_chkconn	= 0;
    s.handle        = -1;
    s.ver           = '';

    s = class( s, 'SpikeGL3a' );
    s = ChkConn( s );
end
