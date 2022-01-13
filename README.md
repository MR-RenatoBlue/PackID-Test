# PackID Test Instructions

#### Teste Desenvolvedor PackID
> Criar uma aplicação com autenticação que permita cadastro e controle de usuários, cadastro e controle
> de produtos e categorias. Deve contar com ao menos dois níveis de usuário, sendo ‘admin’ e
> ‘operator’.
> A finalidade deste projeto é apenas saber o nível de conhecimento, a qualidade do código e a
> capacidade de entrega.
> A avaliação por regra deve contar com:
1) Jobs background para operações do lado do servidor com a gem Sidekiq
2) Multiplo associamento de categorias para o produto
3) Cadastro e login utilizando as gems devise, rolify e cancancan
4) A versão do Rails deve ser 5.2
5) Atualização para o usuário utilizando web sockets (Action Cable)
6) Bootstrap 4 ou outra biblioteca CSS para ajudar no layout
7) Disponibilizar o código no GitHub
8) Utilizar o banco de dados PostgreSQL
9) Utilizar Jquery e componentes baseados nele para bibliotecas javascript
10) Validação de formulários para campos obrigatórios bem como formatos aceitos.
11) Usuário operador não pode operar e nem visualizar usuários a não ser o dele próprio.
12) Deve ser utilizado variáveis de ambiente para registros de senhas e acessos (db, email...)
#### Diferenciais:
1) Utilizar toaster para notificações
2) Utilizar componentes/ telas que entreguem melhor experiência ao usuário
3) Docker
4) Testes com rspec
5) Código limpo e comentado
6) Disponibilizar a aplicação para acesso remoto
7) Envio de emails de confirmação de cadastro e recuperar senha.

## Running the app
1. Clone this repository via git `gh` client with `bash`, run: 
```
$ gh repo clone MR-RenatoBlue/PackID-Test
```
2. Run:
```
$ docker-compose up -d
```
This will build and try to run the current stack, i.e.: 
```
Rails version 5.2.6
Postgresql version 12.1
Redis-server 5.0.7
```
Docker compose will then expose `PORT 3000` on the `localhost`
```
http://localhost:3000/
```
As we all know we'll have to run some migrations to open the app, but currently there's some issue with the script `init.sql`

So we have to add the `Postgresql role` by hand

3. Connect to the `Postgresql Server` via bash, run:
```
$ docker exec -tiu postgres gr-action-database-1 psql
```

4.  Then you'll have access to the postgresql CLI, run:
```
postgres=# CREATE USER mrblue;
postgres=# ALTER USER mrblue with SUPERUSER;
```
`Done.` We created the `mrblue` role

5. Then we can create, migrate and seed our DB via bash, run:
```
$ docker compose exec app bundle exec rake db:setup db:migrate
```
If we take a look at `db/seeds.rb`, we have:
```
puts "Creating first User as admin"
User.create(name: "admin@packid.com", password: "password" )
User.first.add_role :admin
```
That's because our app currently have two roles (`gem Rolify`): `admin` and `operator`, for each role we have some differences in matter of Authorization (`gem CanCanCan`). So via db:seeds we create the first User that has role admin

6. Use our credentials on `http://localhost:3000/users/sign_in`
```
email: admin@packid.com
password: "password"
```

7. On the `bootstrap 4.6` navbar go to `Categories` and create `two` or more categories

8. Go to `Products` and create a new one. You can add one or more categories to the same product
  - There's a client-sive JS validation on `Price` field, try it out.

9. `Logout` and go to `Sign Up` and create a new user sugestion: `operator1@packid.com`
 - When creating new users there's a call back on `User` model that assigns a default role: `operator`

10. Try to repeat steps `7.` and `8.`

11. Logout and Login again as `admin@packid.com` and click on `Users`
  
  We can see a list of users with email and roles displaying
  - Click on `Edit`

  We can change Users role and even destroy them.

###### Using Rails Console

Feel free to test it out via rails console. Run:
```
$ docker compose exec app rails console
```

###### New upcomming Features

If we take a look at branches there're some features under development: 
- `add images` to our resources 
- `live updates` with Action Cable

If you want to see in another repository too:
 - `pagination` with gem `pagy` and `search` feature [old version app](https://github.com/MR-RenatoBlue/Manage-System/blob/main/app/controllers/users_controller.rb)