% ------------------------------------------------------------------------
% Example: Demonstrate basic usage of epos2 matlab toolkit
%
% ------------------------------------------------------------------------

% Create object & set params:
motor1 = Epos2Controller();
motor1.serial_portname = 'COM3';
motor1.serial_baudrate = 115200; 

% Try to connect:
motor1.connect();

% Velocity command:



% You can disconnect the object by typing "clear" or "motor1.disconnect()"
