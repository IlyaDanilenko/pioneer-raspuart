# Pioneer-RaspUART
Geoscan Pioneer with Raspberry Pi Tutorial

### Подготовка Raspberry Pi
Данный туториал написан для интерфейса UART на пинах GPIO14(TX) и GPIO15(RX), но возможно использование и USB портов со специальным переходником usb->uart

Для работы с интерфейсом UART на Raspberry Pi установите библиотеку PySerial

```
pip3 install pyserial
```
:heavy_exclamation_mark: ВАЖНО: перед тем как начать использовать UART настройте пины на Raspberry ( [Гайд](https://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3-4/) все пункты кроме "Disabling the Console" )

### Описание репозитория
* onechar - примеры и объяснение передачи одного символа

##### @ With Love for Geoscan Pioneer Community