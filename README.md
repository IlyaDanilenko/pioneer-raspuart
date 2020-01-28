# Pioneer-RaspUART
Geoscan Pioneer with Raspberry Pi Tutorial

### Подготовка Raspberry Pi
Данный туториал написан для интерфейса UART на пинах GPIO14(TX) и GPIO15(RX), но возможно использование и USB портов со специальным переходником usb->uart

Для работы с интерфейсом UART на Raspberry Pi установите библиотеку __PySerial__

```
pip3 install pyserial
```
:heavy_exclamation_mark: __ВАЖНО__: перед тем как начать использовать UART настройте пины на Raspberry ( [Гайд](https://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3-4/) все пункты кроме "Disabling the Console" )

### Подключение

Перед подключением важно определиться с используемым UART

Убедитесь, что планируемый для использования UART [не занят](https://pioneer-doc.readthedocs.io/ru/master/programming/lua/lua.html#id7) другими устройствами.

__UART1__ на разъеме __X1__ занят, если вы используете:
* Модуль [GPS](https://www.geoscan.aero/themes/geoscan/assets/products/tabs/pioneer/manual/module/gps.html)
* Систему навигации в помещении [Локус](https://www.geoscan.aero/themes/geoscan/assets/products/tabs/pioneer/manual/indoor_nav.html)

Тогда следует воспользоваться __UART4__
![Пример подключения UART4 к Raspberry Pi](/imgs/uart4.png)

Raspberry Pi | Pioneer
------------ | -------------
TX (08) | RX (Разъем X2, пин 4)
RX (10) | TX (Разъем X2, пин 3)
GND | GND

__UART4__ на разъеме __X4__ занят, если вы используете:
* Камеру [OpenMV](https://www.geoscan.aero/themes/geoscan/assets/products/tabs/pioneer/manual/module/openMV.html)

Тогда следует воспользоваться __UART1__
![Пример подключения UART4 к Raspberry Pi](/imgs/uart1.png)

Raspberry Pi | Pioneer
------------ | -------------
TX (08) | RX (Разъем X1, пин 5)
RX (10) | TX (Разъем X1, пин 6)
GND | GND

### Описание репозитория
* [examples](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/examples) - примеры и объяснение передачи данных
* [imgs](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/imgs) - подключение raspberry к пионеру по uart1 и uart4

##### @ With Love for Geoscan Pioneer Community
