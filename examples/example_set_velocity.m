% ------------------------------------------------------------------------
% Example: Demonstrate basic usage of epos2 matlab toolkit
%
% ------------------------------------------------------------------------

%% Test frame CRC calc:
if (0)
    f=epos2_frame();
    f.opcode=epos2_frame.READ_OPCODE;
    f.data=[makewordh('20','03'), makewordh('02','01')];
    crc=f.calc_crc();
    fprintf('%04X\n',crc)
    % Should be: 0xA888
end

%% Test real comms:
% Create object & set params:
motor1 = Epos2Controller();
motor1.serial_portname = 'COM3';
motor1.serial_baudrate = 115200; 

% Try to connect:
motor1.connect();

% Velocity command:



% You can disconnect the object by typing "clear" or "motor1.disconnect()"
