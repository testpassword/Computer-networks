1. Что такое потенциальное кодирование?

    >Компьютерные данные – двоичные «1» и «0» – обычно изображаются в виде потенциалов соответственно высокого и низкого уровней. Такой метод представления двоичных данных является наиболее естественным и простым и называется потенциальным кодированием.

2. При каком методе кодирования скорость модуляции (бод) и скорость передачи данных (бит в секунду) совпадают?

3. Как изменяется спектр сигнала при потенциальном кодировании, если в передаваемом сообщении появляется длинная последовательность нулей или единиц?

4. В каком случае при потенциальном кодировании в спектре сигнала отсутствует постоянная составляющая?
    
5. Почему потенциальные коды на каналах тональной частоты никогда не используются?
    
6. В чем отличие импульсных кодов от потенциальных?
    
    >Для представления двоичных нулей и единиц в потенциальных кодах используются разные значения потенциала сигнала, а в импульсных кодах – импульсы разной полярности или перепады потенциала.

7. Достоинства и недостатки методов кодирования NRZ, RZ, AMI, MLT-3, Манчестер, ….
    
8. Проиллюстрировать на диаграмме методы кодирования NRZ, RZ, AMI, MLT-3, Манчестер, ….
    
9. У какого из известных вам методов верхняя граница частот имеет наименьшее значение?
    
10. Нарисовать диаграммы методов кодирования NRZ, RZ, AMI, MLT-3, Манчестер 2… для сообщения, заданного в шестнадцатеричном коде: С5.
    
11. Определить частоту основной гармоники для сообщения, заданного в шестнадцатеричном коде: С5, при использовании методов кодирования NRZ, RZ, AMI, MLT-3, Манчестер 2….
    
12. Какой метод кодирования применяется в ЛВС Ethernet и Token Ring?
    
    >Манчестерский;
    >дифференциальный манчестерский
    
13. Перечислить методы логического кодирования.
    
    >Скремблирование разными полиномами, XB/YB - где X и Y - разные цифры
    
14. Для чего используются методы логического кодирования?
    
    >Ликвидация длинных последовательностей 0 или 1, чтобы не было постоянной составляющей, сдвигающей спектр сигнала в область низких частот где скорость ниже
    
15. Пояснить принципы метода избыточного кодирования и скремблирования.
    
    >Замена группы байтов на другую группу байтов с добавлением нового байта; 
    >замена через полином, размер последовательности не меняется
    
16. Какой метод логического кодирования используется в ЛВС Fast Ethernet и FDDI?
    
    >4B/5B или 8B/6T;
    >4В/5В
    
17. Пояснить суть методов логического кодирования 4В/5В, 5В/6В, 8В/10В, 8В/6Т.
    
    >С помощью специальных математических преобразований группы битов превращаются в другие последовательности
    
18. Что такое «запрещенные коды» в методах избыточного кодирования?
    
    >Последовательности битов, сигнализирующие приёмнику о ошибках передачи
    
19. Какой метод избыточного кодирования обладает наибольшей (наименьшей) избыточностью и почему?
    
    >8B/6T - 8 бит заменяются на 6 троичных символов, скремблирование - т.к. избыточные биты отсутствую полностью
    
20. Сколько избыточных кодов содержит метод кодирования 4В/5В (5В/6В, 8В/10В, 8В/6Т).
    
    >1, 1, 2, 1, 473 - НЕ УВЕРЕН В ПРАВИЛЬНОСТИ!
    
21. Основной недостаток методов избыточного кодирования.
    
    >Избыток данных - передаются лишние биты
    
22. Что такое дескремблер?
    
    >Дескремблер восстанавливает исходный код с использованием обратного соотношения к скремблированию
    