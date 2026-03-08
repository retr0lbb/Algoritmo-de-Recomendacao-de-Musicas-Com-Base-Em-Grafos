create (m:Music {name: "Polaroid"});
create (g:Genre {name: "trap"});

MATCH (m:Music) WHERE (m.name = "Polaroid") MATCH (g:Genre) WHERE (g.name = "trap") CREATE (m)<-[r:HAS_GENRE]-(g);

create(a:Artist {name: "yunLi"})
create(u:User {name: "henry"})

MATCH(u:User {name: "henry"}) MATCH(m:Music {name:"Polaroid"}) CREATE (u)-[r:LISTEN {hours_listening: 100}]->(m);

//creating seed musics for YUNLI
WITH ["Polaroid", "Oxford Shoes", "Joias da familia", "Desgraca", "Sakura", "Old Schol", "Goddam"] AS musicas
UNWIND musicas AS nomeMusica
MERGE (m:Music {name: nomeMusica})
WITH m
MATCH (g:Genre {name: "trap"})
MATCH (a:Artist {name: "yunLi"})
MERGE (g)-[:HAS_GENRE]->(m)
MERGE (a)-[:COMPOSED]->(m);

// creating seed musics for Queen
WITH ["rock you", "killer Queen"] AS musicas
UNWIND musicas AS nomeMusica

MERGE (m:Music {name: nomeMusica})
MERGE (g:Genre {name: "rock"})
MERGE (a:Artist {name: "Queen"})

MERGE (g)-[:HAS_GENRE]->(m)
MERGE (a)-[:COMPOSED]->(m);

// creating seed musics for RAP
WITH ["many men", "in the club", "pimp"] AS musicas
UNWIND musicas AS nomeMusica

MERGE (m:Music {name: nomeMusica})
MERGE (g:Genre {name: "rap"})
MERGE (a:Artist {name: "50cent"})

MERGE (g)-[:HAS_GENRE]->(m)
MERGE (a)-[:COMPOSED]->(m);

//populating people
WITH ["caua", "silvio", "enzo", "noah", "gunter", "gerson", "alara", "monica", "taylor", "silvia", "alice"] AS pessoas
UNWIND pessoas AS nome
MERGE (u:User {name: nome})
RETURN u;

WITH ["caua", "silvio", "enzo", "noah", "gunter", "gerson", "alara", "monica", "taylor", "silvia", "alice"] AS pessoas
UNWIND pessoas AS nome
MATCH (u:User {name: nome})
MATCH (m:Music)
WITH u, m ORDER BY rand()
LIMIT 30
MERGE (u)-[:LISTENS {tempo: toInteger(rand()*300)}]->(m)



