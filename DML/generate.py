import faker
import random
from datetime import datetime, timedelta

# Initialize Faker
fake = faker.Faker('pt_BR')

NUM_USUARIOS = 10000
NUM_CURSOS = 20
NUM_DEPARTAMENTOS = 6
NUM_DISCIPLINAS = 100
NUM_MATRICULAS = 50000
NUM_AVALIACOES = 20000
NUM_AVISOS = 500
NUM_MENSAGENS = 10000

def generate_usuarios(n):
    usuarios = []
    for i in range(1, n + 1):
        user_id = f'U{i:03}'
        nome = fake.first_name().replace("'", "''")
        sobrenome = fake.last_name().replace("'", "''")
        telefone = fake.phone_number()
        rua = fake.street_name().replace("'", "''")
        nro = fake.building_number()
        cep = fake.postcode()
        cidade = fake.city().replace("'", "''")
        data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime('%Y-%m-%d')
        sexo = random.choice(['M', 'F'])
        email = f"{nome.lower()}.{sobrenome.lower()}@{fake.free_email_domain()}".replace("'", "''")
        senha = fake.password().replace("'", "''")
        cidade_unidade = cidade
        estado_unidade = fake.state().replace("'", "''")
        pais_unidade = 'Brasil'
        predio_unidade = f'Predio {random.choice(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])}'

        usuarios.append((user_id, nome, sobrenome, telefone, rua, nro, cep, cidade, data_nascimento, sexo, email, senha, cidade_unidade, estado_unidade, pais_unidade, predio_unidade))
    return usuarios

def generate_departamentos(n, professores):
    departamentos = []
    chefe_ids = random.sample([p[0] for p in professores], n)
    for i in range(1, n + 1):
        codigo = f'DEP{i:03}'
        nome = f'Departamento de {fake.sentence(nb_words=2)}'.replace("'", "''")
        chefe_id = chefe_ids[i-1]
        departamentos.append((codigo, nome, chefe_id))
    return departamentos

def generate_cursos(n, departamentos):
    cursos = []
    for i in range(1, n + 1):
        codigo = f'C{i:03}'
        nome = f"Curso de {fake.bs()[:34]}".replace("'", "''")
        nivel_ensino = random.choice(['Graduação', 'Pós-Graduação'])
        carga_horaria = random.choice([30, 45, 60, 90])
        nro_vagas = random.randint(20, 100)
        frequencia_minima = 75.00
        nota_maxima = 10.00
        ementa = fake.sentence(nb_words=2).replace("'", "''")
        cidade_unidade = fake.city().replace("'", "''")
        estado_unidade = fake.state_abbr()
        pais_unidade = 'Brasil'
        predio_unidade = f'Predio {random.choice(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])}'
        codigo_departamento = random.choice([d[0] for d in departamentos])
        cursos.append((codigo, nome, nivel_ensino, carga_horaria, nro_vagas, frequencia_minima, nota_maxima, ementa, cidade_unidade, estado_unidade, pais_unidade, predio_unidade, codigo_departamento))
    return cursos

def generate_disciplinas(n, cursos):
    disciplinas = []
    for i in range(1, n + 1):
        codigo = f'D{i:03}'
        nome = f'Disciplina de {fake.job()[:34]}'.replace("'", "''")
        limite_vagas = random.randint(20, 50)
        cidade_unidade = fake.city().replace("'", "''")
        estado_unidade = fake.state_abbr()
        pais_unidade = 'Brasil'
        predio_unidade = f'Predio {random.choice(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])}'
        codigo_curso = random.choice([c[0] for c in cursos])
        disciplinas.append((codigo, nome, limite_vagas, cidade_unidade, estado_unidade, pais_unidade, predio_unidade, codigo_curso))
    return disciplinas

def generate_matriculas(n, alunos, disciplinas):
    matriculas = []
    par = set()
    for _ in range(n):
        aluno_id = random.choice([a[0] for a in alunos])
        disciplina_id = random.choice([d[0] for d in disciplinas])
        if (aluno_id, disciplina_id) in par:
            continue
        data_matricula = (datetime.now() - timedelta(days=random.randint(1, 365))).strftime('%Y-%m-%d')
        status = random.choice(['Matriculado', 'Concluído', 'Cancelado', 'Pendente'])
        bolsa_desconto = round(random.uniform(0, 50), 2)
        confirmada = status in ['Matriculado', 'Concluído']
        cancelada = status == 'Cancelado'
        par.add((aluno_id, disciplina_id))
        matriculas.append((aluno_id, disciplina_id, data_matricula, status, bolsa_desconto, confirmada, cancelada))
    return matriculas

usuarios = generate_usuarios(NUM_USUARIOS)
user_ids = [u[0] for u in usuarios]

random.shuffle(usuarios)
num_professores = int(NUM_USUARIOS * 0.05)
num_admins = int(NUM_USUARIOS * 0.01)
professores = usuarios[:num_professores]
administradores = usuarios[num_professores:num_professores + num_admins]
alunos = usuarios[num_professores + num_admins:]

departamentos = generate_departamentos(NUM_DEPARTAMENTOS, professores)

cursos = generate_cursos(NUM_CURSOS, departamentos)
curso_codes = [c[0] for c in cursos]

disciplinas = generate_disciplinas(NUM_DISCIPLINAS, cursos)
disciplina_codes = [d[0] for d in disciplinas]

matriculas = generate_matriculas(NUM_MATRICULAS, alunos, disciplinas)


with open("dados_insert_index.sql", "w", encoding="utf-8") as f:
    usuarios_values = []
    professores_values = []
    alunos_values = []
    administradores_values = []
    departamentos_values = []
    cursos_values = []
    curso_prerequisito_values = []
    disciplinas_values = []
    disciplina_material_values = []
    disciplina_horario_values = []
    infraestrutura_values = []
    matricula_disciplina_values = []
    matricula_nota_values = []
    gestao_values = []
    matricula_gestao_values = []
    avaliar_values = []
    enviar_aviso_values = []
    enviar_mensagem_values = []
    ministrar_values = []

    # Usuarios
    for u in usuarios:
        usuarios_values.append(f"('{u[0]}', '{u[1]}', '{u[2]}', '{u[3]}', '{u[4]}', '{u[5]}', '{u[6]}', '{u[7]}', '{u[8]}', '{u[9]}', '{u[10]}', '{u[11]}', '{u[12]}', '{u[13]}', '{u[14]}', '{u[15]}')")

    # Professores
    for p in professores:
        especializacao = fake.job().replace("'", "''")
        titulacao = random.choice(['Mestre', 'Doutor', 'Pós-Doutor'])
        professores_values.append(f"('{p[0]}', '{especializacao}', '{titulacao}')")

    # Alunos
    for a in alunos:
        nome_curso = random.choice([c[1] for c in cursos]).replace("'", "''")
        ano_ingresso = random.randint(2018, 2024)
        alunos_values.append(f"('{a[0]}', '{nome_curso}', {ano_ingresso})")

    # Administradores
    for admin in administradores:
        administradores_values.append(f"('{admin[0]}')")

    # Departamentos
    for d in departamentos:
        departamentos_values.append(f"('{d[0]}', '{d[1]}', '{d[2]}')")

    # Cursos
    for c in cursos:
        cursos_values.append(f"('{c[0]}', '{c[1]}', '{c[2]}', {c[3]}, {c[4]}, {c[5]}, {c[6]}, '{c[7]}', '{c[8]}', '{c[9]}', '{c[10]}', '{c[11]}', '{c[12]}')")

    # Curso_PreRequisito
    for c_code in curso_codes:
        if random.random() > 0.5:
            prereq_name = random.choice([c[1] for c in cursos if c[0] != c_code]).replace("'", "''")
            curso_prerequisito_values.append(f"('{c_code}', '{prereq_name}')")

    # Disciplinas
    for d in disciplinas:
        disciplinas_values.append(f"('{d[0]}', '{d[1]}', {d[2]}, '{d[3]}', '{d[4]}', '{d[5]}', '{d[6]}', '{d[7]}')")

    # Disciplina_Material
    for d_code in disciplina_codes:
        material_type = random.choice(['Livro', 'Slides', 'Artigo', 'Apostila'])
        material_name = f"{material_type}: {fake.sentence(nb_words=2)}".replace("'", "''")
        disciplina_material_values.append(f"('{d_code}', '{material_name}')")

    # Disciplina_Horario
    dias_semana = ['Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira']
    horarios = ['08:00-10:00', '10:00-12:00', '14:00-16:00', '16:00-18:00', '19:00-21:00']
    for d_code in disciplina_codes:
        horario = f"{random.choice(dias_semana)} {random.choice(horarios)}"
        disciplina_horario_values.append(f"('{d_code}', '{horario}')")

    # Infraestrutura
    for i, c_code in enumerate(curso_codes):
        sala = f"Sala {101 + i}"
        has_lab = random.choice([True, False])
        has_projetor = random.choice([True, False])
        has_lousa = random.choice([True, False])
        infraestrutura_values.append(f"('{c_code}', '{sala}', {has_lab}, {has_projetor}, {has_lousa})")

    # Matricula_Disciplina
    for m in matriculas:
        matricula_disciplina_values.append(f"('{m[0]}', '{m[1]}', '{m[2]}', '{m[3]}', {m[4]}, {m[5]}, {m[6]})")

    # Matricula_Nota e Matricula_Gestao
    for i, m in enumerate(matriculas):
        if m[3] == 'Concluído':
            nota_id = f'N{i:04}'
            tipo_nota = random.choice(['Prova 1', 'Prova 2', 'Trabalho', 'Projeto Final']).replace("'", "''")
            valor = round(random.uniform(5, 10), 2)
            matricula_nota_values.append(f"('{nota_id}', '{m[0]}', '{m[1]}', '{tipo_nota}', {valor})")

        gestao_id = f'G{i:04}'
        status = random.choice(['Concluído','Pendente', 'Cancelado', 'Em andamento'])
        admin_id = random.choice([a[0] for a in administradores])
        gestao_values.append(f"('{gestao_id}', 'Matricula', '{status}', '{admin_id}')")
        matricula_gestao_values.append(f"('{m[0]}', '{m[1]}', '{gestao_id}')")

    # Avaliar
    avaliacoes_records = set()
    for _ in range(NUM_AVALIACOES):
        aluno_id = random.choice([a[0] for a in alunos])
        prof_id = random.choice([p[0] for p in professores])
        if (aluno_id, prof_id) not in avaliacoes_records:
            comentario = fake.sentence(nb_words=2).replace("'", "''")
            nota_geral = round(random.uniform(1, 5), 2)
            nota_material = round(random.uniform(1, 5), 2)
            grau_relevancia = round(random.uniform(1, 5), 2)
            nota_infra = round(random.uniform(1, 5), 2)
            avaliar_values.append(f"('{aluno_id}', '{prof_id}', '{comentario}', {nota_geral}, {nota_material}, {grau_relevancia}, {nota_infra})")
            avaliacoes_records.add((aluno_id, prof_id))

    # Enviar_Aviso
    for i in range(NUM_AVISOS):
        aviso_id = f'A{i:03}'
        texto = fake.sentence(nb_words=2).replace("'", "''")
        timestamp = (datetime.now() - timedelta(days=random.randint(1, 30))).strftime('%Y-%m-%d %H:%M:%S')
        admin_id = random.choice([a[0] for a in administradores])
        destinatario_id = random.choice(user_ids)
        enviar_aviso_values.append(f"('{aviso_id}', '{texto}', '{timestamp}', '{admin_id}', '{destinatario_id}')")

    # Enviar_Mensagem
    for i in range(NUM_MENSAGENS):
        msg_id = f'M{i:04}'
        mensagem = fake.sentence(nb_words=2).replace("'", "''")
        timestamp = (datetime.now() - timedelta(minutes=random.randint(1, 525600))).strftime('%Y-%m-%d %H:%M:%S')
        remetente_id = random.choice(user_ids)
        destinatario_id = random.choice([uid for uid in user_ids if uid != remetente_id])
        enviar_mensagem_values.append(f"('{msg_id}', '{mensagem}', '{timestamp}', '{remetente_id}', '{destinatario_id}')")

    # Ministrar
    ministrar_records = set()
    for d_code in disciplina_codes:
        prof_id = random.choice([p[0] for p in professores])
        gestao_id = f'G{len(matriculas) + len(ministrar_records):04}' # Unique gestao_id
        if (prof_id, d_code) not in ministrar_records:
            admin_id = random.choice([a[0] for a in administradores])
            gestao_values.append(f"('{gestao_id}', 'Atribuição de docente', 'Concluído', '{admin_id}')")
            ministrar_values.append(f"('{prof_id}', '{d_code}', '{gestao_id}')")
            ministrar_records.add((prof_id, d_code))


    f.write("INSERT INTO Usuario VALUES\n" + ",\n".join(usuarios_values) + ";\n\n")
    f.write("INSERT INTO Professor VALUES\n" + ",\n".join(professores_values) + ";\n\n")
    f.write("INSERT INTO Aluno VALUES\n" + ",\n".join(alunos_values) + ";\n\n")
    f.write("INSERT INTO Administrador VALUES\n" + ",\n".join(administradores_values) + ";\n\n")
    f.write("INSERT INTO Departamento VALUES\n" + ",\n".join(departamentos_values) + ";\n\n")
    f.write("INSERT INTO Curso VALUES\n" + ",\n".join(cursos_values) + ";\n\n")
    f.write("INSERT INTO Curso_PreRequisito VALUES\n" + ",\n".join(curso_prerequisito_values) + ";\n\n")
    f.write("INSERT INTO Disciplina VALUES\n" + ",\n".join(disciplinas_values) + ";\n\n")
    f.write("INSERT INTO Disciplina_Material VALUES\n" + ",\n".join(disciplina_material_values) + ";\n\n")
    f.write("INSERT INTO Disciplina_Horario VALUES\n" + ",\n".join(disciplina_horario_values) + ";\n\n")
    f.write("INSERT INTO Infraestrutura VALUES\n" + ",\n".join(infraestrutura_values) + ";\n\n")
    f.write("INSERT INTO Matricula_Disciplina VALUES\n" + ",\n".join(matricula_disciplina_values) + ";\n\n")
    f.write("INSERT INTO Gestao VALUES\n" + ",\n".join(gestao_values) + ";\n\n")
    f.write("INSERT INTO Matricula_Nota VALUES\n" + ",\n".join(matricula_nota_values) + ";\n\n")
    f.write("INSERT INTO Matricula_Gestao VALUES\n" + ",\n".join(matricula_gestao_values) + ";\n\n")
    f.write("INSERT INTO Avaliar VALUES\n" + ",\n".join(avaliar_values) + ";\n\n")
    f.write("INSERT INTO Enviar_Aviso VALUES\n" + ",\n".join(enviar_aviso_values) + ";\n\n")
    f.write("INSERT INTO Enviar_Mensagem VALUES\n" + ",\n".join(enviar_mensagem_values) + ";\n\n")
    f.write("INSERT INTO Ministrar VALUES\n" + ",\n".join(ministrar_values) + ";\n\n")
print("Script gerado com successo.")
