INSERT INTO Curso (
  codigo, nome, nivel_ensino, carga_horaria, nro_vagas,
  frequencia_minima, nota_maxima, ementa, pre_requisitos,
  cidade_unidade, estado_unidade, pais_unidade,
  predio_unidade, sala_aula, laboratorio, projetor, lousa_digital,
  codigo_departamento
) VALUES
  ('BIO2024', 'Biologia', 'Graduação', 3200, 60, 75.0, 10.0,
   'Estudo dos seres vivos e ecossistemas', NULL,
   'Natal', 'RN', 'Brasil', 'Prédio C', 'Sala 204', TRUE, TRUE, FALSE, 'BIO'),

  ('ADM2024', 'Administração', 'Graduação', 3400, 100, 70.0, 10.0,
   'Gestão empresarial, marketing e finanças', NULL,
   'São Paulo', 'SP', 'Brasil', 'Bloco D', 'Sala 105', FALSE, TRUE, TRUE, 'ADM'),

  ('ENGC24', 'Engenharia Civil', 'Graduação', 4000, 80, 75.0, 10.0,
   'Materiais de construção, cálculo estrutural', 'Física, Matemática',
   'Belo Horizonte', 'MG', 'Brasil', 'Bloco A', 'Sala 301', TRUE, TRUE, TRUE, 'ENGC'),

  ('PSI2024', 'Psicologia', 'Graduação', 3200, 70, 80.0, 10.0,
   'Processos mentais e comportamento humano', NULL,
   'Salvador', 'BA', 'Brasil', 'Bloco E', 'Sala 210', FALSE, FALSE, TRUE, 'PSI'),

  ('ECO2024', 'Economia', 'Graduação', 3500, 90, 75.0, 10.0,
   'Macroeconomia, microeconomia, políticas públicas', NULL,
   'Curitiba', 'PR', 'Brasil', 'Prédio F', 'Sala 110', FALSE, TRUE, TRUE, 'ECON'),
   
   ('PED2024', 'Pedagogia', 'Graduação', 3000, 60, 75.0, 10.0,
   'Educação infantil, práticas pedagógicas', NULL,
   'Campinas', 'SP', 'Brasil', 'Prédio G', 'Sala 108', FALSE, TRUE, TRUE, 'PED'),

  ('MUS2024', 'Música', 'Graduação', 2800, 40, 70.0, 10.0,
   'História da música, prática instrumental', NULL,
   'Florianópolis', 'SC', 'Brasil', 'Bloco H', 'Sala 120', TRUE, TRUE, FALSE, 'MUS'),

  ('LET2024', 'Letras – Português', 'Graduação', 3200, 80, 75.0, 10.0,
   'Gramática, literatura brasileira e redação', NULL,
   'Belém', 'PA', 'Brasil', 'Prédio I', 'Sala 301', FALSE, TRUE, TRUE, 'LET'),

  ('SOC2024', 'Sociologia', 'Graduação', 3100, 50, 70.0, 10.0,
   'Teorias sociológicas, estrutura social', NULL,
   'João Pessoa', 'PB', 'Brasil', 'Bloco J', 'Sala 215', FALSE, TRUE, TRUE, 'SOC'),

  ('ART2024', 'Artes Visuais', 'Graduação', 2900, 45, 70.0, 10.0,
   'Desenho, pintura, história da arte', NULL,
   'Maceió', 'AL', 'Brasil', 'Prédio K', 'Sala 102', TRUE, TRUE, FALSE, 'ART');
