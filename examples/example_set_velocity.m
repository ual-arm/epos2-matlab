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

%Enable Operation
if (1)
    ok=motor1.cmd_enable();
    
    
end
%Disable Operation
    ok=motor1.cmd_disable();
    

 %Start Homing
 %Section 8.2.90
    ok=motor1.cmd_homing();
    
 
 %Start Profile Position Mode
    
    ok=motor1.cmd_startProfilePositionMode();
   
    
    %StartVelocityMode
    
    ok=motor1.cmd_startVelocityMode();
    
    %ReadVelocity
    
    f=epos2_frame();
    f.opcode=epos2_frame.WRITE_OPCODE;
    f.data=[makewordh('','6B'), makewordh('01','00'), makewordh('',''), makewordh('','')];
    motor1.send(f);
    
    
    %SendVelocity
    %Section 8.2.54 Velocity Mode Setting Value
    
    ok=motor1.cmd_sendVelocity();
    
    
    %Start Current Mode
    f=epos2_frame();
    f.opcode=epos2_frame.WRITE_OPCODE;
    f.data=[makewordh('60','60'), makewordh('01','00'), makewordh('00','FD'), makewordh('00','00')];
    motor1.send(f);
    
    %Read Current
    
    f=epos2_frame();
    f.opcode=epos2_frame.WRITE_OPCODE;
    f.data=[makewordh('10','01'), makewordh('20','27'), makewordh('01','00'), makewordh('00','00')];
    motor1.send(f);

