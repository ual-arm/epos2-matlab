classdef epos2_frame
    %EPOS2_FRAME Data structure to hold one EPOS2 communication frame
    % 

    properties (Constant)
        READ_OPCODE   = h('0x10');
        WRITE_OPCODE  = h('0x11');
        
    end

    
    % Public data members:
    properties(Access=public)
        opcode = uint8(0);  % Opcode
        len    = uint8(0);  % Length
        data   = uint16([0,0,0,0]); % Variable-length array of data
        
        crc    = uint16(0); % CRC (Automatically computed, don't set it)
    end

    methods(Static)
        function [f]=build_frame(opcode,len,d0,d1,d2,d3)
            % Constructor from values: d{0,3} are uint16
            f = epos2_frame();
            f.opcode = opcode;
            f.len = len;
            f.data = uint16([d0,d1,d2,d3]);
        end
        
    end % end static methods
    
    methods(Access=public)
        function [me]=epos2_frame()
            % Default constructor
        end
        
        function [crc] = calc_crc(me)
            warning('TODO!');
            crc=0; 
        end
       
    end
    
end

