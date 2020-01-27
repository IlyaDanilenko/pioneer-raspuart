# Передача одного символа

На данной странице будет рассмотрен случай передачи одного символа

### Теория Python

Pioneer воспринимает значения типа byte. Мы не рекомендуем использовать привидение типов byte(), вместо этого используйте конструкцию b' '

Отправка сообщений осуществляется через интерфейс UART при помощи __PySerial__

```
ser.write(b) # ser- объект класса serial.Serial, b - символ, обернутый в b'' 
```

Для синхронизации Raspberry и Pioneer после каждого блока отправки пакета должен стоять

```
sleep(tm) # tm - время синхронизации
```
 :heavy_exclamation_mark: __ВАЖНО__: Время указанное в ```sleep()``` должно совпадать с тем что указано в ```Timer.new()```

:heavy_exclamation_mark: __ВАЖНО__: Буфер Pioneer при слишком интенсивной отправке пакетов переполняется

В папке [Python](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/onechar/Python):
* [hello_raspberry_base.py](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/onechar/Python/hello_raspberry_base.py) - базовый (не оптимизированный) пример, советуем ознакомится с ним в первую очередь
* [hello_raspberry_optim.py](https://github.com/IlyaDanilenko/pioneer-raspuart/blob/master/onechar/Python/hello_raspberry_optim.py) - продвинутый (оптимизированный) пример, предлагаем один из вариантов решение проблемы переполнения буфера на стороне Raspberry

### Теория Lua