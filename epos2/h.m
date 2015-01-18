function [ num ] = h( str )
%H Convert a string hexadecimal number like '0x10' or '0x1A9F' to number

    num=sscanf(str,'%x');
end

