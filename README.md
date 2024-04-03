# Personalizando acessos e automatizando ações no MySQL
 --  Parte 1  -- 
Personalizando acessos com views

Neste desafio você foi criado visões para os seguintes cenários

1-Número de empregados por departamento e localidade 2-Lista de departamentos e seus gerentes 3-Projetos com maior número de empregados (ex: por ordenação desc) 4-Lista de projetos, departamentos e gerentes 5-Quais empregados possuem dependentes e se são gerentes

Além disso, foram definidas as permissões de acesso as views de acordo com o tipo de conta de usuários.


--  Parte 2  -- 

A criação de triggers está associada a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers.

1 - Criação da Trigger de remoção: before delete 

2 - criação da Trigger de atualização: before update 

Remoção:  
Foi criado um gatilho para não perder as informações sobre os clientes. 

Atualização:  
Foi criado um gatilho para a atualização do salário base. 
