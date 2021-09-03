% assignment 2
% select a set of raiding warrior
enum WARRIOR;
WARRIOR: dummy;
enum CLAN; % the clan they belong too

int: l; % minimum raid party size
int: u; % maximum raid party size
int: m; % limit of hatreds

array[WARRIOR] of int: strength;
array[WARRIOR] of CLAN: clan;

array[CLAN,CLAN] of 0..1: hates;
%-----------------------------------> DESARROLLO DE CÓDIGO CON CONJUNTOS ¿DE CARDINALIDAD FIJA O CARDINALIDAD LIMITADA? <-------------------------------------------------
set of WARRIOR: warrior;

%array [CLAN] of set of WARRIOR: c;

set of WARRIOR: clan1 = {WARRIOR[2], WARRIOR[3], WARRIOR[4]};
set of WARRIOR: clan2 = {WARRIOR[5], WARRIOR[6], WARRIOR[7]};
set of WARRIOR: clan3 = {WARRIOR[8], WARRIOR[9]};
set of WARRIOR: clan4 = {WARRIOR[10], WARRIOR[11]};


%var set of WARRIOR: raid;% partida de ataque formada por el conjunto de guerreros seleccionados por el solver
set of warrior: raid = (clan2 intersect clan1 intersect clan4) union clan3);


%RESTRICCIONES
%constraint not(dummy in raid);
constraint (card(clan2 intersect clan1 intersect clan4) <= 2);
%raid = (clan2 intersect clan1 intersect clan4) union clan3);



%RESOLVER
var int: OBJ = sum(i in WARRIOR)(strength[i]);
solve maximize(OBJ);

%SALIDA
%array[1..u] of var raid: s;
output["raid = {"] ++ [show(raid[i]) ++ if i == u then "}; \n" else ", " endif | i in 1..u];