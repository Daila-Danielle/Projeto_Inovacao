from SchneiderM340 import ModbusDriver,Temporizadores
from pyModbusTCP.utils import get_bits_from_int,set_bit

Ton1 = Temporizadores.Timer()
Ton2 = Temporizadores.Timer()

M340= ModbusDriver.driver("SchneiderM340/PLC_Tags.json")

Unity = M340.Read()

while(1):
    Ton1.Ton(1)
 
    if Ton1.Q: 
        Unity = M340.Read()
       

        print(get_bits_from_int(Unity["REL04001"]["Tags"]["CMD"],16)[0])

        Unity["REL04001"]["Tags"]["CMD"]=set_bit(Unity["REL04001"]["Tags"]["CMD"],2)


        


        
        M340.Write(Unity)


    
       
       
   

    




    



        





