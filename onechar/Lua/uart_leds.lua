local uartNum = 1 --����� UART
local baudRate = 9600 -- �������� �������� ������
local stopBits = 1 -- �������� ��������� � �������� �����
local parity = Uart.PARITY_NONE -- �������� �� ��������
local uart = Uart.new(uartNum, baudRate, parity, stopBits) -- �������� ��������� ������


local leds=Ledbar.new(4) -- ������ LedBar, ���� ���������� ������������ �� �����

local function color(r,g,b) -- ������� ������� ���� ����������� ����� ������
    for i=0,3,1 do
        leds:set(i,r,g,b)
    end
end

local sync = 0.06 -- �������� �������������

local inp = ''
local function takeFunc()
    inp = uart:read(1)
    if(inp == '0') then
        color(0,0,0)
    elseif(inp == '1') then 
        color(1,0,0)
    elseif(inp == '2') then
        color(0,0,1)
    end
end



function callback(event) --������������ �������
end

t = Timer.new(sync, takeFunc) --������, ��������� ������� takeFunc ������ sync ������
color(0,0,0) 
t:start()
