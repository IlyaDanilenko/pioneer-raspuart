local uartNum = 1 --Номер UART
local baudRate = 9600 --скорость передачи данных
local stopBits = 1 
local parity = Uart.PARITY_NONE 
local uart = Uart.new(uartNum, baudRate, parity, stopBits) -- создание объекта UART

local leds=Ledbar.new(4) -- объект LedBar, порт управления светодиодами на плате

local function color(r,g,b) -- функция заливки всех светодиодов одним цветом
        leds:set(i,r,g,b)
    end
end

local sync = 0.08 -- задержка синхронизации

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

function callback(event) --Обязательная функция
end

t = Timer.new(sync, takeFunc) --таймер, запускает функцию takeFunc каждые sync секунд
color(0,0,0) 
t:start()
