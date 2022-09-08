select * from aluno;

select (primeiro_nome || ' ' || ultimo_nome) as nome_completo 
from aluno;

select concat('Gabriel', ' ', null, 'Almeida');

select upper(concat('Gabriel', ' ', null));

select upper(concat('Gabriel', ' ', null, 'Almeida') || ' ' );

select trim(upper(concat('Gabriel', ' ', null, 'Almeida') || ' ' ));

select (primeiro_nome || ' ' || ultimo_nome) as nome_completo, 
	   (now()::date - data_nascimento)/ 365 as idade
       from aluno;
      
select (primeiro_nome || ' ' || ultimo_nome) as nome_completo,
	   AGE(data_nascimento) as idade
	   from aluno;

select (primeiro_nome || ' ' || ultimo_nome) as nome_completo,
	   extract (year from AGE(data_nascimento)) as idade
	   from aluno;
	  
-- Pi
	  
select pi() as numero_pi;

-- Valor absoluto

select @ -176 as valor_absoluto;

select now();

-- Convertendo now para date

select now()::date;

-- Transformando em string

select to_char(now(), 'DD/MM/YYYY'); 

select to_char(now(), 'DD, MONTH, YYYY');

select 128.3::REAL;

select to_char(128.3::real, '999D99'); 