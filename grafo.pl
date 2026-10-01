%-----------Hechos--------------

%conexiones directas
conexion(vancouver,edmonton,16).
conexion(vancouver,calgary,13).
conexion(edmonton,saskatoon,12).
conexion(calgary,regina, 14).
conexion(calgary,edmonton, 4).
conexion(saskatoon,calgary, 9).
conexion(saskatoon,winnipeg, 20).
conexion(regina,saskatoon, 7).
conexion(regina,winnipeg, 4).


%------------Reglas-------------
viajar(Origen, Destino, Costo) :-
    conexion(Origen, Destino, Costo). %Caso base


viajar(Origen, Destino, Costo) :- %Viajar de Origen a Destino pasando por Intermediario
    conexion(Origen, Intermediario, Costo_inicial) , conexion(Intermediario, Destino, Costo_intermedio), 
                Costo is Costo_inicial + Costo_intermedio.

viajar(Origen, Destino, Costo) : -
    conexion(Origen, Intermediario, Costo1),
    viajar(Intermediario, Destino, Costo2),
    Costo is Costo1 + Costo2.
    