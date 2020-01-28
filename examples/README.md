# Передача одного символа

На данной странице будет рассмотрен случай передачи одного символа

### Теория Python

Pioneer воспринимает значения типа byte.

Отправка сообщений осуществляется через интерфейс UART при помощи __PySerial__

```
ser.write(b) # ser- объект класса serial.Serial, b - строка типа byte
```

Для отправки одного символа рекомендуем использовать конструкцию

```
b' '
```

Для отправки множества данных рекомендуем использовать
```
byte(you_str,'utf-8') # you_str - ваши данные приведённые в тип str
```


Для синхронизации Raspberry и Pioneer после каждого блока отправки пакета должен стоять

```
sleep(tm) # tm - время синхронизации
```
 :heavy_exclamation_mark: __ВАЖНО__: Время указанное в ```sleep()``` должно совпадать с тем что указано в ```Timer.new()```

:heavy_exclamation_mark: __ВАЖНО__: Буфер Pioneer при слишком интенсивной отправке пакетов переполняется

В папке [Python](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/examples/Python):
* [hello_raspberry_base.py](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/examples/Python/hello_raspberry_base.py) - базовый (не оптимизированный) пример, советуем ознакомиться с ним в первую очередь
* [hello_raspberry_optim.py](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/examples/Python/hello_raspberry_optim.py) - продвинутый (оптимизированный) пример, предлагаем один из вариантов решение проблемы переполнения буфера на стороне Raspberry

### Теория Lua

Для создания объекта UART используется конструкция вида

```
local uartNum = 1
local baudRate = 9600
local stopBits = 1
local parity = Uart.PARITY_NONE 

local uart = Uart.new(uartNum, baudRate, parity, stopBits)
```

----------------------
Параметр | Назначение
---------|------------
uartNum  | Номер используемого UART (1 или 4)
baudRate | Скорость передачи данных (должен совпадать с baudRate в Raspberry)
stopBits | Количество стоповых битов (необязательный параметр, по умолчанию Uart.ONE_STOP)
parity | Проверка на пакета чётность (Uart.PARITY_NONE, Uart.PARITY_EVEN, Uart.PARITY_ODD)

Класс UART для пионера имеет ряд основных функций

----------------------
Функция | Описание
---------|------------
new(num, rate, parity, stopBits) | Создать объект UART с указанными настройками
read(self, size) | Прочитать __size__ байт
write(self, data, size) | Отправить данные __data__ длиной __size__ ()
bytesToRead(self) | Возвращает количество байт, доступных для чтения 
setBaudRate(self, rate) | Устанавливает скорость передачи данных на __rate__

В языке Lua функции принимающие self в качестве параметра могут быть использованы объектами с помощью оператора " __:__ ". Оператор двоеточие является неочевидным способом передать значение self. 

__Пример:__
```
Uart.read(uart, 1) 
--Аналогичен
uart:read(1)
```
В папке [Lua](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/examples/Lua):
* [read_fixBytes.lua](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/examples/Lua/read_fixBytes.lua) - пример чтения фиксированного количества байт, в данном случае одного
* [read_availableBytes.lua](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/examples/Lua/read_availableBytes.lua) - пример приёма всех доступных для чтения байт
