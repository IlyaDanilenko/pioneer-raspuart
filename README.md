# Pioneer-RaspUART
Geoscan Pioneer with Raspberry Pi Tutorial

### Подготовка Raspberry
Данный гайд написан для интерфейса UART на портах GPIO14(TX) и GPIO15(RX), возможно использование и USB портов со специальным переходником usb->uart

Для работы с интерфейсом UART на Raspberry установите библиотеку PySerial

```
pip3 install pyserial
```
:heavy_exclamation_mark: ВАЖНО: перед тем как начать использовать UART настройте порт на Raspberry ([Гайд](https://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3-4/) все пункты кроме Disabling the Console)

@ With Love for Geoscan Pioneer Community