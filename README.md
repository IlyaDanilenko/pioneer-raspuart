# Pioneer-RaspUART
Geoscan Pioneer with Raspberry Pi Tutorial

### Подготовка Raspberry Pi
Данный туториал написан для интерфейса UART на пинах GPIO14(TX) и GPIO15(RX), но возможно использование и USB портов со специальным переходником usb->uart

Для работы с интерфейсом UART на Raspberry Pi установите библиотеку __PySerial__

```
pip3 install pyserial
```
:heavy_exclamation_mark: __ВАЖНО__: перед тем как начать использовать UART настройте пины на Raspberry ( [Гайд](https://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3-4/) все пункты кроме "Disabling the Console" )

### Описание репозитория
* [onechar](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/onechar) - примеры и объяснение передачи одного символа, советуем ознакомиться сначало с этим материалом
* [bigdata](https://github.com/IlyaDanilenko/pioneer-raspuart/tree/master/bigdata) - примеры и объяснения передачи множества данных

##### @ With Love for Geoscan Pioneer Community
