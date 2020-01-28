import serial
from time import sleep

"""
Продвинутый пример, оптимизированный под особенности буфера Pioneer
Поскольку буфер Pioneer при интенсивной отправке пакетов переполняется, рекомендуем использовать систему состояний. т.е отправлять только новое значение
"""

command={'no':b'0','red':b'1','blue':b'2'} #не обязательная часть программы, но так легче использовать наборы данных

ser=serial.Serial("/dev/ttyS0",9600) # обьявление сериал порта /dev/ttyS0 - GPIO RX/TX, /dev/ttyAM0 - usb uart
sost=command['no'] #начальное состояние

def change_n(new_sost,tm=0): #функция изменение состояния, принимает новое состояние и суммарное время предыдущих sleep
    global ser 
    global sost
    if (sost!=new_sost):
        ser.write(new_sost)# отправка данных на lua 
        sost=new_sost # перезапись состояний
        sleep(0.08-tm) # 0.08 время синхронизации с коптером

i=0
# рекомендуем циклическую структуру программы
while True:
    if (i<100):
        new_sost=command['red']
    elif (i<200):
        new_sost=command['blue']
    else:
        i=0
    i+=1
    change_n(new_sost)