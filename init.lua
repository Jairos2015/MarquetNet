--init.lua
print("Setting up WIFI..2...")
--Establecemos forma de trabajo ESP8266 :wifi.STATION
wifi.setmode(wifi.STATION)
--Establecemos ssid y pwd en la STATION
         wifi.sta.config("su SSID","PWD de su SSID")
--Conectar la STATION al AP
         wifi.sta.connect()
--Se hace manual pero tenemos un problema por aqui
print("Conectando estacion...")
	 tmr.delay(20000000)	 

--Creamos cliente tipo net.TCP ; 0 enlace normal 1 enlace ssl

conn=net.createConnection(net.TCP, 0)
-- Conectamos con la IP remota
conn:connect(5050,'192.168.1.32') 
conn:on("receive", function(sck, c)print (c) end)
-- Una vez conectado se puede enviar esto no mas
 conn:send("GET / HTTP/1.1\r\nHost: 192.168.1.32:5050\r\nConnection: keep-alive\r\nAccept:   */*\r\n\r\n")
