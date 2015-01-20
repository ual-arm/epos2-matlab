classdef epos2_frame
    %EPOS2_FRAME Data structure to hold one EPOS2 communication frame
    % Frame format as specified in EPOS2-Communication-Guide, section 5.1.2
    %  
    %   opcode   Len-1 |  D[0]       ...  D[Len-1]  |  CRC
    %    8 bit   8 bit | 16 bit      ...   16 bit   | 16 bit
    %        HEADER    |             DATA     

    properties (Constant)
        READ_OPCODE   = uint8( h('0x10') );
        WRITE_OPCODE  = uint8( h('0x11') );
        
    end

    
    % Public data members:
    properties(Access=public)
        opcode = uint8(0);  % Opcode
        data   = uint16([0,0,0,0]); % Variable-length array of data
        
        crc    = uint16(0); % CRC (Automatically computed, don't set it)
    end

    methods(Static)
        function [f]=build_frame(opcode,data)
            % Constructor from values: data
            f = epos2_frame();
            f.opcode = opcode;
            f.data = data;
        end
        
    end % end static methods
    
    methods(Access=public)
        function [me]=epos2_frame()
            % Default constructor
        end
        
        function [CRC] = calc_crc(me)
            % Computes the CRC code (...)
            % Based on code by: ...
            len=uint8(length(me.data)-1);
            
            % Assemble everything as uint16:
            % [ (opcode<<8 | len ), DATA]
            DataArray=[...
                bitor(bitshift(uint16(me.opcode),8),uint16(len)  ),...
                me.data,...
                uint16(0)];
            
            CRC = uint16(0);
            for i=1:length(DataArray)
                shifter = uint16(h('8000'));
                c = uint16(DataArray(i));

                do_repeat=true;
                while(do_repeat)
                    %carry = bitand(CRC, uint16(myhex2dec('8000')), 'uint16');
                    carry = bitand(CRC, uint16(32768), 'uint16');
                    CRC = bitshift(CRC,1,'uint16');
                    if(bitand(c, shifter, 'uint16'))
                        CRC = CRC +  1;
                    end
                    if(carry)
                        %CRC = bitxor(CRC,uint16(myhex2dec('1021')),'uint16');
                        CRC = bitxor(CRC,uint16(4129),'uint16');
                    end
                    shifter = bitsrl(shifter,1);
                    
                    do_repeat = (shifter~=0);
                end
            end
        end
       
    end
    
end

