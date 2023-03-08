from SchneiderM340 import ModbusDriver
import json




with open("SchneiderM340/PLC_Tags.json",'r') as Tags_Json:
            Tags = json.load(Tags_Json)
           
        Data=M340.Read(Tags["REL04001"]["Adrres"]["ADDR"],len(Tags["REL04001"]["Tags"]))

        interacao=0
        for itens in Tags["REL04001"]["Tags"]:

            Tags["REL04001"]["Tags"][itens] = Data[interacao]
            interacao =+1

        with open("SchneiderM340/PLC_Tags.json",'w') as Tags_Json:
           json.dump(Tags,Tags_Json)