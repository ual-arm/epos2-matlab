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
%    ok=motor1.cmd_startCurrentMode();
%    ok=motor1.cmd_startVelocityMode();
%    ok=motor1.cmd_sendVelocity(1000);
    ok=motor1.cmd_startPositionMode();
%    ok=motor1.cmd_MaximalFollowingError();
    ok=motor1.cmd_sendTargetPosition(2000);
    ok=motor1.cmd_sendTargetPosition(3000);
    ok=motor1.cmd_startVelocityMode();
    ok=motor1.cmd_sendVelocity(2000);
    ok=motor1.cmd_disable();
   
end
%Disable Operation
%    ok=motor1.cmd_disable();
    

 %Start Homing
 %Section 8.2.90
 %   ok=motor1.cmd_homing();
    
     %Start Current Mode    
      
 %Start Profile Position Mode
    
   %ok=motor1.cmd_startProfilePositionMode();
   
    
    %StartVelocityMode
    

    %ReadVelocity(TO DO)
    
%     f=epos2_frame();
%     f.opcode=epos2_frame.WRITE_OPCODE;
%     f.data=[makewordh('','6B'), makewordh('01','00'), makewordh('',''), makewordh('','')];
%     motor1.send(f);
    
    
    %SendVelocity
    %Section 8.2.54 Velocity Mode Setting Value
    
    
    

    
    %Read Current(TO DO)
    
%     f=epos2_frame();
%     f.opcode=epos2_frame.WRITE_OPCODE;
%     f.data=[makewordh('10','01'), makewordh('20','27'), makewordh('01','00'), makewordh('00','00')];
%     motor1.send(f);
    
    %Send Target Position (Absolute)
    
%     ok=motor1.cmd_sendTargetPosition();
    
    %Send Target Position (Relative)
    
   % ok=motor1.cmd_sendTargetPosition(3);
%     f=epos2_frame();
%     f.opcode=epos2_frame.WRITE_OPCODE;
%     f.data=[makewordh('60','40'), makewordh('01','00'), makewordh('00','3F'), makewordh('00','00')];
%     motor1.send(f);
    
    %Send Current
%     
%     ok=motor1.cmd_sendCurrent();
