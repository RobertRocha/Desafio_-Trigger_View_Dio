-- CRIANDO UM USUÁRIO MySQL
CREATE USER 'Gerente ' @LOCALHOST IDENTIFIED BY ' 1234 ' ;

-- DAR ACESSO AO USUÁRIO PARA UM BANCO ESPECÍFICO USANDO UMA TABELA ESPECÍFICA 
GRANT ALL PRIVILEGES ON company.V_NUM_EMPREGADOS_DEPART  TO ' gerente ' @LOCALHOST;
GRANT ALL PRIVILEGES ON company.V_DEPART_GERENTE TO ' gerente ' @LOCALHOST;
GRANT ALL PRIVILEGES ON company. V_PROJETOS_EMPREG TO ' gerente ' @LOCALHOST;
GRANT ALL PRIVILEGES ON company.V_PROJ_DEPART_GEREN TO ' gerente ' @LOCALHOST;
GRANT ALL PRIVILEGES ON company.V_EMPREG_DEPEND_GEREN TO ' gerente ' @LOCALHOST;

       
-- NÚMERO DE EMPREGADOS POR DEPARTAMENTO E LOCALIDADE
CREATE VIEW V_NUM_EMPREGADOS_DEPART AS 
SELECT department_name, location, COUNT(*) AS num_employees
FROM department
JOIN employee ON department.id = employee.department_id
GROUP BY department_name, location;

-- LISTA DE DEPARTAMENTOS E SEUS GERENTES
CREATE VIEW V_DEPART_GERENTE AS 
SELECT department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM department
JOIN employee AS manager ON department.manager_id = manager.id;

-- PROJETOS COM MAIOR NÚMERO DE EMPREGADOS ( COM ORDENAÇÃO DESC )
CREATE VIEW V_PROJETOS_EMPREG AS 
SELECT project_name, COUNT(*) AS num_employees
FROM project
JOIN employee_project ON project.id = employee_project.project_id
GROUP BY project_name
ORDER BY num_employees DESC;

-- LISTA DE PROJETOS, DEPARTAMENTOS E GERENTES
CREATE VIEW V_PROJ_DEPART_GEREN AS 
SELECT project_name, department_name, CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM project
JOIN department ON project.department_id = department.id
JOIN employee AS manager ON department.manager_id = manager.id;

-- QUAIS EMPREGADOS POSSUEM DEPENDENTES E SE SÃO GERENTES  
CREATE VIEW V_EMPREG_DEPEND_GEREN AS 
SELECT e.first_name, e.last_name, IFNULL(d.dependent_count, 0) AS dependent_count, IF(e.manager_id IS NOT NULL, 'Yes', 'No') AS is_manager
FROM employee AS e
LEFT JOIN (
SELECT employee_id, COUNT(*) AS dependent_count
FROM dependent
GROUP BY employee_id
) AS d ON e.id = d.employee_id;

















