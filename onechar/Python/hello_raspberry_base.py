import serial
from time import sleep

"""
Базовый пример, в данном примере возможно переполнение буфера в Pioneer
"""

ser=serial.Serial("/dev/ttyS0",9600) # обьявление сериал порта /dev/ttyS0 - GPIO RX/TX, /dev/ttyAM0 - usb uart

def uart_write(ch,tm=0): #tm - суммарное время предыдущих sleep, ch - отправляемый символ
    global ser
    ser.write(ch) # отправка данных на lua 
    sleep(0.08-tm) # 0.08 время синхронизации с коптером

i=0

# рекомендуем циклическую структуру программы
while True:
    if (i<100):
        uart_write(b'1')
    elif (i<200)
        uart_write(b'2')
    else:
        i=0
    i+=1